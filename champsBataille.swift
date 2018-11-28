//ChampBataille représente, pour un joueur, son côté du champ de bataille. Il est composé de 6 positions
protocol ChampBataille  : Sequence {
    associatedtype IteratorCB : IteratorProtocol
    where IteratorCB.Element == Case
    
    //init : -> Champ
    //Création d'un ChampBataille composé de 6 Cases
    init()
    
    //ChampVide : ChampBataille -> Bool
    //retourne un vrai si le ChampBataille est vide, faux sinon
    //Post : init() => champVide() == Vrai
    func champVide() -> Bool
    
    //makeIterator : ChampBataille -> IteratorCB
    //Crée un itérateur sur la collection pour la parcourir dans l'ordre des Cases qui la composent
    func makeIterator() -> IteratorCB
}
