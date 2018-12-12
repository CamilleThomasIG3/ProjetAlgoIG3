import "AlgoThomasCouchyLibrary"

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
    while !piocheTest.piocheVide()
    {
        piocheTest.piocher()
    }
    do{
        try piocheTest.premierPioche()
        print("precondition 'premierPioche(pioche) => !pioche.piocheVide()' non respectee")
        retourTest += 1
    }
    catch{
        print("precondition 'premierPioche(pioche) => !pioche.piocheVide()' respectee")
    }
    return retourTest
}

func piocherTest() -> Int{
    var retourTest : Int = 0
    var piocheTest : Pioche = Pioche()
    var pioche2 : Pioche = piocheTest.piocher()
    if piocheTest.taillePioche() != pioche2.taillePioche()+1
    {
        print("postcondition 'taillePioche(piocher(carte))=taillePioche()-1' non respectee")
        retourTest += 1
    }
    else
    {
        print("postcondition 'taillePioche(piocher(carte))=taillePioche()-1' respectee")
    }
    while !piocheTest.piocheVide()
    {
        piocheTest.piocher()
    }
    do{
        try piocheTest.piocher()
        print("precondition 'piocher(pioche) => !pioche.piocheVide()' non respectee")
        retourTest += 1
    }
    catch{
        print("precondition 'piocher(pioche) => !pioche.piocheVide()' respectee")
    }
    return retourTest
}

func ajouterPiocheTest() -> Int{
    var retourTest : Int = 0
    var piocheTest : Pioche = Pioche()
    var c : Carte = Carte()
    var pioche2 : Pioche = piocheTest.ajouterPioche(c : c)
    if piocheTest.taillePioche() != pioche2.taillePioche()-1
    {
        print("postcondition 'taillePioche(ajouterPioche(carte))=taillePioche()+1' non respectee")
        retourTest += 1
    }
    else
    {
        print("postcondition 'taillePioche(ajouterPioche(carte))=taillePioche()+1'  respectee")
    }
    return retourTest
}

func taillePiocheTest() -> Int{
    var retourTest : Int = 0
    var piocheTest : Pioche = Pioche()
    if piocheTest.taillePioche()<0 || piocheTest.taillePioche()>20
    {
        print("postcondition '0<=taillePioche(pioche)<=20' non respectee")
        retourTest += 1
    }
    else
    {
        print("postcondition '0<=taillePioche(pioche)<=20' respectee")
    }
    return retourTest
}

func piocheVideTest() -> Int{
    var retourTest : Int = 0
    var piocheTest : Pioche = Pioche()
    if piocheTest.taillePioche <= 0
    {
        print("postcondition 'PiocheVide()==False => taillePioche()>0' non respectee")
        retourTest += 1
    }
    else
    {
        print("postcondition 'PiocheVide()==False => taillePioche()>0' respectee")
    }
    while !piocheTest.piocheVide()
    {
        piocheTest.piocher()
    }
    if piocheTest.taillePioche > 0
    {
        print("postcondition 'PiocheVide()==True => taillePioche()=0' non respectee")
        retourTest += 1
    }
    else
    {
        print("postcondition 'PiocheVide()==True => taillePioche()=0' respectee")
    }
    return retourTest
}

print("il y a "+initTest()+" erreurs dans la fonction init() du type pioche\n")
print("il y a "+premierPiocheTest()+" erreurs dans la fonction premierPioche() du type pioche\n")
print("il y a "+piocherTest()+" erreurs dans la fonction piocher() du type pioche\n")
print("il y a "+ajouterPiocheTest()+" erreurs dans la fonction ajouterPioche() du type pioche\n")
print("il y a "+taillePiocheTest()+" erreurs dans la fonction taillePioche() du type pioche\n")
print("il y a "+piocheVideTest()+" erreurs dans la fonction piocheVide() du type pioche\n")
