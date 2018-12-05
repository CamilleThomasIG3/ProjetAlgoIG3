func initTest() -> Int{
    var retourTest : Int = 0
    var piocheTest : Pioche = Pioche()
    let r : Int = piocheTest.taillePioche()
    if r != 20{
        print("le nombre de cartes de la pioche est mal initialise ou la fonction taillePioche() recupere mal la taille de la pioche")
        retourTest += 1
    }
    else{
        print("init() initialise correctemement la pioche")
    }
    return retourTest
}

func premierPiocheTest() -> Int{
    var retourTest : Int = 0
    var piocheTest : Pioche = Pioche()
    let r :  = piocheTest.taillePioche()
    if r != 20{
        print("le nombre de cartes de la pioche est mal initialise ou la fonction taillePioche() recupere mal la taille de la pioche")
        retourTest += 1
    }
    else{
        print("init() initialise correctemement la pioche")
    }
    return retourTest
}

print("il y a "+initTest()+" erreurs dans la fonction init() du type pioche\n")