from django.shortcuts import render

# Vue pour la page de connexion
def connexion(request):
    return render(request, 'connexion.html')

# Vue pour la page d'ouverture de compte
def ouverturedecompte(request):
    return render(request, 'ouverturedecompte.html')

# Vue pour la page après connexion
def connecte(request):
    return render(request, 'connecte.html')
