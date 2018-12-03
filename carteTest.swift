func getNomTest() -> Int{
    var retourTest : Int = 0
    var emplacementTest : Emplacement = Emplacement()
    var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 5, nvEtat : false, nvPos : "F2", nvEmplacement : emplacementTest)
    let r : String = carteTest.getNom()
    if r != "Archer"{
        print("le nom de la Carte est mal initialise ou getNom recupere mal son nom")
        retourTest += 1
    }
    else{
        print("getNom renvoie correctemement le nom de la carte initialisee")
    }
    return retourTest
}

func getAttaqueTest() -> Int{
    var retourTest : Int = 0
    var emplacementTest : Emplacement = Emplacement()
    var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 5, nvEtat : false, nvPos : "F2", nvEmplacement : emplacementTest)
    let r : Int = carteTest.getAttaque()
    if r != 5{
        print("l'attaque de la Carte est mal initialisee ou getPosition recupere mal son nom")
        retourTest += 1
    }
    else{
        print("getAttaque renvoie correctemement l'attaque de la carte initialisee")
    }
    var nvAttaque : Int = 6
    let r2 : Int = carteTest.setAttaque(nvAttaque : nvAttaque).getAttaque()
    if r2 != nvAttaque{
        print("getAttaque ne renvoie pas la bonne valeur d'attaque pour la Carte lorsqu'elle a ete modifiee")
        retourTest += 1
    }
    else{
        print("getAttaque renvoie la bonne valeur d'attaque pour la Carte lorsqu'elle a ete modifiee")
    }
    return retourTest
}

func setAttaqueTest() -> Int{
    var retourTest : Int = 0
    var emplacementTest : Emplacement = Emplacement()
    var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 5, nvEtat : false, nvPos : "F2", nvEmplacement : emplacementTest)
    var nvAttaque : Int = -1
    do{
        try carteTest.setAttaque(nvAttaque : nvAttaque)
        print("Precondition non respectee pour setAttaque : nvAttaque >= 0")
        retourTest += 1
    }
    catch{
        print("Precondition pour setAttaque bien respectee : nvAttaque >= 0")
    }
    nvAttaque = 16
    do{
        try carteTest.setAttaque(nvAttaque : nvAttaque)
        print("Precondition non respectee pour setAttaque : nvAttaque <= 7")
        retourTest += 1
    }
    catch{
        print("Precondition pour setAttaque bien respectee : nvAttaque <= 7")
    }
    nvAttaque = 3
    let r = carteTest.setAttaque(nvAttaque : nvAttaque).getAttaque()
    if r != 3{
        print("Postcondition 'setAttaque(nvAttaque) => getAttaque() == nvAttaque' respectee")
        retourTest += 1
    }
    else{
        print("Postcondition 'setAttaque(nvAttaque) => getAttaque() == nvAttaque' respectee")
    }
    return retourTest
}

func getDefenseTest() -> Int{
    var retourTest : Int = 0
    var emplacementTest : Emplacement = Emplacement()
    var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 5, nvEtat : false, nvPos : "F2", nvEmplacement : emplacementTest)
    let r : Int = carteTest.getDefense()
    if r != 10{
        print("la defense de la Carte est mal initialisee ou getDefense recupere mal sa valeur")
        retourTest += 1
    }
    else{
        print("getDefense renvoie correctemement la defense de la carte initialisee")
    }
    return retourTest
}

func getPositionTest() -> Int{
    var retourTest : Int = 0
    var emplacementTest : Emplacement = Emplacement()
    var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 5, nvEtat : false, nvPos : "F2", nvEmplacement : emplacementTest)
    let r : String? = carteTest.getPosition()
    if r != "F2"{
        print("la position de la Carte est mal initialisee ou getPosition recupere mal son nom")
        retourTest += 1
    }
    else{
      print("la position de la Carte est bien initialisee et getPosition retourne correctement son nom")
    }
    var nvPos : String? = "A1"
    let r2 : String? = carteTest.setPosition(nvPos : nvPos).getPosition()
    if r2 != "A1"{
      print("getPosition ne renvoie pas la bonne valeur lorsque la position a ete modifiee")
      retourTest += 1
    }
    else{
      print("getPosition renvoie la bonne valeur lorsque la position a ete modifiee ")
    }
    return retourTest
}

