//Un jeu est une collection de toutes les pieces du jeu
protocol JeuProtocol : Sequence {
    associatedtype Position : PositionProtocol
    associatedtype Piece : PieceProtocol
    associatedtype IteratorJeu : IteratorProtocol
        where IteratorJeu.Element == Piece

    //init : -> Jeu
	//Initialisation : Creation d une collection de pieces comportant tous les yokais/pieces du jeu
	//initialise les pieces des joueurs sur les bonnes positions
	//on aura donc :
    //le koropokkuru du joueur 1 en position (2,4, vrai)
    //le koropokkuru du joueur 2 en Position (2,1, vrai)
    //le kodama du joueur 1 en position (2,3, vrai)
    //le kodama du joueur 2 en position (2,2, vrai)
    //le kitsune du joueur 1 en position (1,4, vrai)
    //le kitsune du joueur 2 en position (3,1, vrai)
    //le tanuki du joueur 1 en position (3,4, vrai)
    //le tanuki du joueur 2 en position (1,1, vrai)
	init()


	//getPiece : Jeu x Position -> (Piece | Vide)
	//Description : 
	//	Renvoie la piece correspondant a la position passee en parametre
	//	ou vide s il n y en a pas
	//Donnees et precondition :
	//	renvoie vide si la position est (-1,-1)
	//	Position : La position a laquelle se situe la piece qu on veut.
	//	La 1ere coordonnee de la position doit etre un entier compris entre 1 et 3 inclus
	//	La 2eme coordonnee de la position doit etre un entier compris entre 1 et 4 inclus	
	//Resultat et postcondition : 
	//	renvoie la piece a laquelle la position correspond
	func getPiece (position : Position) -> Piece?

	//estOccupeeAllie : Jeu x Position x Int -> Bool
	//Description : 
    //	Renvoie vrai si une piece alliee est sur la position donnee en parametre, faux sinon
    //Donnees et precondition :
    //	Position : la position qu on veut etudier
	//	La 1ere coordonnee de la position doit etre un entier compris entre 1 et 3 inclus
	//	La 2eme coordonnee de la position doit etre un entier compris entre 1 et 4 inclus
    //	Int : Le numero du joueur qui joue, compris entre 1 et 2
    //Resultat :
    //	Renvoie un booleen vrai si une piece alliee est sur la position donnee en parametre, faux sinon
    func estOccupeeAllie (position : Position, joueur : Int) -> Bool

    //estOccupeeEnnemi : Jeu x Position x Int -> Bool
    //Description : 
    //	Renvoie vrai si une piece ennemie est sur la position donnee en parametre, erreur si position egal a (-1,-1), faux sinon
    //Donnees et precondition :
    //	Position : la position qu on veut etudier
	//	La 1ere coordonnee de la position doit etre un entier compris entre 1 et 3 inclus
	//	La 2eme coordonnee de la position doit etre un entier compris entre 1 et 4 inclus
    //	Int : Le numero du joueur qui joue, compris entre 1 et 2
    //Resultat :
    //	Renvoie un booleen vrai si une piece ennemie est sur la position donnee en parametre, faux sinon
    func estOccupeeEnnemi (position : Position, joueur : Int) -> Bool

    //makeIterator : Jeu -> IteratorJeu
	//Description :
    //  Parcourt toutes les pieces 
    //  Creer un iterateur sur la collection pour iterer avec for in
	func makeIterator() -> IteratorJeu


    
}

