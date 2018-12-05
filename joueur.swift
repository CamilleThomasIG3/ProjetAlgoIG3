//Joueur est un ensemble comportant champBataille, Pioche , Royaume et Main
protocol Joueur {
    //init : -> Joueur
    //création d'un Joueur, initialisé avec nom, champBataille, Pioche, Royaume et Main
    init()

    //nom : Joueur -> String
    //retourne le nom du joueur
    //postcondition : nom(joueur)=="J1" ou "J2"
    func nom() -> String

    //setNom : JoueurxString -> Joueur
    //modifie le nom du joueur
    //precondition : nom(joueur)=="J1" ou "J2"
    @discardableResult()
    mutating func setNom(nvNom : String) -> Self

    //champBataille : Joueur -> champBataille
    //retourne le champBataille du joueur
    func champBataille() -> champBataille

    //pioche : Joueur -> Pioche
    //retourne la Pioche du joueur
    func pioche() -> Pioche

    //royaume : Joueur -> Royaume
    //retourne le Royaume du joueur
    func royaume() -> Royaume

    //main : Joueur -> Main
    //retourne la Main du joueur
    func main() -> Main
}
