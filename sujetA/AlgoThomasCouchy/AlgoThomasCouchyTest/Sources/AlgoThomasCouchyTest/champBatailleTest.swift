import "AlgoThomasCouchyLibrary"

func initTest() -> Int{
    var retourTest : Int = 0
    var champBatailleTest : champBataille = champBataille()
    let r : Bool = champBatailleTest.champVide()
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
    var champBatailleTest : champBataille = champBataille()
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

    var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 5, nvEtat : false, nvPos : "F2", nvEmplacement : 3)
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
    var champBatailleTest : champBataille = champBataille()
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
    var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 5, nvEtat : false, nvPos : "F2", nvEmplacement : 3)
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

func NbreCarteChampTest() -> Int{
  var retourTest : Int = 0
  var champBatailleTest : champBataille = champBataille()
  let r : Int = champBatailleTest.NbreCarteChamp()
  if r != 0{
    print("NbreCarteChamp ne renvoie pas la bonne valeur (0) quand le champ de bataille vient d'etre initialise")
    retourTest += 1
  }
  else{
    print("NbreCarteChamp renvoie la bonne valeur quand le champ de bataille vient d'etre initialise")
  }
  var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 5, nvEtat : false, nvPos : "F2", nvEmplacement : 3)
  var carteTest : Carte = Carte(nvNom : "Soldat", nvDefense : 10, nvAttaque : 5, nvEtat : false, nvPos : "F1", nvEmplacement : 3)
  champBatailleTest.insererCarte(cas: "F2", carte : carteTest)
  champBatailleTest.insererCarte(cas: "F1", carte : carteTest)
  let r2 : Int = champBatailleTest.NbreCarteChamp()
  if r2 != 2{
    print("NbreCarteChamp ne renvoie pas la bonne valeur quand des cartes sont ajoutees au champ de bataille")
    retourTest += 1
  }
  else{
    print("NbreCarteChamp renvoie la bonne valeur quand des cartes sont ajoutees au champ de bataille")
  }
  return retourTest
}

func NbreCarteDefensechampTest() -> Int{
  var retourTest : Int = 0
  var champBatailleTest : champBataille = champBataille()
  let r : Int = champBatailleTest.NbreCarteDefenseChamp()
  if r != 0{
    print("NbreCarteDefenseChamp ne renvoie pas la bonne valeur (0) quand le champ de bataille vient d'etre initialise")
    retourTest += 1
  }
  else{
    print("NbreCarteDefenseChamp renvoie la bonne valeur quand le champ de bataille vient d'etre initialise")
  }
  var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 5, nvEtat : false, nvPos : "F2", nvEmplacement : 3)
  var carteTest : Carte = Carte(nvNom : "Soldat", nvDefense : 10, nvAttaque : 5, nvEtat : false, nvPos : "F1", nvEmplacement : 3)
  champBatailleTest.insererCarte(cas: "F2", carte : carteTest)
  champBatailleTest.insererCarte(cas: "F1", carte : carteTest)
  let r2 : Int = champBatailleTest.NbreCarteDefenseChamp()
  if r2 != 2{
    print("NbreCarteDefenseChamp ne renvoie pas la bonne valeur quand des cartes sont ajoutees au champ de bataille")
    retourTest += 1
  }
  else{
    print("NbreCarteDefenseChamp renvoie la bonne valeur quand des cartes sont ajoutees au champ de bataille")
  }
  return retourTest
}

