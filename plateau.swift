//Plateau est un ensemble de ChapsBataille (un par joueur), Pioche (une par joueur), Royaume (un par joueur) et Main (une par joueur)
protocol Plateau : {
    //init : -> Plateau
    //création d'un Plateau, initialisé avec 2 ChampBataille, 2 Pioche, 2 Royaume et 2 Main
    init()
    
    //champsJ1 : Plateau -> ChampsBataille
    //retourne le ChampBataille du joueur 1
    func champsJ1() -> ChampBataille
    
    //piocheJ1 : Plateau -> Pioche
    //retourne la Pioche du joueur 1
    func piocheJ1() -> Pioche
    
    //royaumeJ1 : Plateau -> Royaume
    //retourne le Royaume du joueur1
    func royaumeJ1() -> Royaume
    
    //mainJ1 : Plateau -> Main
    //retourne la Main du joueur 1
    func mainJ1() -> Main
    
    //champsJ2 : Plateau -> ChampsBataille
    //retourne le ChampBataille du joueur 2
    func champsJ2() -> ChampsBataille
    
    //piocheJ2 : Plateau -> Pioche
    //retourne la Pioche du joueur 2
    func piocheJ2() -> Pioche
    
    //royaumeJ2 : Plateau -> Royaume
    //retourne le Royaume du joueur2
    func royaumeJ2() -> Royaume
    
    //mainJ2 : Plateau -> Main
    //retourne la Main du joueur 2
    func mainJ2() -> Main
}
