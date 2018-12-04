//champBataille représente, pour un joueur, son côté du champ de bataille. Il est composé de 6 positions
protocol champBataille  : Sequence {
    associatedtype IteratorCB : IteratorProtocol
        where IteratorCB.Element == Case

    //init : -> champBataille
    //Création d'un champBataille composé de 6 Cases
    //Post : init() => champVide() == Vrai
    init()

    //getCase : StringxchampBataille -> Case
    //retourne une case du champBataille
    //donnee : le nom de la case voulu
    func getCase(nom : String)->Case

    //getCarte : StringxchampBataille -> Carte
    //retourne la carte du champBataille qui est à la position passée en paramètre
    //donnee : une position
    //precondition : position € {F1,F2,F3,A1,A2,A3}
    //postcondition: init() => getCarte(position) == nil, insererCarte(case,carte) => getCarte(case) == carte
    func getCarte(position : String)->Carte?

    //nbCarteChamp : champBataille -> Int
    //retourne le nombre de carte présent sur le champBataille
    //Post : si nbCarteChamp==0 => champVide() == Vrai
    //Post : si nbCarteChamp>0 => champVide() == Faux
    func nbCarteChamp() -> Int

    //NbreCarteDefensechamp : champBataille -> Int
    //retourne le nombre de carte présent sur le champBataille
    //Post : si NbreCarteDefensechamp>0 => champVide() == Faux
    func NbreCarteDefensechamp() -> Int

    //caseAtteignable : champBataillexCasexCasexString -> Bool
    //retourne vrai si la CaseArr de l'adversaire est atteignable par la carte de nom nomCarte placée en caseDep, faux sinon
    //Precondition : caseDep et caseArr € {F1,F2,F3,A1,A2,A3}
    //Precondition : nomCarte € {Roi, Archer, Garde, Soldat}
    func caseAtteignable(caseDep : Case, caseArr : Case, nomCarte : String) -> Bool

    //ChampVide : champBataille -> Bool
    //retourne un vrai si le champBataille est vide, faux sinon
    func champVide() -> Bool

    //insererCarte : CHampBataille x Case x Carte-> champBataille
    //insère une carte sur la case passée en paramètre du champs de bataille
    //donnee : une case et une carte
    //precondition : la case appartient au ChampBAtaille
    //precondition : la case est vide
    //postcondittion : champVide==False
    @discardableResult
    mutating func insererCarte(cas : Case, carte : Carte)->Self

    //redresserCarte : CHampBataille -> champBataille
    //met toutes les cartes présentes sur le CB en etat de défense
    //precondition : champVide()==False
    @discardableResult
    mutating func redresserCarte()->Self

    //makeIterator : champBataille -> IteratorCB
    //Crée un itérateur sur la collection pour la parcourir dans l'ordre des Cases qui la composent
    func makeIterator() -> IteratorCB
}
