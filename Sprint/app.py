from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL
from werkzeug.security import check_password_hash, generate_password_hash
import os

app = Flask(__name__)

# Configurer la connexion MySQL
app.config['MYSQL_HOST'] = 'localhost'  # Adresse de ton serveur MySQL
app.config['MYSQL_USER'] = 'root'       # Ton utilisateur MySQL
app.config['MYSQL_PASSWORD'] = ''  # Ton mot de passe MySQL
app.config['MYSQL_DB'] = 'project'  # Le nom de la base de données
app.secret_key = os.urandom(24)  # génère une clé secrète aléatoire de 24 octets
mysql = MySQL(app)

# Route de connexion qui traite le formulaire
@app.route('/', methods=['GET', 'POST'])
def connexion():
    if request.method == 'POST':
        # Récupérer les informations du formulaire
        email = request.form['email']
        password = request.form['password']
        
        try:
            # Connexion à la base de données MySQL
            cur = mysql.connection.cursor()
            cur.execute("SELECT * FROM UserAccounts WHERE email = %s", [email])
            user = cur.fetchone()  # Récupérer l'utilisateur correspondant
            
            # Si l'utilisateur existe et que le mot de passe est correct
            if user and check_password_hash(user[4], password):  # user[4] est le mot de passe hashé
                flash("Connexion réussie", "success")
                return redirect(url_for('connecte'))  # Rediriger vers la page 'connecte'
            else:
                flash("Identifiants incorrects. Essayez de nouveau.", "danger")
                return redirect(url_for('connexion'))  # Rediriger vers la page de connexion
        except Exception as e:
            flash(f"Erreur lors de la connexion à la base de données : {str(e)}", "danger")
            return redirect(url_for('connexion'))  # Rediriger vers la page de connexion
    
    # Si la méthode n'est pas POST, afficher la page de connexion
    return render_template('connexion.html')



@app.route('/ouverturedecompte', methods=['GET', 'POST'])
def ouverturedecompte():
    if request.method == 'POST':
        # Traitement du formulaire d'inscription
        nom = request.form['nom']
        prenom = request.form['prenom']
        email = request.form['email']
        password = request.form['password']
        
        try:
            # Vérifier si l'email existe déjà
            cur = mysql.connection.cursor()
            cur.execute("SELECT * FROM UserAccounts WHERE email = %s", [email])
            existing_user = cur.fetchone()
            
            if existing_user:
                flash("Cet email est déjà utilisé. Essayez avec un autre.", "danger")
                return redirect(url_for('ouverturedecompte'))  # Rediriger vers le formulaire d'inscription

            # Hacher le mot de passe avant de l'enregistrer
            hashed_password = generate_password_hash(password)
            
            # Connexion à la base de données MySQL pour insérer l'utilisateur
            cur.execute("INSERT INTO UserAccounts (nom, prenom, email, password) VALUES (%s, %s, %s, %s)", 
                        (nom, prenom, email, hashed_password))
            mysql.connection.commit()  # Valider l'insertion
            cur.close()
            
            flash("Votre compte a été créé avec succès. Vous pouvez maintenant vous connecter.", "success")
            return redirect(url_for('connexion'))  # Rediriger vers la page de connexion
        except Exception as e:
            flash(f"Erreur lors de l'inscription : {str(e)}", "danger")
            return redirect(url_for('ouverturedecompte'))  # Rediriger vers la page d'inscription
    return render_template('ouverturedecompte.html')

@app.route('/connecte', methods=['GET', 'POST'])
def connecte():
    return render_template('connecte.html')



if __name__ == '__main__':
    app.run(debug=True)
