func main(){

  debutPartie()
  var numJoueur : String = "J1"
  //var carte : Carte
  var action : String
  var fin : Bool = finPartie()

  while !fin
  {
    //préposition
    debutTour(j : numJoueur)
    //action
    action=choixAction()
    print(action)
    numJoueur="J2"
    fin=true
 }
}

func debutPartie()
{
  //initialisation plateau
}

func finPartie()->Bool
{
  return false
}

func debutTour(j : String){
  print("Joueur "+j+", vos cartes sont remises en position défense et vous piochez une carte :\n")
  //carte=premierPioche()
  //ajouterMain(carte)
  //piocher()
  //print("carte "+nom(carte)+" de défense "+defense(carte)+" et d'attaque "+attaque(carte)+"\n")
}

func choixAction()->String {
  print("Voulez vous : 1-Ne rien faire\n 2-déployer une carte\n 3-attaquer")
  try return readLine()
}

main()

//algo francais :
//attention !!!! gerer conscription ! et si peut pas alors fin partie !
initialise plateau
//main joueur 1 roi, CB vide, pioche 20 cartes
deroulement tour : //joueur J
  //1-Préparation
  si piocheNonVide :
    joueur pioche
    si CB non vide :
      redresserCartes
  sinon :
    si piochevide du joueur 2 :
      motif="plus de pioches"
      gagnant=celui NbCartesRoyaume>autre
      fin=true //arret de partie par fin de guerre

  //2-action
  joueur choisi action € (rien, déployé, attaqué)

  si choix=deploye
    afficher("vous voulez mettre laquelle sur votre champ de bataille ?")
    afficher les cartes de sa main
    carte=choixfait
    afficher("vous voulez la mettre dans quelle case ?")
    J.ajouterCarteCB(carte,case)

  sinon si choix=attaquer
    reponse=oui //attaquer
    while nbreCarteDefenseCB!=0 et reponse=oui
      afficher("vous voulez attaquer avec quelle carte ?")
      afficher les cartes du champ de bataille en etat defense
      carte=choixfait1
      afficher("vous voulez attaquer quelle case adverse ?")
      case=choixfait2

      si case atteignable et case nonvide:
        mettre carte en mode attaque //attention a etat de carte adverse attaque ou defense
        si point defense = point attaque ET point degat avant ==0 : //premiere cible
            carte adverse dans royaume J
            si carte adverse = roi : //fin partie par execution
              motif=("execution du roi")
              gagnant=joueur actuel
              fin =true //faire arreter la boucle direct
        sinon si point defense > point attaque ET pointdefense + point degat avant < point attaque :
              enregistrer degat
        sinon :
          carte adverse cimetiere

      sinon si case non atteignable:
        afficher ("case non atteignable")

      sinon si case vide:
        afficher ("case vide")
      fin si

      afficher("voulez vous en attaquer une autre ?")
      si reponsequestion = non :
        reponse=non //fin boucle
    fin while
    si nbreCarteDefenseCB==0 :
      afficher("vous n'avez plus assez de cartes pour attaquer")
    fin si
  fin si

  //3-developpement
  si J.nbreCarteMain>6 :
    afficher("vous devez mettre une carte dans votre royaume")
    afficher("vous voulez mettre laquelle ?")
    afficher les cartes de sa main
    carte=choixfait
    J.ajouterCarteRoyaume(carte)
  sinon si J.videCarteMain :
    afficher("vous navez plus de cartes")
  sinon :
    afficher("voulez vous mettre une carte dans votre royaume")
    si reponse = oui
      afficher("vous voulez mettre laquelle ?")
      afficher les cartes de sa main
      carte=choixfait
      J.ajouterCarteRoyaume(carte)
  fin si
  afficher("J vous avez fini de jouer, au tour du joueur J?")
  joueur=J2


  //fin partie
  si effondrement ou execution ou ou fin deguerre :
    fin=true
  finsi
finwhile

afficher("partie terminé"+motif+"le gagnant est"+gagnant)
