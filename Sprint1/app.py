from flask import Flask, render_template, request, redirect, url_for, session, flash
from flask_sqlalchemy import SQLAlchemy
from werkzeug.security import generate_password_hash, check_password_hash
import os

app = Flask(__name__)

app.secret_key = os.urandom(24)  # Clé secrète générée aléatoirement

# Configuration pour MySQL
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root@localhost/project'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

# Modèle de la table utilisateur
class UserAccount(db.Model):
    __tablename__ = 'useraccounts'

    id = db.Column(db.Integer, primary_key=True)
    nom = db.Column(db.String(50), nullable=False)
    prenom = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(100), unique=True, nullable=False)
    password = db.Column(db.String(200), nullable=False)

# Fonction pour valider les mots de passe
def validate_password(password):
    if len(password) < 8:
        return "Le mot de passe doit contenir au moins 8 caractères."
    if not any(char.isupper() for char in password):
        return "Le mot de passe doit contenir au moins une lettre majuscule."
    if not any(char.isdigit() for char in password):
        return "Le mot de passe doit contenir au moins un chiffre."
    if not any(char in "!@#$%^&*()-_=+[]{}|;:'\",.<>?/`~" for char in password):
        return "Le mot de passe doit contenir au moins un caractère spécial."
    return None

@app.route("/", methods=["GET", "POST"])
def connexion():
    if "user_id" in session:
        return redirect(url_for("connecte"))

    if request.method == "POST":
        email = request.form["email"]
        password = request.form["password"]

        user = UserAccount.query.filter_by(email=email).first()
        if user and check_password_hash(user.password, password):
            session["user_id"] = user.id
            session["user_name"] = user.nom
            return redirect(url_for("connecte"))
        else:
            flash("Identifiants incorrects.", "error")
    return render_template("connexion.html")

@app.route("/connecte")
def connecte():
    if "user_id" not in session:
        return redirect(url_for("connexion"))
    return render_template("connecte.html", nom=session["user_name"])

@app.route("/ouverturedecompte", methods=["GET", "POST"])
def ouverturedecompte():
    if request.method == "POST":
        nom = request.form["nom"]
        prenom = request.form["prenom"]
        email = request.form["email"]
        password = request.form["password"]

        error = validate_password(password)
        if error:
            flash(error, "error")
            return redirect(url_for("ouverturedecompte"))

        hashed_password = generate_password_hash(password)

        if UserAccount.query.filter_by(email=email).first():
            flash("Un compte avec cet email existe déjà.", "error")
            return redirect(url_for("ouverturedecompte"))

        new_user = UserAccount(nom=nom, prenom=prenom, email=email, password=hashed_password)
        db.session.add(new_user)
        db.session.commit()

        flash("Compte créé avec succès. Veuillez vous connecter.", "success")
        return redirect(url_for("connexion"))

    return render_template("ouverturedecompte.html")

# Route pour la déconnexion
@app.route("/deconnexion", methods=["GET", "POST"])
def deconnexion():
    if request.method == "POST":
        session.clear()  # Supprimer les informations de session (déconnexion)
        flash("Déconnexion réussie.", "success")
        # Rediriger vers la page de déconnexion
        return redirect(url_for("deconnexion"))

    # Si la méthode est GET, on affiche la page de déconnexion
    return render_template("deconnexion.html")


if __name__ == "__main__":
    app.run(debug=True)
