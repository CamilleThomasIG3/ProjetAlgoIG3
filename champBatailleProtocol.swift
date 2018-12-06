//ChampBataille représente, pour un joueur, son côté du champ de bataille. Il est composé de 6 positions
protocol ChampBatailleProtocol  : Sequence {
    associatedtype IteratorCB : IteratorProtocol
        where IteratorCB.Element == Case
    associatedtype Carte : CarteProtocol
    associatedtype Case : CaseProtocol

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
    //precondition : position € {F1,F2,F3,A1,A2,A3}
    //postcondition: init() => getCarte(position) == nil, insererCarte(case,carte) => getCarte(case) == carte
    func getCarte(position : String) throws -> Carte?

    //NbreCartechamp : ChampBataille -> Int
    //retourne le nombre de cartes présentes sur le ChampBataille
    //Post : si champVide() == Vrai => NbreCarteChamp==0
    //Post : si champVide() == Faux => NbreCartechamp>0
    func NbreCarteChamp() -> Int

    //NbreCarteDefensechamp : ChampBataille -> Int
    //retourne le nombre de cartes EN MODE DEFENSE présentes sur le ChampBataille
    //Post : si champVide() == Faux => NbreCarteDefensechamp>0
    func NbreCarteDefenseChamp() -> Int

    //caseAtteignable : ChampsBataillexCasexCasexString -> Bool
    //retourne vrai si la CaseArr de l'adversaire est atteignable par la carte de nom nomCarte placée en caseDep, faux sinon
    //Precondition : caseDep et caseArr € {F1,F2,F3,A1,A2,A3}
    //Precondition : nomCarte € {Roi, Archer, Garde, Soldat}
    func caseAtteignable(caseDep : Case, caseArr : Case, nomCarte : String) throws -> Bool

    //ChampVide : ChampBataille -> Bool
    //retourne un vrai si le ChampBataille est vide, faux sinon
    func champVide() -> Bool

    //insererCarte : CHampBataille x Case x Carte-> ChampBataille
    //insère une carte sur la case passée en paramètre du champs de bataille
    //donnee : une case et une carte
    //precondition : la case appartient à {F1,F2,F3,A1,A2,A3}
    //precondition : la case est vide
    //postcondittion : champVide==False
    @discardableResult
    mutating func insererCarte(cas : Case, carte : Carte) throws -> Self

    //redresserCarte : CHampBataille -> ChampBataille
    //met toutes les cartes présentes sur le CB en etat de défense
    //precondition : champVide()==False
    @discardableResult
    mutating func redresserCarte() throws -> Self

    //makeIterator : ChampBataille -> IteratorCB
    //Crée un itérateur sur la collection pour la parcourir dans l'ordre des Cases qui la composent
    func makeIterator() -> IteratorCB
}
