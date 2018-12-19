import Foundation

// une position est un couple d entiers et un booleen b
// Si on considere la position (x,y,b)
// l entier x represente la postion horizontale, compris entre 1 et 3
// l entier y represente la postion verticale, compris entre 1 et 4
// le boolen b permet de savoir si la position est occupee

protocol PositionProtocol {

  //init : -> Position
  //Initialisation : Creation d une position a partir d un couple d entiers x et y qui representent les coordonees et d un booleen
  // l entier x doit etre compris entre 1 et 3 inclus
  // l entier y doit etre compris entre 1 et 4 inclus
  // le booleen b doit etre true si une piece occupe cette position, faux sinon
  // A l initialisation, les positions de coordonees (1,1);(1,2);(1,3);(2,2);(3,2);(4,1);(4,2);(4,3) sont occupees (b=true)
  init (x :Int, y : Int, b : Bool)

  //getX : Position -> Int
  //Description :
  //  renvoie la coordonnee x de cette position (accesseur) (comprise entre 1 et 3)
  func getX() -> Int

  //getY : Position -> Int
  //Description :
  //	renvoie la coordonnee y de cette position (accesseur) (comprise entre 1 et 4)
  func getY() -> Int

  //setX : Position x Int -> Position
  //Description :
  //Modifie la coordonnee x de cette position (comprise entre 1 et 3)
  func setX(x : Int)

  //setY : Position -> Int
  //Description :
  //Modifie la coordonnee y de cette position (comprise entre 1 et 4)
  func setY(y : Int)

  //getB : Position -> Bool
  //Description :
  //	renvoie le booleen b de cette position. (accesseur)
  //	renvoie true si la position est occupee par une piece, false sinon
  func getB() -> Bool

  //estPromotion : Position x Int -> Bool
  //Description :
  //	Renvoie vrai si la position donnee est en zone de promotion, faux sinon
  //	Les cases en zone de promotion sont
  //	(1,1);(2,1);(3,1) pour le joueur 1
  //	(1,4);(2,4);(3,4) pour le joueur 2
  //Donnees et precondition :
  //	Int : Le numero du joueur qui joue, compris entre 1 et 2
  //Resultat :
  //	Renvoie un booleen
  func estPromotion (joueur : Int)-> Bool

  //changerB : Position -> Position
  //Description :
  //  change l occupation de la position.
  //	Met le booleen b a false (si la position n est pas occupee par une piece) ou a true (si elle ne l est)
  @discardableResult
  mutating func changerB() -> Self
}
