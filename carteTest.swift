func getNomTest() -> Int{
    var retourTest : Int = 0
    var nvPos : String? = "A1"
    var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 5, nvEtat : 1, nvPos : nvPos)
    let r : String? = carteTest.getPosition()
    if r != nvPos{
        print("getPosition ne recupere pas la bonne position lorsque Carte est initialisee avec des parametres, ou Carte n'est pas bien initialisee")
        retourTest += 1
    }
    else{
        print("getPosition recupere la bonne position lorsque Carte est initialisee avec des parametres")
    }
    return retourTest
}

func getAttaqueTest() -> Int{
    var retourTest : Int = 0
    var carteTest : Carte = Carte()
    let r : Int = carteTest.getAttaque()
    if r != 0{
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
    var carteTest : Carte = Carte()
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
    var carteTest : Carte = Carte()
    let r : Int = carteTest.getDefense()
    if r != 0{
        print("la defense de la Carte est mal initialisee ou getDefense recupere mal sa valeur")
        retourTest += 1
    }
    else{
        print("getDefense renvoie correctemement la defense de la carte initialisee")
    }
    var nvDefense : Int = 10
    carteTest = Carte(nvNom : "Archer", nvDefense : nvDefense, nvAttaque : 5, nvEtat : false, nvPos : "F2")
    let r2 : Int = carteTest.getDefense()
    if r2 != nvDefense{
        print("getDefense ne renvoie pas la bonne valeur de defense pour la Carte lorsqu'elle a ete initialisee avec des parametres")
        retourTest += 1
    }
    else{
        print("getDefense renvoie la bonne valeur de defense pour la Carte lorsqu'elle a ete initialisee avec des parametres")
    }
    return retourTest
}

func getPositionTest() -> Int{
    var retourTest : Int = 0
    var carteTest : Carte = Carte()
    let r : String? = carteTest.getPosition()
    if r != nil{
        print("la position de la Carte est mal initialisee ou getPosition recupere mal son nom")
        retourTest += 1
    }
    else{
        print("getPosition renvoie correctemement le nom de la position de la carte initialisee")
    }
    var nvPos : String? = "F2"
    let r2 : String? = carteTest.setPosition(nvPos : nvPos).getPosition()
    if r2 != nvPos{
        print("getPosition ne renvoie pas la bonne position de la Carte lorsqu'elle a ete modifiee")
        retourTest += 1
    }
    else{
        print("getPosition renvoie la bonne position de la Carte lorsqu'elle a ete modifiee")
    }
    return retourTest
}

func setPositionTest() -> Int{
    var retourTest : Int = 0
    var carteTest : Carte = Carte()
    var nvPos : String? = "A6"
    do{
        try carteTest.setPosition(nvPos : nvPos)
        print("Precondition 'nvPos doit être vide ou une Position valide' respectee")
        retourTest += 1
    }
    catch{
        print("Precondition 'nvPos doit être vide ou une Position valide' respectee")
    }
    nvPos=nil
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
        print("Postcondition 'getPos() => nvPos.getPos()' non respectee")
        retourTest += 1
    }
    else{
        print("Postcondition 'getPos() => nvPos.getPos()' respectee")
    }
    return retourTest
}
