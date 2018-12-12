import "AlgoThomasCouchyLibrary"

func initTest() -> Int{
  var retourTest : Int = 0
  var caseTest : Case = Case(nom : "A1")
  let r : String = caseTest.nom()
  if r != "A1"{
    print("le nom de Case est mal initialise")
    retourTest += 1
  }
  else{
    print("le nom de Case est bien initialise")
  }
  let r2 : Bool = caseTest.etatCase()
  if r2 != false{
    print("l'etat de Case est mal initialise")
    retourTest += 1
  }
  else{
    print("l'etat de Case est bien initialise")
  }
  return retourTest
}

func nomTest() -> Int{
    var retourTest : Int = 0
    var caseTest : Case = Case(nom : "A1")
    let r : String = caseTest.nom()
    if r != "A1"{
        print("Le nom de la Case est mal recupere")
        retourTest += 1
    }
    else{
        print("Le nom de la Case est bien recupere")
    }

func etatCaseTest() -> Int{
    var retourTest : Int = 0
    var caseTest : Case = Case(nom : "A1")
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
    var caseTest : Case = Case(nom : "A1")
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

print("il y a "+initTest()+" erreurs dans la fonction init() du type Case\n")
print("il y a "+nomTest()+" erreurs dans la fonction nom() du type Case\n")
print("il y a "+etatCaseTest()+" erreurs dans la fonction etatCase() du type Case\n")
print("il y a "+modifierCaseTest()+" erreurs dans la fonction modifierCase() du type Case\n")
