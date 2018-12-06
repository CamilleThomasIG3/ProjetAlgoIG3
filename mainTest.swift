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
    if r2 != 0{
        print("nbreCartesMain() ne retourne pas la bonne valeur lorsque la Main est videe")
        retourTest += 1
    }
    else{
        print("nbreCartesMain() retourne la bonne valeur lorsque la Main est videe")
    }
    return retourTest
}

func appartientMainTest() -> Int{
    var retourTest : Int = 0
    var roiTest : Carte = Carte(nvNom : "Roi", nvDefense : 10, nvAttaque : 8, nvEtat : false, nvPos : "F1")
    var mainTest : Main = Main(roi : roiTest)
    let r : Bool = mainTest.appartientMain(carte : roiTest)
    if !r {
        print("appartientMain(carte) ne renvoie pas vrai lorsque carte est dans la main")
        retourTest += 1
    }
    else{
        print("appartientMain(carte)renvoie vrai lorsque carte est dans la main")
    }
    let r2 : Bool = mainTest.enleverMain(carte : roiTest).appartientMain(carte : roiTest)
    if r2 {
        print("appartientMain() ne retourne pas faux lorsqu'une carte est enlevee de la Main")
        retourTest += 1
    }
    else{
        print("appartientMain() renvoie bien faux lorsqu'une carte est enlevee de la Main")
    }
    return retourTest
}

func ajouterMainTest() -> Int{
    var retourTest : Int = 0
    var roiTest : Carte = Carte(nvNom : "Roi", nvDefense : 10, nvAttaque : 8, nvEtat : false, nvPos : nil)
    var mainTest : Main = Main(roi : roiTest)
    var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 8, nvEtat : false, nvPos : nil)
    var carteTest2 : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 8, nvEtat : false, nvPos : nil)
    var carteTest3 : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 8, nvEtat : false, nvPos : nil)
    var carteTest4 : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 8, nvEtat : false, nvPos : nil)
    var carteTest5 : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 8, nvEtat : false, nvPos : nil)
    var carteTest6 : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 8, nvEtat : false, nvPos : nil)
    var carteTest7 : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 8, nvEtat : false, nvPos : nil)
    mainTest.ajouterMain(carte : carteTest).ajouterMain(carte : carteTest2).ajouterMain(carte : carteTest3).ajouterMain(carte : carteTest4).ajouterMain(carte : carteTest5).ajouterMain(carte : carteTest6)
    do{
        try mainTest.ajouterMain(carte : carteTest7)
        print("precondition 'nbreCartesMain < 7' non respectee")
        retourTest += 1
    }
    catch{
        print("precondition 'nbreCartesMain < 7' non respectee")
    }
    var roiTest : Carte = Carte(nvNom : "Roi", nvDefense : 10, nvAttaque : 8, nvEtat : false, nvPos : nil)
    var mainTest : Main = Main(roi : roiTest)
    mainTest.ajouterMain(carte : carteTest).ajouterMain(carte : carteTest2).ajouterMain(carte : carteTest3)
    let r : Int = mainTest.nbreCartesMain()
    if r != 4{
        print("les cartes ne sont pas ajoutees correctement a la Main")
        retourTest += 1
    }
    else{
        print("les cartes sont ajoutees correctement a la Main")
    }
    return retourTest
}

func enleverMainTest() -> Int{
    var retourTest : Int = 0
    var roiTest : Carte = Carte(nvNom : "Roi", nvDefense : 10, nvAttaque : 8, nvEtat : false, nvPos : nil)
    var mainTest : Main = Main(roi : roiTest)
    mainTest.enleverMain(carte : roiTest)
    do{
        try mainTest.enleverMain(carte : roiTest)
        print("precondition 'nbreCartesMain > 0' non respectee")
        retourTest += 1
    }
    catch{
        print("precondition 'nbreCartesMain > 0' respectee")
    }
    var mainTest2 : Main = Main(roi : roiTest)
    var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 8, nvEtat : false, nvPos : nil)
    mainTest2.enleverMain(carte : carteTest)
    do{
        try mainTest.enleverMain(carte : carteTest)
        print("precondition 'appartientMain(carte)==true' non respectee")
        retourTest += 1
    }
    catch{
        print("precondition 'appartientMain(carte)==true' respectee")
    }
    mainTest.ajouterMain(carte : roiTest).ajouterMain(carte : carteTest)
    let r : Int = mainTest.enleverMain(carte : roiTest).nbreCartesMain()
    if r != 1{
        print("les cartes ne sont pas correctement enlevees de la Main")
        retourTest += 1
    }
    else{
        print("les cartes sont correctement enlevees de la Main")
    }
    return retourTest
}

print("il y a "+initTest()+" erreurs dans la fonction init() du type Main\n")
print("il y a "+mainVideTest()+" erreurs dans la fonction mainVide() du type Main\n")
print("il y a "+nbreCartesMainTest()+" erreurs dans la fonction nbreCartesMain() du type Main\n")
print("il y a "+appartientMainTest()+" erreurs dans la fonction appartientMain() du type Main\n")
print("il y a "+ajouterMainTest()+" erreurs dans la fonction ajouterMain() du type Main\n")
print("il y a "+enleverMainTest()+" erreurs dans la fonction enleverMain() du type Main\n")
