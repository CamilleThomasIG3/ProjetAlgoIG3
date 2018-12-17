import Foundation

//Plateau est une collection de Position
//Cette collection peut etre parcourue par un iterateur
protocol PlateauProtocol : Sequence {
    associatedtype Position : PositionProtocol
    associatedtype IteratorPlateau : IteratorProtocol
        where IteratorPlateau.Element == Position

    
    //init : -> Plateau
    //Initialise une partie de douze positions 
    //dont la 1ère coordonnée correspondant à la "largeur" du plateau est un entier compris entre 1 et 3
    //et dont la 2ème coordonnée est un entier compris entre 1 et 4 et correspond à la "longueur" du plateau.
    //Une partie est une collection de position
    //on aura donc :
    //le koropokkuru du joueur 1 en position (2,4, vrai)
    //le koropokkuru du joueur 2 en Position (2,1, vrai)
    //le kodama du joueur 1 en position (2,3, vrai)
    //le kodama du joueur 2 en position (2,2, vrai)
    //le kitsune du joueur 1 en position (1,4, vrai)
    //le kitsune du joueur 2 en position (3,1, vrai)
    //le tanuki du joueur 1 en position (3,4, vrai)
    //le tanuki du joueur 2 en position (1,1, vrai)
    //Ne pas oublier d initialiser le booleen de position a faux pour les cases ne contenant pas de piece
    init ()

    //getPos: Plateau x Int x Int -> Position
    //Description:
    //  Renvoie la position qui est situee aux coordonnees (x,y)
    //Donnees et precondition :
    //  l entier x doit etre compris entre 1 et 3 inclus
    //  l entier y doit etre compris entre 1 et 4 inclus 
    func getPos (x :Int, y:Int) ->Position

    //makeIterator : Plateau -> ItPlateau
    //Description :
    //  Parcourt toutes les positions 
    //  Creer un iterateur sur la collection pour iterer avec for in.
    //  L iteration se fait de gauche(1,1) à droite (3,1) et de haut (1,1) en bas (1,4)
    func makeIterator () -> IteratorPlateau
}

