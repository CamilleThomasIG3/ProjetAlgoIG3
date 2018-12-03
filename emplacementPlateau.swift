//Emplacement représente l'endroit du Plateau de jeu où se trouve une Carte (Pioche, Main, Royaume ou ChampsBataille) à tout moment de la partie
protocol Emplacement : {
    //init : -> Emplacement
    //Création d'un Emplacement
    //Post : la valeur initiale de l'Emplacement est 0
    init()

    //getEmplacement : Emplacement -> Int
    //retourne un entier correspondant à l'emplacement d'une Carte sur le Plateau (Pioche, Main, Royaume, ChampBataille)
    //Post : init() => getEmplacement() == (une valeur de base ou vide (si Vide : la carte a été détruite))
    func getEmplacement() -> Int?

    //setEmplacement : Emplacement x Int -> Emplacement
    //change la valeur de l'Emplacement par l'entier passé en paramètre
    //Pre: newEmplacement est l'une des valeurs valables pour Emplacement (0 : Pioche, 1 : Main, 2 : Royaume, 3 : Champ de bataille, Vide si elle a été détruite)
    //Post: getEmplacement() == newEmplacement
    @discardableResult
    mutating func setEmplacement(newEmplacement : Int?) -> Self
}
