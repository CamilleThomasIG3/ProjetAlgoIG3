//Pioche est une collection de cartes d’un joueur qui ne sont pas encore dans
//le jeu (ni dans la main, le royaume, le champs de bataille, cimetière)
public protocol PiocheProtocol : Sequence {

	associatedtype IteratorPioche : IteratorProtocol
		where IteratorPioche.Element == Carte
	associatedtype Carte : CarteProtocol

	//init : ->Pioche
	//créer une pioche avec 20 cartes : 9 soldats, 6 gardes et 5 archers dans un ordre aléatoire
	init()

	//PremierPioche : Pioche -> Carte
	//retourne la première carte de la Pioche (la carte la plus ancienne)
	//précondition : le Pioche n'est pas vide
	func premierPioche() throws -> Carte

	//Piocher : Pioche -> Pioche
	//Enlève la premiere carte de la pioche (la carte la plus ancienne)
	//precondition : pioche non vide
	//postcondition : taillePioche(piocher(carte))=taillePioche()-1
	@discardableResult
	mutating func piocher() throws -> Self

	//AjouterPioche : PiochexCarte -> Pioche
	//Rajoute une carte dans la pioche
	//postcondition : taillePioche(piocher(carte))=taillePioche()+1>0
	@discardableResult
	mutating func ajouterPioche(c : Carte)->Self

	//TaillePioche : Pioche-> Int
	//retourne le nombre de cartes de la pioche
	//resultat : un entier
	//postcondition : entier retourné entre 0 et 20
	func taillePioche()->Int

	//PiocheVide : Pioche -> Booleen
	//Indique si la pioche est vide ou non
	//resultat : Retourne vrai si la pioche est vide et faux sinon
	//postcondition : si PiocheVide()==True => taillePioche()=0
	//postcondition : si PiocheVide()==False => taillePioche()>0
	func piocheVide()->Bool

	//makeIterator : Pioche -> IteratorPioche
	//créer un itérateur sur la collection pour pouvoir la parcourir de
	//la carte la plus ancienne (haut pioche) à la carte la carte la plus récente
	//(bas pioche)
	func makeIterator()->IteratorPioche
}
