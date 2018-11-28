//Carte représente une carte du jeu, elle est caractérisée par un nom (qui correspond à son type), une valeur d'attaque, une valeur de défense, une position sur le ChampBataille et un Emplacement sur le Plateau
protocol Carte : {
    //init: -> Carte
    //Création d'une carte initialisée avec une valeur d'attaque, de défense, une position sur le ChampBataille et un Emplacement sur le Plateau
    init()//plusieurs créations en fonction du type de carte pour éviter de devoir changer les valeurs pour chaque carte ?
    
    //nom : Carte -> String
    //retourne le nom de la Carte (le nom correspond au type de carte, càd Archer, Soldat, Garde)
    func nom() -> String
    
    //attaque : Carte -> Int
    //retourne la valeur d'attaque de la Carte
    func attaque() -> Int
    
    //defense : Carte -> Int
    //retourne la valeur de défense de la Carte
    func defense() -> Int
    
    //position : Carte -> Position
    //retourne la Position de la Carte
    func position() -> Position
    
    //etatCarte : Carte -> Bool
    //retourne l'état de la Carte (si elle se trouve en position d'attaque ou de défense)
    func etatCarte() -> Bool
    //attaque ou défense
    
    //modifierEtatCarte : Carte x Bool -> Carte
    //change l'Etat de la Carte passée en paramètre par le booléen passé en paramètre
    //Pre: La Carte doit exister (avoir été initialisée) et sa position doit correspondre à un emplacement du Plateau
    //Post: etatCarte() == newEtat (le booléen passé en paramètre)
    @discardableResult
    mutating func modifierEtatCarte(newEtat : Bool) -> Self
    
    //emplacementCarte : Carte -> Emplacement
    //retourne l'Emplacement de la Carte
    func emplacementCarte() -> Emplacement
} 
