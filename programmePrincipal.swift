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

func afficherCarte(carte : c)
{
  print("carte "+c.nom()+" de défense "+c.defense()+" et d'attaque "+c.attaque()+"\n")
}

func preparation(joueur : String, p : Partie){
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
    if joueur == "J1" //J1 peut jouer
    {
      carte = p.J1().pioche().premierPioche()
      p.J1().main().ajouterCarte(carte : carte) //met la premiere carte de la pioche dans la main
      p.J1().pioche().piocher() //enleve la carte de la pioche
      p.J1().champsBataille().redresserCarte()
    }
    else //joueur=="J2"
    {
      carte = p.J2().pioche().premierPioche()
      p.J2().main().ajouterCarte(carte : carte) //met la premiere carte de la pioche dans la main
      p.J2().pioche().piocher() //enleve la carte de la pioche
      p.J2().champsBataille().redresserCarte()
    }
    print("Joueur "+j+", vos cartes sont remises en position défense et vous piochez une carte :\n")
    afficherCarte(carte : carte)
}

func action(j : Joueur, p : Partie)
{
  var reponse : String = saisieUtilisateur("choisissez une action : 1-ne rien faire\n2-déployer une carte\n3-attaquer l'adversaire")
  if reponse=="2" //déployer
  {
    if joueur=="J1"
    {
      for c in p.J1().main() //parcours des cartes grace à l'iterateur de Main
      {
        afficherCarte(carte : c)
      }
      rep1 : String = saisieUtilisateur("Quelle nom de carte voulez-vous mettre sur votre champs de Bataille ?")
      rep2 : String = saisieUtilisateur("avec quel point de défense ?")
      rep3 : String = saisieUtilisateur("avec quel point d'attaque ?")
      rep3 : String = saisieUtilisateur("en quelle case voulez-vous la placer")
      var carteAttaque = Carte(nvNom : rep1, nvDefense : Int(rep2), nvAttaque : Int(rep3), nvPosition : , nvEmplacement : 3, nvEtat : true)

    }
    else //joueur==J2
    {

    }
  }
  else if reponse=="3" //attaquer
  {

  }
  else if reponse!="1"  {print("Mauvaise réponse")}
}


func main(){
  var partie = Partie() //initialise la partie avec 2 joueurs et des conditions de fin
  var joueurCourant : String = "J1"

  while !partie.getFin()//tant que la partie n'est pas terminée
  {
    //préparation
    preparation(joueur : joueurCourant, p : partie)
    //action
    action(j : joueurCourant, p : partie)
 }
}

func choixAction()->String {
  print("Voulez vous : 1-Ne rien faire\n 2-déployer une carte\n 3-attaquer")
  try return readLine()
}

main()
