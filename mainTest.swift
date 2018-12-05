func initTest() -> Int{
    var retourTest : Int = 0
    var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 8, nvEtat : false, nvPos : "F1")
    do{
        var mainTest : Main = try Main(roi : carteTest)
        print("precondition 'la carte doit etre un Roi (nom = 'Roi')' non respectee")
        retourTest += 1
    }
    catch{
        print("precondition 'la carte doit etre un Roi (nom = 'Roi')' respectee")
    }
    var roiTest : Carte = Carte(nvNom : "Roi", nvDefense : 10, nvAttaque : 8, nvEtat : false, nvPos : "F1")
    var mainTest : Main = Main(roi : roiTest)
    let r : Bool = mainTest.mainVide()
    if r != false{
        print("la Main est mal initialisee")
        retourTest += 1
    }
    else{
        print("la Main est correctement initialisee")
    }
    return retourTest
}

func mainVideTest() -> Int{
    var retourTest : Int = 0
    var roiTest : Carte = Carte(nvNom : "Roi", nvDefense : 10, nvAttaque : 8, nvEtat : false, nvPos : "F1")
    var mainTest : Main = Main(roi : roiTest)
    let r : Bool = mainTest.mainVide()
    if r != false{
        print("mainVide() ne retourne pas la bonne valeur lorsque la Main n'est pas vide")
        retourTest += 1
    }
    else{
        print("mainVide() retourne la bonne valeur lorsque la Main est vide")
    }
    let r2 : Bool = mainTest.enleverMain(carte : roiTest).mainVide()
    if r2 != true{
        print("mainVide() ne retourne pas la bonne valeur lorsque la Main est videe")
        retourTest += 1
    }
    else{
        print("mainVide() retourne la bonne valeur lorsque la Main est videe")
    }
    return retourTest
}

func nbreCartesMainTest() -> Int{
    var retourTest : Int = 0
    var roiTest : Carte = Carte(nvNom : "Roi", nvDefense : 10, nvAttaque : 8, nvEtat : false, nvPos : "F1")
    var carteTest : Carte = Carte(nvNom : "Soldat", nvDefense : 10, nvAttaque : 8, nvEtat : false, nvPos : "A1")
    var mainTest : Main = Main(roi : roiTest)
    mainTest.ajouterMain(carte : carteTest)
    let r : Int = mainTest.nbreCartesMain()
    if r != 2{
        print("nbreCartesMain() ne retourne pas la bonne valeur lorsque des cartes sont ajoutees a la Main")
        retourTest += 1
    }
    else{
        print("nbreCartesMain() retourne la bonne valeur lorsque des cartes sont ajourtees a la Main")
    }
    let r2 : Int = mainTest.enleverMain(carte : roiTest).enleverMain(carte : carteTest).nbreCartesMain()
    if r2 != true{
        print("mainVide() ne retourne pas la bonne valeur lorsque la Main est videe")
        retourTest += 1
    }
    else{
        print("mainVide() retourne la bonne valeur lorsque la Main est videe")
    }
    return retourTest
}
