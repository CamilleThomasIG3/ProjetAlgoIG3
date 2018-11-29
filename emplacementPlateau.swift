//Emplacement représente l'endroit du Plateau de jeu où se trouve une Carte (Pioche, Main, Royaume ou ChampsBataille) à tout moment de la partie
protocol Emplacement : {
    //init : -> Emplacement
    //Création d'un Emplacement
    init()

    //getEmplacement : Emplacement -> Int
    //retourne un entier correspondant à l'emplacement d'une Carte sur le Plateau (Pioche, Main, Royaume, ChampBataille) /!\ Quand une carte est détruite on fait quoi de l'emplacement ?
    //Post : init() => getEmplacement() == (une valeur de base)
    func getEmplacement() -> Int

    //setEmplacement : Emplacement x Int -> Emplacement
    //change la valeur de l'Emplacement par l'entier passé en paramètre
    //Pre: newEmplacement est l'une des valeurs valables pour Emplacement
    //Post: getEmplacement() == newEmplacement
    @discardableResult
    mutating func setEmplacement(newEmplacement : Int) -> Self
}
