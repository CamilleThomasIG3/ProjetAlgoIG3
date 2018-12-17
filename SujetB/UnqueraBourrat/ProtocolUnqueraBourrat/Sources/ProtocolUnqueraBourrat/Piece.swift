import Foundation
	
//piece est un numero, un nom, une position, un Int designant le joueur
protocol PieceProtocol : Sequence{
    associatedtype Position : PositionProtocol
    
    //init : Int x String x Position x Int -> Piece
	//Initialisation : Creation d une piece a partir d un yokai et une position
	//Donnees et precondition :
	//	numero : Le numero de la piece va permettre de l identifier. Il est different pour chaque piece.
	//			 Il reste fixe tout au long de la partie.
	//			 Comme il doit y avoir 8 piece, le numero doit etre compris entre 1 et 8 qui restera 
    //           fixe pendant toute la durée du jeu
	//			 Le koropokkuru du joueur 1 a pour numero 1.
	//			 Le koropokkuru du joueur 2 a pour numero 2.
	//			 Le kodama du joueur 1 a pour numero 3.
	//			 Le kodama du joueur 2 a pour numero 4.
	//           Le kitsune du joueur 1 a pour numero 5.
    //           Le kitsune du joueur 2 a pour numero 6.
    //           Le tanuki du joueur 1 a pour numero 7.
    //           Le tanuki du joueur 2 a pour numero 8.
    //  Position : La position ou on desire creer la piece
	//		La 1ere coordonnee de la position doit etre un entier compris entre 1 et 3 inclus
	//		La 2eme coordonnee de la position doit etre un entier compris entre 1 et 4 inclus
	//		Le booleen de la position doit etre true (b, qui represente si la position est occupee)
	//	Int : Entier compris entre 1 et 2 designant le joueur
	//	nom : Le nom d un yokai. Ce doit etre l un des noms suivants :
	//		koropokkuru, kitsune, tanuki, kodama ou kodama samurai
	init (numero: Int, nom : String, position : Position, joueur : Int)

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
	func getPosition() -> Position

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
	mutating  func parachuter (position: Position) -> Self

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
	mutating func deplacer (position : Position) -> Self

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
	func deplacementPossible (position :Position) -> Bool

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

