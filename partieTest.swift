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
    partieTest.getJoueurCourant().setJoueurCourant(j : "J2")
    if partieTest.getJoueurCourant() != "J2"{
        print("la fonction setJoueurCourant() modifie mal le Joueur Courant de la partie")
        retourTest += 1
    }
    else{
        print("setJoueurCourant() modifie correctemement le Joueur Courant de la partie")
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
    var partieTest : Partie = Partie()
    partieTest.getJoueurAdverse().setJoueurAdverse(j : "J2")
    if partieTest.getJoueurAdverse() != "J2"{
        print("la fonction setJoueurAdverse() modifie mal le Joueur Adverse de la partie")
        retourTest += 1
    }
    else{
        print("setJoueurAdverse() modifie correctemement le Joueur Adverse de la partie")
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
    partieTest.getGagnant().setGagnant(nvGagnant : "J1")
    if partieTest.getGagnant() != "J1"{
        print("la fonction setGagnant() modifie mal le gagnant de la partie")
        retourTest += 1
    }
    else{
        print("setGagnant() modifie correctemement le gagnant de la partie")
    }
    return retourTest
}

func setMotifFinTest() -> Int{
    var retourTest : Int = 0
    var partieTest : Partie = Partie()
    partieTest.getMotifFin().setMotifFin(nvMotifFin : "circonscription")
    if partieTest.getMotifFin() != "circonscription"{
        print("la fonction setMotifFin() modifie mal le Motif Fin de la partie")
        retourTest += 1
    }
    else{
        print("setMotifFin() modifie correctemement le Motif Fin de la partie")
    }
    return retourTest
}

func setFinTest() -> Int{
    var retourTest : Int = 0
    var partieTest : Partie = Partie()
    partieTest.getFin().setFin(nvFin : true)
    if !partieTest.getFin() {
        print("la fonction setFin() modifie mal la fin de la partie")
        retourTest += 1
    }
    else{
        print("setFin() modifie correctemement la fin de la partie")
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
print("il y a "+setMotifFinTest()+" erreurs dans la fonction setMotifFin() du type Partie\n")
print("il y a "+setFinTest()+" erreurs dans la fonction setFin() du type Partie\n")
