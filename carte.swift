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
    //precondition : carte soldat que si son emplacement est Main (car point depend du nombre de carte dans la main)
    func attaque() -> Int

    //defense : Carte -> Int
    //retourne la valeur de défense de la Carte
    func defense() -> Int

    //emplacement : Carte -> Emplacement
    //retourne l'emplacaement de la Carte sur le plateau
    func position() -> Position?

    //etatCarte : Carte -> Bool
    //retourne l'état de la Carte (si elle se trouve en position d'attaque ou de défense)
    func etatCarte() -> Bool
    //attaque ou défense

    //getdegat : Carte -> Int
    //retourne le nombre de point de dégat de la carte
    func getdegat()->Int

    //setdegat : CartexInt -> Carte
    //change le nombre de point de dégat de la carte en ajoutant le degat passé en paramètre
    //postcondition : si degat(carte)>defense(carte) => empalcement(carte)=cimetiere
    //postcondition : si 0<degat(carte)<defense(carte) => emplacement(carte)=champDeBataille
    @discardableResult
    mutating func setdegat(degat : Int)->Self

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
