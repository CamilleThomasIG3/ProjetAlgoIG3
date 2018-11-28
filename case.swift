//Case représente une case du ChampBataille (ou Royaume ?) sur laquelle pourra ou non être présente une carte
protocol Case : {
    //init : -> Case
    //Création d'une Case initialisée avec un état (vide)
    init()
    
    
    //etatCase : Case -> Bool
    //retourne vrai si la Case est occupée par une Carte, faux sinon
    //Post: init() => EtatCase() == Faux
    func etatCase() -> Bool
    
    //modifierCase : Case x Bool -> Case
    //Change l'état de la Case par le booléen passé en paramètre
    //Post: modifierCase(newEtat:Bool) => etatCase() == newEtat
    @discardableResult
    mutating func modifierCase(newEtat : Bool) -> Self
}
