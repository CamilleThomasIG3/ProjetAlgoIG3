//Position indique l’emplacement de la carte sur le champs de bataille
protocol Position {
    //init : -> Position
    //Crée une position initialisée à Vide
    init()
    
    //getNom : Position -> String?
    //retourne le nom de la position (ou Vide si la carte n'est pas placée sur le champ de bataille)
    func getNom() -> String?
    
    //setNom : String? x Position -> Position
    //modifie le nom de la position avec celui passe en parametre
    //donnee : un string ou vide
    //precondition : nvNom doit être un nom valable (Vide ou F1,F2,F3,A1,A2,A3)
    //postcondition : getNom() == nvNom
    @discardableResult
    mutating func setNom(nvNom : String?) -> Self
    
    //modifierPosition : Position x Position -> Position
    //remplace la position initiale par celle passée en paramètre
    //donnee : une Position
    //precondition : nvPos doit être vide ou une Position valide (dans le Champ de Bataille, càd correspondant à F1,F2,F3,A1,A2 ou A3)
    //postcondition : getNom() => nvPos.getNom()
    @discardableResult
    mutating func modifierPosition(nvPos : Position?) -> Self
}

