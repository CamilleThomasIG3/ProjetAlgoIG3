//Carte représente une carte du jeu, elle est caractérisée par un nom (qui correspond à son type), une valeur d'attaque, une valeur de défense, une position sur le champBataille et un Emplacement sur le Plateau
protocol Carte {
    //init: -> Carte
    //Création d'une carte initialisée avec un nom, une valeur d'attaque, de défense, une position sur le champBataille et un Emplacement sur le Plateau par defaut
    init()

    //init: -> Carte
    //Création d'une carte initialisée avec une valeur de nom, d'attaque, de défense et un etat passées en parametre
    //on mettra le reste par defaut
    init(nvNom : String, nvDefense : Int, nvAttaque : Int, nvEtat : Bool, nvPos : String?)

    //getNom : Carte -> String
    //retourne le nom de la Carte (le nom correspond au type de carte, càd Archer, Soldat, Garde, Roi)
    func getNom() -> String

    //getAttaque : Carte -> Int
    //retourne la valeur d'attaque de la Carte
    //precondition : carte soldat que si son emplacement est Main (car point depend du nombre de carte dans la main)
    func getAttaque() -> Int

    //getDefense : Carte -> Int
    //retourne la valeur de défense de la Carte
    func getDefense() -> Int

    //getPosition : Carte -> String?
    //retourne le nom de la poistion de la Carte sur le champ de bataille (ou Vide si la carte n'est pas placée sur le champ de bataille)
    func getPosition() -> String?

    //getEtatCarte : Carte -> Bool
    //retourne l'état de la Carte (si elle se trouve en position d'attaque (vrai) ou de défense (faux) (vide si elle n'est pas sur le champ de bataille))
    func getEtatCarte() -> Bool?

    //getEmplacement : Carte -> Int?
    //retourne un entier correspondant à l'emplacement d'une Carte sur le Plateau (0 : Pioche,1 : Main,2 : Royaume,3 : champBataille, Vide : Cimetière)
    //Post : init() => getEmplacement() == (une valeur de base ou vide (si Vide : la carte a été détruite))
    func getEmplacement() -> Int?

    //getDegat : Carte -> Int
    //retourne le nombre de point de dégat de la carte
    func getDegat() -> Int

    //setAttaque : Int x Carte -> Carte
    //remplace l'attaque de la Carte par la valeur passée en paramètre
    //précondition : nvAttaque >= 0 et <= 7
    //postcondition : setAttaque(nvAttaque) => getAttaque() == nvAttaque
    @discardableResult
    mutating func setAttaque(nvAttaque : Int) -> Self

    //setPosition : String? x Carte -> Carte
    //modifie le nom de la position avec celui passe en parametre
    //donnee : nvPos : String?
    //precondition : nvPos doit être un nom valable (F1,F2,F3,A1,A2,A3) ou Vide
    //postcondition : getNom() == nvPos
    @discardableResult
    mutating func setPosition(nvPos : String?) -> Self

    //setEtatCarte : Carte x Bool -> Carte
    //change l'Etat de la Carte par le booléen passé en paramètre
    //Post: getEtatCarte() == newEtat (le booléen passé en paramètre)
    @discardableResult
    mutating func setEtatCarte(nvEtat : Bool) -> Self

    //setEmplacement : Carte x Int -> Carte
    //change la valeur de l'Emplacement de la carte par l'entier passé en paramètre
    //Pre: newEmplacement est l'une des valeurs valables pour Emplacement (0 : Pioche, 1 : Main, 2 : Royaume, 3 : Champ de bataille, Vide : détruite)
    //Post: getEmplacement() == newEmplacement
    @discardableResult
    mutating func setEmplacement(newEmplacement : Int?) -> Self

    //setdegat : CartexInt -> Carte
    //change le nombre de point de dégat de la carte en ajoutant le degat passé en paramètre
    //postcondition : si degat(carte)>defense(carte) => empalcement(carte)=cimetiere
    //postcondition : si 0<degat(carte)<defense(carte) => emplacement(carte)=champDeBataille
    @discardableResult
    mutating func setDegat(nvDegat : Int) -> Self
}
