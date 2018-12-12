//Partie est un ensemble qui comprend 2 joueurs, et des conditions de fin de partie
public protocol PartieProtocol {
    associatedtype Joueur : JoueurProtocol

    //init : -> Partie
    //création d'une partie, initialisée avec 2 joueurs (et chacun son roi) et un indicateur, motif et gagnant de fin de partie
    //postconfition : getFin(partie)==false, getMotifFin(partie)==Vide, getGagnant=Vide , joueurCourant().nom()=="J1", joueurAdverse().nom()=="J2"
    init()

    //joueurCourant : Partie -> Joueur
    //retourne le joueur qui est en train de joué pendant ce tour
    //postcondition : joueurCourant().nom()=="J1" ou "J2"
    func joueurCourant()->Joueur

    //joueurAdverse : Partie -> Joueur
    //retourne le joueur qui n'est pas en train de joué pendant ce tour
    //postcondition : joueurCourant().nom()=="J1" ou "J2"
    //postcondition : joueurCourant()!=joueurAdverse()
    func joueurAdverse()->Joueur

    //setJoueurCourant : PartiexJoueur->Partie
    //modifie le joueur courant avec celui en parametre
    //donnee : un Joueur
    //precondition : j.nom()=="J1" ou "J2"
    @discardableResult
    mutating func setJoueurCourant(j : Joueur) throws -> Self

    //setJoueurAdverse : PartiexJoueur->Partie
    //modifie le joueur adverse avec celui en parametre
    //donnee : un Joueur
    //precondition : j.nom()=="J1" ou "J2"
    @discardableResult
    mutating func setJoueurAdverse(j : Joueur) throws -> Self

    //getFin : Partie -> Bool
    //retourne vrai si la partie est terminée et faux sinon
    func getFin() -> Bool

    //setFin : Partie x Bool -> Partie
    //modifie le booléen fin de la partie en cours
    @discardableResult
    mutating func setFin(nvFin : Bool) -> Self

    //getMotifFin : Partie -> String
    //Retourne le motif par lequel s'est terminée la partie
    func getMotifFin() -> String?

    //setMotifFin : Partie x String -> Partie
    //modifie le motif de fin de la partie avec celui passé en paramètre
    @discardableResult
    mutating func setMotifFin(nvMotifFin : String) -> Self

    //getGagnant : Partie -> String
    //Retourne le gagnant de la partie
    //postcondition : si getFin(partie)==true => getGagnant(partie)=="J1" ou "J2" ou "egalité"
    func getGagnant() -> String?

    //setGagnant : Partie x String -> Partie
    //modifie le gagnant de la partie avec celui passé en paramètre
    //postcondition : setGagnant(nvGagnant) => getGagnant == "J1" ou "J2" ou "egalité"
    @discardableResult
    mutating func setGagnant(nvGagnant : String) throws -> Self
}
