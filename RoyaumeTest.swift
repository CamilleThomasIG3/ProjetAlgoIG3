func premierRoyaumeTest() -> Int{
    var retourTest : Int = 0
    var royaumeTest : Royaume = Royaume()
    do{
        try royaumeTest.premierRoyaume()
        print("precondition 'premierRoyaume(royaume) => !pioche.royaumeVide()' non respectee")
        retourTest += 1
    }
    catch{
        print("precondition 'premierRoyaume(royaume) => !pioche.royaumeVide()' respectee")
    }
    return retourTest
}

func ajouterRoyaumeTest() -> Int{
    var retourTest : Int = 0
    var royaumeTest : Royaume = Royaume()
    do{
        try royaumeTest.ajouterRoyaume()
        print("precondition 'ajouterRoyaume(royaume) => !pioche.royaumeVide()' non respectee")
        retourTest += 1
    }
    catch{
        print("precondition 'ajouterRoyaume(royaume) => !pioche.royaumeVide()' respectee")
    }
    var c : Carte = Carte()
    var royaume2 : Royaume : Royaume()
    royaumeTest.ajouterRoyaume(carte : c)
    if royaumeTest.tailleRoyaume()-1 != royaume2.tailleRoyaume()
    {
        print("postcondition 'tailleRoyaume(ajouterRoyaume(carte))=tailleRoyaume()+1' non respectee")
        retourTest += 1
    }
    else
    {
        print("postcondition 'tailleRoyaume(ajouterRoyaume(carte))=tailleRoyaume()+1' respectee")
    }
    return retourTest
}

func tailleRoyaumeTest() -> Int{
    var retourTest : Int = 0
    var royaumeTest : Royaume = Royaume()
    if royaumeTest.tailleRoyaume()<0 || royaumeTest.tailleRoyaume()>42
    {
        print("postcondition '0≤tailleRoyaume(royaume)≤42' non respectee")
        retourTest += 1
    }
    else
    {
        print("postcondition '0≤tailleRoyaume(royaume)≤42' respectee")
    }
    return retourTest
}

print("il y a "+premierRoyaumeTest()+" erreurs dans la fonction premierRoyaume() du type pioche\n")
print("il y a "+ajouterRoyaumeTest()+" erreurs dans la fonction ajouterRoyaume() du type pioche\n")
print("il y a "+tailleRoyaumeTest()+" erreurs dans la fonction tailleRoyaume() du type pioche\n")