func caseAtteignableTest() -> Int {
    var retourTest : Int = 0
    var champBatailleTest : champBataille = champBataille()
    var caseTest1 : Case = Case()
    var caseTest2 : Case = Case()
  caseTest1.nom()
    do{
      try champBatailleTest.caseAtteignable(caseDep : "E8", caseArr : "A1", nomCarte : "Roi")
      print("precondition 'caseDep € {F1,F2,F3,A1,A2,A3}' non respectee")
      retourTest += 1
    }
    catch{
      print("precondition 'caseDep € {F1,F2,F3,A1,A2,A3}' respectee")
    }

    do{
      try champBatailleTest.caseAtteignable(caseDep : "A1", caseArr : "F8", nomCarte : "Roi")
      print("precondition 'caseArr € {F1,F2,F3,A1,A2,A3}' non respectee")
      retourTest += 1
    }
    catch{
      print("precondition 'caseArr € {F1,F2,F3,A1,A2,A3}' respectee")
    }
    do{
      try champBatailleTest.caseAtteignable(caseDep : "A1", caseArr : "F1", nomCarte : "Poule")
      print("precondition 'nomCarte € {Roi, Archer, Garde, Soldat}' non respectee")
      retourTest += 1
    }
    catch{
      print("precondition 'nomCarte € {Roi, Archer, Garde, Soldat}' respectee")
    }
    return retourTest
}

func insererCarteTest() -> Int{
  var retourTest : Int = 0
  var champBatailleTest : champBataille = champBataille()
  var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 5, nvEtat : false, nvPos : "F2", nvEmplacement : 3)
  var caseTest : Case = Case(nom : "E6")
  do{
    try champBatailleTest.insererCarte(cas : caseTest, carte : carteTest)
    print("precondition 'la case appartient à {F1,F2,F3,A1,A2,A3}' non respectee")
    retourTest += 1
  }
  catch{
    print("precondition 'la case appartient à {F1,F2,F3,A1,A2,A3}' respectee")
  }
  var caseTest2 : Case = Case(nom : "F2")
  caseTest2.modifierCase(newEtat : true)
  do{
    try champBatailleTest.insererCarte(cas : caseTest2, carte : carteTest)
    print("precondition 'la case est vide' non respectee")
    retourTest += 1
  }
  catch{
    print("precondition 'la case est vide' respectee")
  }

  caseTest2.modifierCase(newEtat : false)
  let r : Bool = champBatailleTest.insererCarte(cas : caseTest2, carte : carteTest).getCase(nom : "F2").etatCase()
  if !r {
    print("la carte n'a pas ete correctement inseree")
    retourTest += 1
  }
  else{
    print("la carte a ete correctement inseree")
  }
  return retourTest
}

func redresserCarteTest() -> Int {
  var retourTest : Int = 0
  var champBatailleTest : champBataille = champBataille() //il est vide
  do{
    try champBatailleTest.redresserCarte()
    print("precondition 'champVide()==False' non respectee")
    retourTest += 1
  }
  catch{
    print("precondition 'champVide()==False' respectee")
  }

  var carteTest : Carte = Carte(nvNom : "Archer", nvDefense : 10, nvAttaque : 5, nvEtat : true, nvPos : "F2", nvEmplacement : 3)
  var caseTest : Case = Case(nom : "F2")
  champBatailleTest.insererCarte(cas : caseTest, carte : carteTest)
  champBatailleTest.redresserCarte()
  let r : Bool = carteTest.getEtatCarte()
  if r {
    print("redresserCarte ne realise pas sa fonction")
    retourTest += 1
  }
  else{
    print("redresserCarte fonctionne")
  }
  return retourTest
}

print("il y a "+initTest()+" erreurs dans la fonction init() du type champBataille\n")
print("il y a "+getCaseTest()+" erreurs dans la fonction getCase() du type champBataille\n")
print("il y a "+getCarteTest()+" erreurs dans la fonction getCarte() du type champBataille\n")
print("il y a "+nbreCarteChampTest()+" erreurs dans la fonction nbreCarteChamp() du type champBataille\n")
print("il y a "+nbreCarteDefensechampTest()+" erreurs dans la fonction NbreCarteChampBataille() du type champBataille\n")
print("il y a "+caseAtteignableTest()+" erreurs dans la fonction caseAtteignable() du type champBataille\n")
print("il y a "+insererCarteTest()+" erreurs dans la fonction insererCarte() du type champBataille\n")
print("il y a "+redresserCarteTest()+" erreurs dans la fonction redresserCarte() du type champBataille\n")
