//Position indique l’emplacement de la carte sur le champs de bataille
Protocol Position : {
	//init : -> Position
	//créer une position initialisé à Vide
	init()

	//getNom : Position -> String?
	//retourne le nom ou vide de la position
	func getNom()->String?

	//setNom : String?xPosition -> Position
	//modifie le nom de la position avec celui passe en parametre
	//donnee : un string ou vide
	@discardableResult
	mutating func setNom(nvNom : String?)->Position

	//modifierPosition : Position x Position -> Position
	//remplace la position initiale par celle passée en paramètre
	//donnee : une position
	//precondition : nvPos doit être vide ou dans le Champs de Bataille
	//resultat : Une position mise à jour
	@discardableResult
	mutating func modifierPosition(nvPos : Position?) -> Self
}
