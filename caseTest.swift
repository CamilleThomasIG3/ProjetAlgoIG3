func etatCaseTest() -> Int{
    var retourTest : Int = 0
    var caseTest : Case = Case()
    let r : Bool = caseTest.etatCase()
    if r != false{
        print("Case est mal initialise ou etatCase recupere mal la valeur")
        retourTest += 1
    }
    else{
        print("Postcondition init() => EtatCase() == Faux bien respectee")
    }
    let r2 : Bool = caseTest.modifierCase(newEtat : true).etatCase()
    if r2 != true{
        print("etatCase ne renvoie pas la bonne valeur (true)")
        retourTest += 1
    }
    else{
        print("etatCase renvoie la bonne valeur")
    }
    return retourTest
}

func modifierCaseTest() -> Int{
    var retourTest : Int = 0
    var caseTest : Case = Case()
    let r : Bool = caseTest.modifierCase(newEtat : true).etatCase()
    if r != true{
        print("modifierCase ne modifie pas l'etat de la Case correctement")
        retourTest += 1
    }
    else{
        print("Postcondition modifierCase(newEtat:Bool) => etatCase() == newEtat bien respectee")
    }
    return retourTest
}
