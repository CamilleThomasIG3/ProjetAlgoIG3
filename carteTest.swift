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
    let r = carteTest.setPos(nvPos : nvPos).getPos()
    if r != nil{
        print("setPosition ne modifie pas correctement la position de la Carte lorsqu'on veut la mettre à Vide")
        retourTest += 1
    }
    else{
        print("setPosition met correctement la position de la  à Vide")
    }
    nvPos="A2"
    let r2 = positionTest.setPosition(nvPos : nvPos).getPos()
    if r2 != nvPos{
        print("Postcondition 'getPosition(nvPos) => getPosition() == nvPos' non respectee")
        retourTest += 1
    }
    else{
        print("Postcondition 'setPosition(nvPos) => getPosition == nvPos' respectee")
    }
    return retourTest
}
