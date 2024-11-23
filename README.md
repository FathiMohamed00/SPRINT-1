Sprint1 -------- avec framework Flask

Flask avec Docker :
1. git clone https://github.com/FathiMohamed00/SPRINT-1.git
2. sudo apt install python3
3. sudo apt install pyhton3-pip
4. docker pull mysql:8.0
5. docker pull phpmyadmin/phpmyadmin
6. docker pull python:3.9-slim
7. SI BESOIN ALLER DANS "Sprint1" et: python3 -m venv venv
                                      source venv/bin/activate
                                      pip install -r requirements.txt
  Sinon directement mettre "pip install -r requirements.txt"
8. Aller dans le dossier "SPRINT-1" et mettre "docker-compose up -d"
   On pourra vérifier l'état des dockers avec "docker ps"
9. Aller à l'adresse "127.0.0.1:8080" et importer le fichier "project.sql" dans la base de donnée "project"
10. Aller à l'adresse "127.0.0.1:5000" et créer son compte


