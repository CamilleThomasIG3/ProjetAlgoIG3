func initTest() -> Int{
    var retourTest : Int = 0
    var champBatailleTest : ChampBataille = ChampBataille()
    let r : Bool = champVide()
    if !r {
        print("postcondition : init() => champVide() non respectee. Le champ de bataille n'est pas bien initialise")
        retourTest += 1
    }
    else{
        print("postcondition : init() => champVide() respectee. Le champ de bataille est bien initialise")
    }
    return retourTest
}

func getCaseTest() -> Int{
    var retourTest : Int = 0
    let tabPositions : [String] = ["A1","A2","A3","F1","F2","F3"]
    var champBatailleTest : ChampBataille = ChampBataille()
    for i in tabPositions{
        let r : Case = champBatailleTest.getCase(nom : i)
        if r.etatCase() != false{
            print("getCase ne recupere pas correctement la case \(i) lorsque le champ de bataille est intitialise")
            retourTest += 1
        }
        else{
            print("getCase recupere correctement la case \(i) lorsque le champ de bataille est initialise")
        }
    }
    
    var emplacementTest : Emplacement = Emplacement()
    emplacementTest.setEmplacement(newEmplacement : 3)
    var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 5, nvEtat : false, nvPos : "F2", nvEmplacement : emplacementTest)
    let r : Case = champBatailleTest.insererCarte(cas : "F2", carte : carteTest).getCase(nom : "F2")
    if r.etatCase() != true{
        print("getCase ne recupere pas correctement la case (en particulier son etat) lorsqu'elle a ete modifiee")
        retourTest += 1
    }
    else{
        print("getCase recupere correctement la case (en particulier son etat) lorsqu'elle a ete modifiee")
    }
    
    return retourTest
}

func getCarteTest() -> Int{
    var retourTest : Int = 0
    var champBatailleTest : ChampBataille = ChampBataille()
    do{
        try champBatailleTest.getCarte(position : "E4")
        print("precondition 'position appartient a {F1,F2,F3,A1,A2,A3}' non respectee")
        retourTest += 1
    }
    catch{
        print("precondition 'position appartient a {F1,F2,F3,A1,A2,A3}' respectee")
    }
    let r : Carte? = champBatailleTest.getCarte(position : "F1")
    if r != nil{
        print("postcondition 'init() => getCarte(position) == nil' non respectee")
        retourTest += 1
    }
    else{
        print("postcondition 'init() => getCarte(position) == nil' respectee")
    }
    var emplacementTest : Emplacement = Emplacement()
    emplacementTest.setEmplacement(newEmplacement : 3)
    var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 5, nvEtat : false, nvPos : "F2", nvEmplacement : emplacementTest)
    champBatailleTest.insererCarte(cas: "F2", carte : carteTest)
    let r2 : Carte? = champBatailleTest.getCarte(position: "F2")
    if r2 != carteTest{
        print("postcondition 'insererCarte(case,carte) => getCarte(case) == carte' non respectee")
        retourTest += 1
    }
    else{
        print("postcondition 'insererCarte(case,carte) => getCarte(case) == carte' respectee")
    }
    return retourTest
}