func setPositionTest() -> Int{
    var retourTest : Int = 0
    var emplacementTest : Emplacement = Emplacement()
    var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 5, nvEtat : false, nvPos : "F2", nvEmplacement : emplacementTest)
    var nvPos : String? = "A6"
    do{
        try carteTest.setPosition(nvPos : nvPos)
        print("Precondition 'nvPos doit être vide ou une Position valide' non respectee")
        retourTest += 1
    }
    catch{
        print("Precondition 'nvPos doit être vide ou une Position valide' respectee")
    }
    nvPos = nil
    let r = carteTest.setPosition(nvPos : nvPos).getPosition()
    if r != nil{
        print("setPosition ne modifie pas correctement la position de la Carte lorsqu'on veut la mettre à Vide")
        retourTest += 1
    }
    else{
        print("setPosition met correctement la position de la  à Vide")
    }
    nvPos="A2"
    let r2 = carteTest.setPosition(nvPos : nvPos).getPosition()
    if r2 != nvPos{
        print("Postcondition 'setPosition(nvPos) => getPosition() == nvPos' non respectee")
        retourTest += 1
    }
    else{
        print("Postcondition 'setPosition() => getPosition() == nvPos' respectee")
    }
    return retourTest
}

func getEtatCarteTest() -> Int{
    var retourTest : Int = 0
    var emplacementTest : Emplacement = Emplacement()
    var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 5, nvEtat : false, nvPos : "F2", nvEmplacement : emplacementTest)
    let r : Bool? = carteTest.getEtatCarte()
    if r != false{
        print("l'etat de la Carte est mal initialise ou getEtatCarte recupere mal l'etat")
        retourTest += 1
    }
    else{
      print("l'etat de la Carte est bien initialise et getEtatCarte le retourne correctement")
    }
    var nvEtat : Bool? = true
    let r2 : Bool? = carteTest.setEtatCarte(nvEtat : nvEtat).getEtatCarte()
    if r2 != nvEtat{
      print("getEtatCarte ne renvoie pas la bonne valeur lorsque l'etat a ete modifie")
      retourTest += 1
    }
    else{
      print("getEtatCarte renvoie la bonne valeur lorsque l'etat a ete modifie")
    }
    return retourTest
}

func setEtatCarteTest() -> Int{
    var retourTest : Int = 0
    var emplacementTest : Emplacement = Emplacement()
    var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 5, nvEtat : false, nvPos : "F2", nvEmplacement : emplacementTest)
    var nvEtat : Bool? = nil
    let r = carteTest.setEtatCarte(nvEtat : nvEtat).getEtatCarte()
    if r != nvEtat{
        print("setEtatCarte ne modifie pas correctement l'etat de la Carte lorsqu'on veut le mettre à Vide")
        retourTest += 1
    }
    else{
        print("setEtatCarte met correctement l'etat de la Carte à Vide")
    }
    nvEtat=true
    let r2 = carteTest.setEtatCarte(nvEtat : nvEtat).getEtatCarte()
    if r2 != nvEtat{
        print("Postcondition 'setEtatCarte(nvEtat) => getEtatCarte() == nvEtat' non respectee")
        retourTest += 1
    }
    else{
        print("Postcondition 'setEtatCarte(nvEtat) => getEtatCarte() == nvEtat' respectee")
    }
    return retourTest
}

func getEmplacementCarteTest() -> Int{
    var retourTest : Int = 0
    var emplacementTest : Emplacement = Emplacement()
    var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 5, nvEtat : false, nvPos : "F2", nvEmplacement : emplacementTest)
    let r : Emplacement = carteTest.getEmplacementCarte()
    if r != emplacementTest{
        print("l'Emplacement de la Carte est mal initialise ou getEmplacementCarte recupere mal l'Emplacement")
        retourTest += 1
    }
    else{
      print("l'Emplacement de la Carte est bien initialise et getEmplacementCarte le retourne correctement")
    }
    return retourTest
}

func setEmplacementCarteTest() -> Int{
    var retourTest : Int = 0
    var emplacementTest : Emplacement = Emplacement()
    var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 5, nvEtat : false, nvPos : "F2", nvEmplacement : emplacementTest)
    var nvEmplacement : Emplacement = Emplacement()
    nvEmplacement.setEmplacement(newEmplacement : nil)
    let r = carteTest.setEmplacementCarte(nvEmplacement : nvEmplacement).getEmplacementCarte()
    if r != nvEmplacement{
        print("setEmplacementCarte ne modifie pas correctement l'Emplacement de la Carte lorsqu'il est set à Vide")
        retourTest += 1
    }
    else{
        print("setEmplacementCarte modifie correctement l'Emplacement de la Carte lorsqu'il est set à Vide")
    }
    nvEmplacement.setEmplacement(newEmplacement : 2)
    let r2 = carteTest.setEmplacementCarte(nvEmplacement : nvEmplacement).getEmplacementCarte()
    if r2 != nvEmplacement{
        print("Postcondition 'setEmplacementCarte(newEmplacement) => getEmplacementCarte() == newEmplacement' non respectee")
        retourTest += 1
    }
    else{
        print("Postcondition 'setEmplacementCarte(newEmplacement) => getEmplacementCarte() == newEmplacement' respectee")
    }
    return retourTest
}

//faire les tests des get où il ya des type? je sais plus pourquoi j'ai écrit ça mdr
