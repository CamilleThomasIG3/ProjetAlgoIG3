func getEmplacementTest() -> Int {
    var retourTest : Int = 0
    var emplacementTest : Emplacement
    let r : Int? = emplacementTest.getEmplacement()
    if r != 0{
        print("Emplacement est mal initialise ou getEmplacement ne recupere pas sa valeur correctement")
        retourTest += 1
    }
    let r2 : Int? = emplacementTest.setEmplacement(newEmplacement : 3).getEmplacement()
    if r2 != 3{
        print("getEmplacement ne renvoie pas la bonne valeur (un entier valable)")
        retourTest += 1
    }
    let r3 : Int? = emplacementTest.setEmplacement(newEmplacement : nil).getEmplacement()
    if r3 != nil{
        print("getEmplacement ne renvoie pas la bonne valeur (devrait renvoyer vide)")
        retourTest += 1
    }
    return retourTest
}

func setEmplacementTest() -> Int {
    var retourTest : Int = 0
    var emplacementTest : Emplacement
    var newEmplacement : Int? = -1
    do{
        try emplacementTest.setEmplacement(newEmplacement : newEmplacement)
        print("Precondition non respectee pour setEmplacement : valeur non admissible")
        retourTest += 1
    }
    catch{
        print("Precondition pour setEmplacement bien respectee : valeur admissible")
    }
    newEmplacement = 2
    let r=emplacementTest.setEmplacement(newEmplacement : newEmplacement)
    if r.getEmplacement() != 2{
        print("setEmplacement ne modifie pas correctement Emplacement")
        retourTest += 1
    }
    return retourTest
}  
