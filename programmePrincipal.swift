func main(){

  debutPartie()
  var numJoueur : String = "J1"
  var carte : Carte
  var fin : Bool = finPartie()

  while !fin
  {
    //préposition
    print("Joueur "+numJoueur+", vos cartes sont remises en position défense et vous piochez une carte :\n")
    carte=premierPioche()
    ajouterMain(carte)
    piocher()
    print("carte "+nom(carte)+" de défense "+defense(carte)+" et d'attaque "+attaque(carte)+"\n")

    //
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

main()
