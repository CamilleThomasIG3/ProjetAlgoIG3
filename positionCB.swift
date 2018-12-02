//Position indique l’emplacement de la carte sur le champs de bataille
Protocol Position : {
	//init : -> Position
	//créer une position initialisé à Vide
	init()

	//modifierPosition : Position x Position -> Position
	//remplace la position initiale par celle passée en paramètre
	//donnee : une position
	//precondition : nvPos doit être vide ou dans le Champs de Bataille
	//resultat : Une position mise à jour
	@discardableResult
	mutating func modifierPosition(nvPos : Position?) -> Self
}
