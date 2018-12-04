func nomTest() -> Int{
    var retourTest : Int = 0
    var joueurTest : Joueur = Joueur()
    let r : String = joueurTest.nom()
    if r != "J1" && r != "J2"{
        print("le nom du joueur est mal initialise ou la fonction nom() recupere mal le nom")
        retourTest += 1
    }
    else{
        print("nom() renvoie correctemement le nom du joueur initialise")
    }
    return retourTest
}

print("il y a "+nomTest()+" erreurs dans la fonction nom() du type Joueur\n")
