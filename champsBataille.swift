//ChampBataille représente, pour un joueur, son côté du champ de bataille. Il est composé de 6 positions
protocol ChampBataille  : Sequence {
    associatedtype IteratorCB : IteratorProtocol
        where IteratorCB.Element == Case

    //init : -> ChampBataille
    //Création d'un ChampBataille composé de 6 Cases
    //Post : init() => champVide() == Vrai
    init()

    //getCase : StringxChampsBataille -> Case
    //retourne une case du champsBAtaille
    //donnee : le nom de la case voulu
    func getCase(nom : String)->Case

    //getCarte : StringxChampsBataille -> Carte
    //retourne la carte du champsBataille qui est à la position passée en paramètre
    //donnee : une position
    //precondition : position € {F1,F2,F3,A1,A2,A3}, ChampBataille doit avoir été initialisé
    func getCarte(position : String)->Carte

    //NbreCartechamp : ChampBataille -> Int
    //retourne le nombre de carte présent sur le ChampBataille
    //Post : si NbreCartechamp==0 => champVide() == Vrai
    //Post : si NbreCartechamp>0 => champVide() == Faux
    func NbreCartechamp() -> Int

    //NbreCarteDefensechamp : ChampBataille -> Int
    //retourne le nombre de carte présent sur le ChampBataille
    //Post : si NbreCarteDefensechamp>0 => champVide() == Faux
    func NbreCarteDefensechamp() -> Int

    //caseAtteignable : ChampsBataillexCasexCasexString -> Bool
    //retourne vrai si la CaseArr de l'adversaire est atteignable par la carte de nom nomCarte placée en caseDep, faux sinon
    //Precondition : caseDep et caseArr € {F1,F2,F3,A1,A2,A3}
    //Precondition : nomCarte € {Roi, Archer, Garde, Soldat}
    func caseAtteignable(caseDep : Case, caseArr : Case, nomCarte : String) -> Bool

    //ChampVide : ChampBataille -> Bool
    //retourne un vrai si le ChampBataille est vide, faux sinon
    func champVide() -> Bool

    //insererCarte : CHampBataille x Case x Carte-> ChampBataille
    //insère une carte sur la case passée en paramètre du champs de bataille
    //donnee : une case et une carte
    //precondition : la case appartient au ChampBAtaille
    //precondition : la case est vide
    //postcondittion : champVide==False
    @discardableResult
    mutating func insererCarte(cas : Case, carte : Carte)->Self

    //redresserCarte : CHampBataille -> ChampBataille
    //met toutes les cartes présentes sur le CB en etat de défense
    //precondition : champVide()==False
    @discardableResult
    mutating func redresserCarte()->Self

    //makeIterator : ChampBataille -> IteratorCB
    //Crée un itérateur sur la collection pour la parcourir dans l'ordre des Cases qui la composent
    func makeIterator() -> IteratorCB
}
