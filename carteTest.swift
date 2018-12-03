func getNomTest() -> Int{
    var retourTest : Int = 0
    var positionTest : Position = Position()
    let r : String? = positionTest.getNom()
    if r != nil{
        print("Position est mal initialisee ou getNom ne recupere mal son nom")
        retourTest += 1
    }
    else{
        print("getNom renvoie correctemement le nom de la Position initialisee")
    }
    var nvNom : String? = "F2"
    let r2 : String? = positionTest.setNom(nvNom : nvNom).getNom()
    if r2 != nvNom{
        print("getNom ne renvoie pas le bon nom pour une Position lorsqu'il a ete modifie")
        retourTest += 1
    }
    else{
        print("getNom renvoie le bon nom pour une Position lorsqu'il a ete modifie")
    }
    return retourTest
}

func setNomTest() -> Int{
    var retourTest : Int = 0
    var positionTest : Position = Position()
    var nvNom : String? = "A6"
    do{
        try positionTest.setNom(nvNom : nvNom)
        print("Precondition 'nvPos doit être vide ou une Position valide' respectee")
        retourTest += 1
    }
    catch{
        print("Precondition 'nvPos doit être vide ou une Position valide' respectee")
    }
    nvNom=nil
    let r = positionTest.setNom(nvNom : nvNom).getNom()
    if r != nil{
        print("setNom ne modifie pas correctement le nom de la Position lorsqu'on veut le mettre à vide")
        retourTest += 1
    }
    else{
        print("setNom met correctement le nom de la Position à Vide")
    }
    nvNom="A2"
    let r2 = positionTest.setNom(nvNom : nvNom).getNom()
    if r2 != nvNom{
        print("Postcondition 'getNom() => nvPos.getNom()' non respectee")
        retourTest += 1
    }
    else{
        print("Postcondition 'getNom() => nvPos.getNom()' respectee")
    }
    return retourTest
}
