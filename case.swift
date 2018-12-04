//Case représente une case du champBataille (ou Royaume ?) sur laquelle pourra ou non être présente une carte
protocol Case {
    //init : -> Case
    //Création d'une Case initialisée avec un état (vide) et un nom passé en paramètre
    init(nom : String)

    //nom : Case -> String
    //retourne le nom de la case
    //postcondition : nom(Case)€{F1,F2,F3,A1,A2,A3}
    func nom() -> String

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
