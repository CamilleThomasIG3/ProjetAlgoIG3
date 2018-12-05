func initTest() -> Int{
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

func setNomTest() -> Int{
    var retourTest : Int = 0
    var joueurTest : Joueur = Joueur()
    do{
        try joueurTest.setNom(nvNom : "J")
        print("precondition 'nom(joueur)=="J1" ou "J2"' non respectee")
        retourTest += 1
    }
    catch{
        print("precondition 'nom(joueur)=="J1" ou "J2"' respectee")
    }
    return retourTest
}

print("il y a "+initTest()+" erreurs dans la fonction init() du type Joueur\n")
print("il y a "+setNomTest()+" erreurs dans la fonction setNom() du type Joueur\n")
