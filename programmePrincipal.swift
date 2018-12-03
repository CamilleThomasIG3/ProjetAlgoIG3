//demande un message à l'utilisateur et renvoie sa réponse
//donnee : message est la question demandée à l'utilisateur
//resultat : renvoie la réponse de l'utilisateur ou une erreure si sa réponse n'est pas bonne
func saisieUtilisateur(message : String)->String
{
  print(message+"\n")
  guard let res : String = readLine()
  else{ fatalError("vous ne répondez pas correctement à la question")}
  return res
}

//affiche une carte en donnant son noms et ses points de defense et d'attaque
func afficherCarte(carte : c)
{
  print("carte "+c.nom()+" de défense "+c.defense()+" et d'attaque "+c.attaque()+"\n")
}

func afficherCarteCB(carte : c)
{
  print("carte "+c.nom()+" de défense "+c.defense()+" et d'attaque "+c.attaque()+"et en case"+c.getPosition()+"\n")
}

//prepare un tour en faisant piocher le joueur et en redressant ses cartes qui etaient en attaque sur son CB
func preparation(p : inout Partie){
  if p.J1().pioche().piocheVide()//alors lautre aussi car on pioche une carte par tour
  {
    p.setMotifFin(nvMotifFin : "les pioches des 2 joueurs sont vides")
    if p.J1().royaume().tailleRoyaume()>p.J2().royaume().tailleRoyaume()
    {
      p.setGagnant(nvGagnant : "J1")
    }
    else if p.J1().royaume().tailleRoyaume()<p.J2().royaume().tailleRoyaume()
    {
      p.setGagnant(nvGagnant : "J2")
    }
    else {p.setGagnant(nvGagnant : "egalité")}
    p.setFin(nvFin : true)
  }
  else
  {
    var carte : Carte
    carte = p.joueurCourant().pioche().premierPioche()
    p.joueurCourant().main().ajouterCarte(carte : carte) //met la premiere carte de la pioche dans la main
    p.joueurCourant().pioche().piocher() //enleve la carte de la pioche
    p.joueurCourant().champsBataille().redresserCarte()
    print("Joueur "+p.joueurCourant()+", vos cartes sont remises en position défense et vous piochez une carte :\n")
    afficherCarte(carte : carte)
}

//permet au joueurCourant de deployer une carte de son choix si cela est possible
func deployer(p : inout Partie)
{
  if p.joueurCourant().champsBataille().nbCarteChamp()<6 //encore de la place sur CB
  {
    for c in p.joueurCourant().main() //parcours des cartes grace à l'iterateur de Main
    {
      afficherCarte(carte : c)
    }
    rep1 : String = saisieUtilisateur("Quelle nom de carte voulez-vous mettre sur votre champs de Bataille ?")
    rep2 : String = saisieUtilisateur("avec quel point de défense ?")
    rep3 : String = saisieUtilisateur("avec quel point d'attaque ?")
    repeat
    {
      rep4 : String = saisieUtilisateur("en quelle case voulez-vous la placer F1, F2, F3, A1, A2, ou A3 ?")
    }while p.joueurCourant().champsBataille().getCase(nom : rep4).etatCase //case occupée
    p.joueurCourant().champsBataille().insererCarte(c : getCase(nom : rep4)) //met la case en etat occupé
    p.joueurCourant().main().getCarte(nom : rep1, defense : Int(rep2), attaque : Int(rep3)).setPosition(nvNom : rep4)//change la position de la carte
    p.joueurCourant().main().enleverMain(carte : getCarte(nom : rep1, defense : Int(rep2), attaque : Int(rep3)))
  }
  else {
    print("Votre champs de Bataille est déjà plein, tant pis vous ne ferez rien")
  }
}

//permet au joueurCourant d'attaquer autant de fois qu'il veut et si cela est possible
func attaquer(p : inout Partie)
{
  var attaque : Bool = true //le joueur veut attaquer
  while attaque && p.joueurCourant().champsBataille().NbreCarteDefensechamp()!=0
  //tant que le joueur veut attaquer et qu'il reste des cartes en mode defense sur son CB
  {
    for c in p.joueurCourant().champsBataille() //parcours des cartes grace à l'iterateur de CB
    {
      if !c.etatCarte() //carte en defense
      {
        afficherCarteCB(carte : c)
      }
    }
    rep1 : String = saisieUtilisateur("La carte avec laquelle vous voulez attaquer est sur quelle case?")
    if joueurCourant()=="J1"
    {
      var essai : Int =0
      repeat
      {
        rep2 : String = saisieUtilisateur("Quelle case adverse voulez-vous attaquer F1, F2, F3, A1, A2, ou A3 ?")
        essai+=1 ///A REFAIRE A PARTIR DICI CAR REP EN MOINS ET getCarte En plus !
      }while (!p.J2().champsBataille().getCase(nom : rep2).etatCase() || !p.J1().champsBataille().caseAtteignable(caseDep : p.J1().champsBataille().getCase(nom : rep4) , caseArr : p.J2().champsBataille().getCase(nom : rep5), nomCarte : rep1)) && essai<6
      //TQ case adverse occupée et non atteignable par la carte choisi comme attaque et qu'on a essayé moins de 6 fois
      if (!p.J2().champsBataille().getCase(nom : rep5).etatCase() || !p.J1().champsBataille().caseAtteignable(caseDep : p.J1().champsBataille().getCase(nom : rep4) , caseArr : p.J2().champsBataille().getCase(nom : rep5), nomCarte : rep1)) && essai=6
      {
          //il ne peut pas attaquer avec cette carte
      }
      else
      {
        p.joueurCourant().champsBataille().getCarte()
      }
    }
    else
    {

    }
  }
}


func main(){
  var partie = Partie() //initialise la partie avec 2 joueurs et des conditions de fin
  partie.setJoueurCourant(j : "J1")

  while !partie.getFin()//tant que la partie n'est pas terminée
  {
    //préparation
    preparation(p : &partie)

    //action
    var reponse : String = saisieUtilisateur("choisissez une action : 1-ne rien faire\n2-déployer une carte\n3-attaquer l'adversaire")
    if reponse=="2"//déployer
    {
      deployer(p : &partie)
    }
    else if reponse=="3" //attaquer
    {
      attaquer(p : &Partie)
    }
    else if reponse!="1"  {print("Mauvaise réponse")}
  }
}

main()
