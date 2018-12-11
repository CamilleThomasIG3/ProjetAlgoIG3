//Royaume est une collection de cartes d'un joueur qui sont ni dans la main,
//la pioche, le cimetière, le champs de bataille
public protocol RoyaumeProtocol : Sequence {

	associatedtype IteratorRoyaume : IteratorProtocol
		where IteratorRoyaume.Element == Carte
	associatedtype Carte : CarteProtocol

	//init : -> Royaume
	//créer un royaume vide (sans carte)
	init()

	//PremierRoyaume : Royaume -> Carte
	//retourne la première carte du royaume (la carte la plus ancienne)
	//précondition : le royaume n'est pas vide
	func premierRoyaume() throws -> Carte

	//EnleverRoyaume : Royaume -> Royaume
	//Enlève la première carte du royaume (la carte la plus ancienne)
	//précondition : le royaume n'est pas vide
	//postcondition : tailleRoyaume(enleverRoyaume(carte))=tailleRoyaume()-1
	@discardableResult
	mutating func enleverRoyaume()->Self

	//AjouterRoyaume : Royaume x Carte -> Royaume
	//Ajoute une carte au royaume
	//postcondition : le royaume n'est pas vide
	//postcondition : tailleRoyaume(ajouterRoyaume(carte))=tailleRoyaume()+1>0
	@discardableResult
	mutating func ajouterRoyaume(carte : Carte) throws -> Self

	//TailleRoyaume : Royaume-> Int
	//retourne le nombre de cartes du royaume
	//resultat : un entier
	//postcondition : entier retourné entre 0 et 42 (21 cartes par joueur)
	func tailleRoyaume()->Int

	//RoyaumeVide : Royaume -> Bool
	//Indique si le royaume est vide ou non
	//resultat : Retourne vrai si le royaume est vide et faux sinon
	//postcondition : si royaumeVide()==True => tailleRoyaume()=0
	//postcondition : si royaumeVide()==False => tailleRoyaume()>0
	func royaumeVide()->Bool

	//makeIterator : Royaume -> IteratorRoyaume
	//créer un itérateur sur la collection pour pouvoir la parcourir de la carte la
	//plus ancienne à la carte la plus récente dans le royaume
	func makeIterator()->IteratorRoyaume
}
