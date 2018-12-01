//demande un message à l'utilisateur et renvoie sa réponse
//donnee : message est la question demandée à l'utilisateur
//resultat : renvoie la réponse de l'utilisateur ou une erreure si sa réponse n'est pas bonne
func saisieUtilisateur(message : String)->String
{
  print(message)
  guard let res : String = readLine()
  else{ fatalError("vous ne répondez pas correctement à la question")}
  return res
}

func preparation(joueur : String, p : Partie){
  if joueur == "J1"
  {
    if partie.J1(pioche(piocheVide()))
    {
      if partie.J2.pioche.piocheVide()
      {
        partie.setMotifFin(nvMotifFin : "les pioches des 2 joueurs sont vides")
        if partie.J1.
      }
    }
  }

  print("Joueur "+j+", vos cartes sont remises en position défense et vous piochez une carte :\n")
  //carte=premierPioche()
  //ajouterMain(carte)
  //piocher()
  //print("carte "+nom(carte)+" de défense "+defense(carte)+" et d'attaque "+attaque(carte)+"\n")
}


func main(){
  var partie = Partie() //initialise la partie avec 2 joueurs et des conditions de fin
  var joueurCourant : String = "J1"

  while !partie.getFin()//tant que la partie n'est pas terminée
  {
    //préparation
    preparation(joueur : joueurCourant, p : partie)
    //action

 }
}

func choixAction()->String {
  print("Voulez vous : 1-Ne rien faire\n 2-déployer une carte\n 3-attaquer")
  try return readLine()
}

main()
