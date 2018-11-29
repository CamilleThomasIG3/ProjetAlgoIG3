//ChampBataille représente, pour un joueur, son côté du champ de bataille. Il est composé de 6 positions
protocol ChampBataille  : Sequence {
    associatedtype IteratorCB : IteratorProtocol
        where IteratorCB.Element == Case

    //init : -> ChampBataille
    //Création d'un ChampBataille composé de 6 Cases
    //Post : init() => champVide() == Vrai
    init()

    //insererCarte : CHampBataille x Case -> ChampBataille
    //insère une carte sur la case passée en paramètre du champs de bataille
    //donnee : une case
    //precondition : la case appartient au ChampBAtaille
    //precondition : la case est vide
    //postcondittion : champVide==False
    @discardableResult
    mutating func insererCarte(case : Case)->Self

    //NbreCartechamp : ChampBataille -> Int
    //retourne le nombre de carte présent sur le ChampBataille
    //Post : si NbreCartechamp==0 => champVide() == Vrai
    //Post : si NbreCartechamp>0 => champVide() == Faux
    func NbreCartechamp() -> Int

    //ChampVide : ChampBataille -> Bool
    //retourne un vrai si le ChampBataille est vide, faux sinon
    func champVide() -> Bool

    //redresserCarte : CHampBataille -> ChampBataille
    //met toutes les cartes présentes sur le CB en etat de défense
    //precondition : champVide()==False
    @discardableResult
    mutating func redresserCarte()->Self

    //makeIterator : ChampBataille -> IteratorCB
    //Crée un itérateur sur la collection pour la parcourir dans l'ordre des Cases qui la composent
    func makeIterator() -> IteratorCB
}
