import "AlgoThomasCouchyLibrary"

func initTest() -> Int{
    var retourTest : Int = 0
    var partieTest : Partie = Partie()
    if partieTest.getFin() != false{
        print("la fonction init() initialise mal le booléen fin de la partie")
        retourTest += 1
    }
    else{
        print("init() initialise correctemement le booleen fin de la partie")
    }
    if partieTest.getMotifFin() != nil{
        print("la fonction init() initialise mal le motif fin de la partie")
        retourTest += 1
    }
    else{
        print("init() initialise correctemement le motif fin de la partie")
    }
    if partieTest.joueurCourant().nom() != "J1"{
        print("la fonction init() initialise mal le joueur courant de la partie")
        retourTest += 1
    }
    else{
        print("init() initialise correctemement le joueur courant de la partie")
    }
    if partieTest.joueurAdverse().nom() != "J2"{
        print("la fonction init() initialise mal le joueur adverse de la partie")
        retourTest += 1
    }
    else{
        print("init() initialise correctemement le joueur adverse de la partie")
    }
    return retourTest
}

func joueurCourantTest() -> Int{
    var retourTest : Int = 0
    var partieTest : Partie = Partie()
    var joueurCourant : String = partieTest.JoueurCourant().nom()
    if  joueurCourant != "J1" && joueurCourant != "J2" {
        print("la fonction joueurCourant() recupere mal le joueur courant de la partie")
        retourTest += 1
    }
    else{
        print("joueurCourant() renvoie correctemement le joueur courant de la partie")
    }
    return retourTest
}

func setJoueurCourantTest() -> Int{
    var retourTest : Int = 0
    var partieTest : Partie = Partie()
    var joueur : Joueur = Joueur()
    joueur.setNom(nvNom : "J3")
    do{
        try partieTest.setJoueurCourant(j : joueur)
        print("precondition 'nom(j)==J1 ou J2' non respectee")
        retourTest += 1
    }
    catch{
        print("precondition 'nom(j)==J1 ou J2' respectee")
    }
    return retourTest
}

func joueurAdverseTest() -> Int{
    var retourTest : Int = 0
    var partieTest : Partie = Partie()
    var joueurAdverse : String = partieTest.JoueurAdverse().nom()
    var joueurCourant : String = partieTest.JoueurCourant().nom()
    if (joueurAdverse != "J2" && joueurAdverse != "J1") || joueurAdverse == JoueurCourant {
        print("la fonction joueurAdverse() initialise mal le joueur adverse de la partie")
        retourTest += 1
    }
    else{
        print("joueurAdverse() renvoie correctemement le joueur adverse de la partie")
    }
    return retourTest
}

func setJoueurAdverseTest() -> Int{
    var retourTest : Int = 0
    var joueur : Joueur = Joueur()
    joueur.setNom(nvNom : "J3")
    do{
        try partieTest.setJoueurAdverse(j : joueur)
        print("precondition 'nom(j)==J1 ou J2' non respectee")
        retourTest += 1
    }
    catch{
        print("precondition 'nom(j)==J1 ou J2' respectee")
    }
    return retourTest
}

func getGagnantTest() -> Int{
    var retourTest : Int = 0
    var partieTest : Partie = Partie()
    var gagnant : String = partieTest.getGagnant()
    if partieTest.getFin()==true && gagnant != "J1" && gagnant != "J2" && gagnant != "egalité"{
        print("la fonction getGagnant() renvoie mal le gagnant de la partie")
        retourTest += 1
    }
    else{
        print("getGagnant() renvoie correctemement le gagnant de la partie")
    }
    return retourTest
}

func setGagnantTest() -> Int{
    var retourTest : Int = 0
    var partieTest : Partie = Partie()
    do{
        try partieTest.setGagnant(nvGagnant : "J3")
        print("precondition 'nom(nvGagnant)==J1 ou J2' non respectee")
        retourTest += 1
    }
    catch{
        print("precondition 'nom(nvGagnant)==J1 ou J2' respectee")
    }
    return retourTest
}

print("il y a "+initTest()+" erreurs dans la fonction init() du type Partie\n")
print("il y a "+joueurCourantTest()+" erreurs dans la fonction joueurCourant() du type Partie\n")
print("il y a "+setJoueurCourantTest()+" erreurs dans la fonction setJoueurCourant() du type Partie\n")
print("il y a "+joueurAdverseTest()+" erreurs dans la fonction joueurAdverse() du type Partie\n")
print("il y a "+setJoueurAdverseTest()+" erreurs dans la fonction setJoueurAdverse() du type Partie\n")
print("il y a "+getGagnantTest()+" erreurs dans la fonction getGagnant() du type Partie\n")
print("il y a "+setGagnantTest()+" erreurs dans la fonction setGagnant() du type Partie\n")
