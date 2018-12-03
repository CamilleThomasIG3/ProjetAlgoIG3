//Partie est un ensemble qui comprend 2 joueurs, et des conditions de fin de partie
protocol Partie {
    //init : -> Partie
    //création d'une partie, initialisée avec 2 joueurs (et chacun son roi) et un indicateur, motif et gagnant de fin de partie
    //postconfition : getFin(partie)==false, getMotifFin(partie)==Vide, getGagnant=Vide , joueurCourant=="J1"
    init()

    //J1 : Partie -> Joueur
    //Retourne le joueur 1 de la partie
    //postcondition : J1.name()=="J1"
    func J1() -> Joueur

    //J2 : Partie -> Joueur
    //Retourne le joueur 2 de la partie
    //postcondition : J2.name()=="J2"
    func J2() -> Joueur

    //joueurCourant : Partie -> Joueur
    //retourne le joueur qui est en train de joué pendant ce tour
    //postcondition : joueurCourant()=="J1" ou "J2"
    func joueurCourant()->Joueur

    //setJoueurCourant : PartiexJoueur->Partie
    //modifie le joureur courant avec celui en parametre
    //donnee : un Joueur
    //precondition : j=="J1" ou "J2"
    //postconditon : joueurCourant(setJoueurCourant(j))==j
    @discardableResult
    mutating func setJoueurCourant(j : Joueur)->Self

    //getFin : Partie -> Bool
    //retourne vrai si la partie est terminée et faux sinon
    func getFin() -> Bool

    //setFin : Partie x Bool -> Partie
    //modifie le booléen fin de la partie en cours
    @discardableResult
    mutating func setFin(nvFin : Bool) -> Partie

    //getMotifFin : Partie -> String
    //Retourne le motif par lequel s'est terminée la partie
    func getMotifFin() -> String?

    //setMotifFin : Partie x String -> Partie
    //modifie le motif de fin de la partie avec celui passé en paramètre
    @discardableResult
    mutating func setMotifFin(nvMotifFin : String) -> Partie

    //getGagnant : Partie -> String
    //Retourne le gagnant de la partie
    //postcondition : si getFin(partie)==true => getGagnant(partie)=="J1" ou "J2" ou "egalité"
    func getGagnant() -> String?

    //setGagnant : Partie x String -> Partie
    //modifie le gagnant de la partie avec celui passé en paramètre
    //precondtion : nvGagnant != ""
    //postcondition : setGagnant(nvGagnant) => getGagnant == "J1" ou "J2" ou "egalité"
    @discardableResult
    mutating func setGagnant(nvGagnant : String) -> Partie
}
