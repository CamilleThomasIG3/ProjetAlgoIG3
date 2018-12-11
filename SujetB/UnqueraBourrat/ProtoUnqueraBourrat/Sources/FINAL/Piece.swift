import Foundation
	
//piece est un numero, un nom, une position, un Int designant le joueur
protocol PieceProtocol {
    associatedtype PositionProtocol
    
    //init : Int x String x Position x Int -> Piece
	//Initialisation : Creation d une piece a partir d un yokai et une position
	//Donnees et precondition :
	//	numero : Le numero de la piece va permettre de l identifier. Il est different pour chaque piece.
	//			 Il reste fixe tout au long de la partie.
	//			 Comme il doit y avoir 8 piece, le numero doit etre compris entre 1 et 8
	//			 Le koropokkuru du joueur 1 a pour numero 1. (Il restera fixe meme apres qu il soit capture)
	//			 Le koropokkuru du joueur 2 a pour numero 2. (Il restera fixe meme apres qu il soit capture)
	//			 Le kodama du joueur 1 a pour numero 3. (Il restera fixe meme apres qu il soit capture)
	//			 Le kodama du joueur 2 a pour numero 4. (Il restera fixe meme apres qu il soit capture)
	//  Position : La position ou on desire creer la piece
	//		La 1ere coordonnee de la position doit etre un entier compris entre 1 et 3 inclus
	//		La 2eme coordonnee de la position doit etre un entier compris entre 1 et 4 inclus
	//		Le booleen de la position doit etre true (b, qui represente si la position est occupee)
	//	Int : Entier compris entre 1 et 2 designant le joueur
	//	nom : Le nom d un yokai. Ce doit etre l un des noms suivants :
	//		koropokkuru, kitsune, tanuki, kodama ou kodama samurai
	init (numero: Int, nom : String, position : PositionProtocol, joueur : Int)

	//changerNom : Piece x String -> Piece
	//Description : 
	//	Change le nom de la piece
	//Donnees et precondition :
	//	nom : Le nom qu on veut donner a la piece, chaine de caracteres
	//	l doit etre parmi les suivants : koropokkuru, kitsune, tanuki, kodama ou kodama samurai
	//Resultat et postcondition :
	//	Le nom de la piece donnee en parametre est change
	@discardableResult
	mutating func changerNom(nom :String) -> Self

	//changerJoueur : Piece x Int -> Piece
	//Description : 
	//	Change le joueur auquel appartient la piece
	//Donnees et precondition :
	//	joueur : entier compris entre 1 et 2 qui correspond au nouveau joueur auquel appartient la piece
	@discardableResult
	mutating func changerJoueur (joueur : Int) -> Self

	//getPosition : Piece -> Position
	//Description : 
	//	Renvoie la position de la piece qu on veut etudier
	//Resultat et postcondition : 
	//	Position : la position de la piece qu on etudie
	//	La 1ere coordonnee de la position doit etre un entier compris entre 1 et 3 inclus
	//	La 2eme coordonnee de la position doit etre un entier compris entre 1 et 4 inclus
	//	La position est de coordonnee x et y etant egales a -1 et -1 si la piece est en reserve
	//	Le booleen de la position doit etre true (b, qui represente si la position est occupee)
	func getPosition() -> PositionProtocol

	//getJoueur : Piece -> Int
	//Description : 
	//	Renvoie le joueur auquel appartient la piece
	//Resultat et postcondition : 
	//	Int : renvoie 1 si c est au joueur 1, 2 sinon.
	func getJoueur() -> Int

	//estEnReserve : Piece -> Bool
	//Description : 
	//	Renvoie vrai si la piece est en reserve, faux sinon
	func estEnReserve() -> Bool

	//getNom : Piece -> String 
	//Description : 
	//	Renvoie le nom de la piece donnee donne en parametre
	//Resultat et postcondition : 
	//	String : le nom du yokai (de la piece)
	//	Ce doit etre koropokkuru, kitsune, tanuki, kodama ou kodama samuraï
	func getNom() -> String

	//getNumero : Piece -> Int
	//Description : 
	//	Renvoie le numero de la piece donnee en parametre
	//Donnees et precondition :
	//Resultat et postcondition : 
	//	String : le numero du de la piece
	//	Il doit etre different pour chaque piece (auto-incremente)
	//	Il doit etre compris entre 1 et 8 et suivre les memes regles que celles donnees a l initialisation
	func getNumero() -> Int 

