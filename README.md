Sprint 1 -------- sans framework

Sprint -------- avec framework mais pas fini (flask et django)
Creer un environnement virtuel sur Windows:
1. Installer Xampp et lancer apache et MySQL
2. Installer Python
3. Aller depuis le cmd dans le dossier "Sprint"   
4. Mettre la commande "python -m venv venv"
5. Mettre la commande "venv\Scripts\activate" et installé "pip install -r requirements.txt" pour installé ce qu'il faut sans tout réécrire à la main mais cela ne fonctionne pas, suivez les étapes
6. Installer Django et Flask "pip install flask" et "pip install django"
7. Installer mysql "pip install flask-mysqldb"
8. Lancer "python app.py"
9. Ouvrir un deuxieme CMD et lancer le serveur django et flask "python manage.py runserver" et "flask run"
10. Faire les modifications dans le deuxième terminal car le premier sert de log pour le serveur Flask
11. Quitter l'environnement "deactivate"
