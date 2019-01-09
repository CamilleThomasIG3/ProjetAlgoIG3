public class Piece : PieceProtocol{
  private let numero : Int
  private var nom : String
  private var position : Position
  private var joueur : Int
  private var reserveBool : Bool = false

  public required init(numero:  Int, nom: String, position: Position, joueur: Int){
    self.numero = numero
    self.nom = nom
    self.position = position
    self.joueur = joueur
  }

  public func getPosition() -> Position{
    return self.position
  }

  public func getJoueur() -> Int{
    return self.joueur
  }

  public func estEnReserve() -> Bool{
    return self.reserveBool
  }

  public func getNom() -> String{
    return self.nom
  }

  public func getNumero() -> Int{
    return self.numero
  }

  public func deplacementPossible(position : Position) -> Bool{
    let x : Int = self.position.getX()
    let y : Int = self.position.getY()
    let xp : Int = position.getX()
    let yp : Int = position.getY()

    if self.numero==1 || self.numero==2{  //koropokkuru du joueur 1 ou 2
      if (x+1==xp && y==yp) || (x-1==xp && y==yp) || (x==xp && y+1==yp) || (x==xp && y-1==yp) || (x+1==xp && y+1==yp)
      || (x+1==xp && y-1==yp) || (x-1==xp && y-1==yp) || (x-1==xp && y+1==yp){
        return true
      }
      else{
        return false
      }
    }

    else if self.numero==3 && self.nom=="kodama"{ //kodama du joueur 1
      if y-1==yp{
        return true
      }
      else{ return false}
    }
    else if self.numero==3 && self.nom=="kodama samourai"{ //kodama du joueur 1 en mode samourai
      if (x+1==xp && y==yp) || (x-1==xp && y==yp) || (x==xp && y+1==yp) || (x==xp && y-1==yp)
      || (x+1==xp && y-1==yp) || (x-1==xp && y-1==yp){
        return true
      }
      else{
        return false
      }
    }

    else if self.numero==4 && self.nom=="kodama"{ //kodama du joueur 2
      if y+1==yp{
        return true
      }
      else{ return false}
    }
    else if self.numero==4 && self.nom=="kodama samourai"{ //kodama du joueur 2 en mode samourai
      if (x+1==xp && y==yp) || (x-1==xp && y==yp) || (x==xp && y+1==yp) || (x==xp && y-1==yp) || (x+1==xp && y+1==yp)
      || (x-1==xp && y+1==yp){
        return true
      }
      else{
        return false
      }
    }

    else if self.numero==5 || self.numero==6{ //kitsune du joueur 1 ou 2
      if (x-1==xp && y-1==yp) || (x+1==xp && y-1==yp) || (x+1==xp && y+1==yp) || (x-1==xp && y+1==yp){
        return true
      }
      else{
        return false
      }
    }

    else if self.numero==7 || self.numero==8{ //tanuki du joueur 1 ou 2
      if (x==xp && y-1==yp) || (x==xp && y+1==yp) || (x+1==xp && y==yp) || (x-1==xp && y==yp){
        return true
      }
      else{
        return false
      }
    }

    else{
      return false
    }
  }

  @discardableResult
  func changerNom(nom : String)->Self{
    self.nom = nom
    return self
  }

  @discardableResult
  func changerJoueur(joueur : Int)->Self{
    self.joueur = joueur
    return self
  }

  @discardableResult
  public func parachuter(position : Position)->Self{
    if self.estEnReserve(){
      self.position.changerB()
      self.position = position
      self.position.changerB()
      self.reserveBool = false
    }
    else{
      print("Erreur : cette piece n'est pas en reserve.\n")
    }
    return self
  }

  @discardableResult
  public func deplacer(position : Position)->Self{
    self.position.changerB()
    self.position = position
    self.position.changerB()
    return self
  }

  @discardableResult
  public func seFaireCapturer()->Self{
    let reserve : Position = Position(x : -1, y: -1, b: true)
    self.position = reserve
    self.reserveBool = true
    if self.joueur == 1{
      self.joueur = 2
    }
    else{
      self.joueur = 1
    }
    return self
  }

  @discardableResult
  public func evoluer() -> Self{
    self.nom = "kodama samourai"
    return self
  }

  @discardableResult
  public func diminuer() -> Self{
    self.nom = "kodama"
    return self
  }
}