	//seFaireCapturer : Piece -> Piece
	//Description : 
	//	Met la piece situee a cette position en reserve et change de joueur a qui elle appartient
	//Donnees et precondition :
	//Resultat et postcondition : 
	//	Piece : les coordonnees de la position de la piece doivent etre egales a -1
	@discardableResult
	mutating func seFaireCapturer () -> Self

	//parachuter : Piece x Position -> Piece
	//Description : 
	//	Met la piece sur la position souhaitee
	//Donnees et precondition :
	//	La piece qu on veut parachuter doit etre en reserve, erreur sinon
	//	Position : la position a laquelle on veut parachuter notre piece.
	//	La 1ere coordonnee de la position doit etre un entier compris entre 1 et 3 inclus, erreur sinon
	//	La 2eme coordonnee de la position doit etre un entier compris entre 1 et 4 inclus, erreur sinon
	//	Elle (la position) doit etre libre (b = false)
	//Resultat et postcondition : 
	//	la piece a sa nouvelle position
	@discardableResult
	mutating  func parachuter (position: PositionProtocol) -> Self

	//deplacer : Piece x Position -> Piece
	//Description : 
	//	Deplace la piece a cette position
	//Donnees et precondition :
	//	Position : la position de la piece qu on etudie (elle n'est pas en reserve)
	//	La 1ere coordonnee de la position doit etre un entier compris entre 1 et 3 inclus
	//	La 2eme coordonnee de la position doit etre un entier compris entre 1 et 4 inclus
	//	Elle (la position) doit etre libre (b = false)
	//Resultat et postcondition : 
	//	la piece a sa nouvelle position
	@discardableResult
	mutating func deplacer (position : PositionProtocol) -> Self

	//deplacementPossible : Piece x Position -> Bool
	//Description : 
	//	Renvoie vrai si la piece donnee peut se deplacer sur la Position donnee
	//	koropokkuru : peut se deplacer d une seule case autour de lui
	//	kistune : peut se deplacer d une seule case en diagonale autour d elle
	//	tanuki : peut se deplacer d une seule case devant, derriere, ou sur les cotes
	//	kodama : peut se deplacer d une seule case, devant
	//	kodama samurai : peut se deplacer d une seule case autour de lui, partout, sauf sur les diagonales arrieres
	//	Pour le sens de la piece, se referer au joueur auquel elle appartient. 
	//	Le joueur 1 a pour sens de bas en haut, le joueur 2 a pour sens de haut en bas
	//	"bas en haut :" coordonnee de y des plus grande vers les plus petites 
	//Donnees et precondition :
	//	Position : la position pour laquelle on veut savoir si la piece peut se deplacer
	//	La 1ere coordonnee de la position doit etre un entier compris entre 1 et 3 inclus
	//	La 2eme coordonnee de la position doit etre un entier compris entre 1 et 4 inclus
	//Resultat et postcondition : 
	//	booleen : vrai si la piece donne peut se deplacer sur la Position donnee
	//Note : Prendre en compte les "rebords du plateau"
	func deplacementPossible (position :PositionProtocol) -> Bool

	//evoluer : Piece -> Piece
	//Description : 
	//	Fait evoluer un kodama en kodama samourai
	//Precondition :
	//	la piece choisie doit avoir pour nom "kodama"
	//résultat et post-condition:
	//	retourne elle-meme Son nom a change, rien ne change si c'est un kodama                                                                           
	@discardableResult
	mutating func evoluer () -> Self

	//diminuer : Piece -> Piece
	//Description : 
	//	Fait retourner un kodama samourai a son etat initial de kodama
	//Precondition :
	//	la piece choisie doit avoir pour nom "kodama samourai"
	//résultat et post-condition:
	//	retourne elle-meme Son nom a change
	@discardableResult
	mutating func diminuer () -> Self

}

//Un jeu est une collection de toutes les pieces du jeu
protocol JeuProtocol : Sequence {
    associatedtype PieceProtocol

    associatedtype IteratorJeu : IteratorProtocol

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
	func getPiece (position : PositionProtocol) -> PieceProtocol?

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
    func estOccupeeAllie (position : PositionProtocol, joueur : Int) -> Bool

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
    func estOccupeeEnnemi (position : PositionProtocol, joueur : Int) -> Bool

    //makeIterator : Jeu -> IteratorJeu
	//Description :
    //  Parcourt toutes les pieces 
    //  Creer un iterateur sur la collection pour iterer avec for in
	func makeIterator() -> IteratorJeu


    
}
