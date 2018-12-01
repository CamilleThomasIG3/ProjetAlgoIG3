//Joueur est un ensemble comportant ChampsBataille, Pioche , Royaume et Main
protocol Joueur : {
    //init : -> Joueur
    //création d'un Joueur, initialisé avec nom, ChampBataille, Pioche, Royaume et Main
    init()

    //nom : Joueur -> String
    //retourne le nom du joueur
    func nom() -> String

    //champs : Joueur -> ChampsBataille
    //retourne le ChampBataille du joueur
    func champsBataille() -> ChampBataille

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
