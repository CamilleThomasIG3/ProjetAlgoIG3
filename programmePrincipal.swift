import Carte
import Case
import Royaume
import ChampBataille
import Joueur
import Pioche
import Main
import Partie
//CB = Champs de Bataille (dans toute la suite)

//demande un message à l'utilisateur et renvoie sa réponse
//donnee : message contenant la question a demandé
//resultat : renvoie la réponse de l'utilisateur ou une erreure si sa réponse n'est pas bonne
func saisieUtilisateur(message : String)->String
{
  print(message+"\n")
  guard let res : String = readLine()
  else{ fatalError("vous ne répondez pas correctement à la question")}
  return res
}

//affiche une carte en donnant son nom et ses points de defense et d'attaque
//donnee : une carte
func afficherCarte(c : Carte)
{
  print("carte "+c.nom()+" de défense "+c.defense()+" et d'attaque "+c.attaque()+"\n")
}

//affiche une carte en donnant son nom, ses points de defense et d'attaque et sa position sur le CB
//donnee : une carte
//precondition : c.getEmplacement().getEmplacement()==3 (3=CB)
func afficherCarteCB(c : Carte)
{
  print("carte "+c.nom()+" de défense "+c.defense()+" et d'attaque "+c.attaque()+"et en case "+c.getPosition()+"\n")
}

//prepare un tour en faisant piocher le joueur et en redressant ses cartes qui etaient en attaque sur son CB
//donnee-resultat : une partie
func preparation(p : inout Partie){
  if p.joueurCourant().pioche().piocheVide()//joueurCourant pioche vide (et alors lautre aussi car on pioche une carte par tour)
  {
    p.setMotifFin(nvMotifFin : "les pioches des 2 joueurs sont vides")
    if p.joueurCourant().royaume().tailleRoyaume() > p.joueurAdverse().royaume().tailleRoyaume()
    {
      p.setGagnant(nvGagnant : joueurCourant().nom())
    }
    else if p.joueurCourant().royaume().tailleRoyaume() < p.joueurAdverse().royaume().tailleRoyaume()
    {
      p.setGagnant(nvGagnant : joueurAdverse().nom())
    }
    else {p.setGagnant(nvGagnant : "egalité")}
    p.setFin(nvFin : true)
  }
  else
  {
    var carte : Carte = p.joueurCourant().pioche().premierPioche()
    carte.setEmplacementCarte(nvEmplacement : 1) //met l'emplacement de la carte equivalent à la main
    p.joueurCourant().main().ajouterCarte(carte : carte) //met la premiere carte de la pioche dans la main
    p.joueurCourant().pioche().piocher() //enleve cette carte de la pioche
    p.joueurCourant().champBataille().redresserCarte()
    print("Joueur "+p.joueurCourant()+", vos cartes sont remises en position défense et vous piochez une carte :\n")
    afficherCarte(c : carte)
  }
}

//permet au joueurCourant de deployer une carte (mettre une carte de sa main sur le CB) de son choix si cela est possible
//donnee-resultat : une partie
func deployer(p : inout Partie)
{
  if p.joueurCourant().champBataille().nbCarteChamp()<6 //encore de la place sur CB
  {
    for c in p.joueurCourant().main() //parcours des cartes grace à l'iterateur de Main
    {
      afficherCarte(c : c)
    }
    var rep1 : String = saisieUtilisateur(message : "Quelle nom de carte voulez-vous mettre sur votre champs de Bataille ?")
    var rep2 : String = saisieUtilisateur(message : "avec quel point de défense ?")
    var rep3 : String = saisieUtilisateur(message : "avec quel point d'attaque ?")
    var rep4 : String
    repeat
    {
       rep4 = saisieUtilisateur(message : "en quelle case voulez-vous la placer F1, F2, F3, A1, A2, ou A3 ?")
    }while p.joueurCourant().champBataille().getCase(nom : rep4).etatCase() //case occupée
    var carte : Carte = p.joueurCourant().main().getCarte(nom : rep1, defense : Int(rep2), attaque : Int(rep3)) //carte a ajouter au CB
    p.joueurCourant().champBataille().insererCarte(cas : p.joueurCourant().champBataille().getCase(nom : rep4), carte : carte) //insere la carte sur le CB
    p.joueurCourant().main().carte.setPosition(nvNom : rep4)//change la position de la carte
    p.joueurCourant().main().carte.emplacementCarte().setEmplacement(newEmplacement : 3)//change lemplacement de la carte (3 : CB)
    p.joueurCourant().main().enleverMain(carte : carte)
  }
  else {
    print("Votre champs de Bataille est déjà plein, tant pis vous ne ferez rien\n")
  }
}

//test si on est dans une conscription : adversaire plus de carte sur son CB alors doit en placer une de son royaume
//donnee-resultat : une partie
func testConscription(p : inout Partie)
{
  if p.joueurAdverse().champBataille().champVide() //si son CB vide
  {
    if !p.joueurAdverse().main().mainVide() //sa main nest pas vide
    {
      print("conscription du joueur : "+p.joueurAdverse().nom()+"une carte de votre main rejoins votre champs de bataille\n")
      var j : Joueur = p.joueurCourant() //variable tampon
      p.setJoueurCourant(j : p.joueurAdverse())//pour que deployer (fonction qui utilise le joueurCourant) se fasse sur le bon joueur
      deployer(p : &p)
      p.setJoueurCourant(j : j) //remise du bon nom du joueur
    }
    else if !p.joueurAdverse().royaume().royaumeVide()
    {
      var carteADeploye : Carte = p.joueurAdverse().main().premierRoyaume()
      carteADeploye.setEmplacement(newEmplacement : 3) //Emplacement MAJ (3 : CB)
      print("conscription du joueur : "+p.joueurAdverse().nom()+"une carte de votre royaume rejoins votre champs de bataille\n")
      print("Voici la carte qui sera placer sur votre champs de Bataille : "+carteADeploye+"\n")
      var rep : String = saisieUtilisateur(message : "En quelle case voulez vous la mettre F1,F2,F3,A1,A2,A3 ?")
      p.joueurAdverse().champBataille().insererCarte(cas : p.joueurAdverse().champBataille().getCase(nom : rep) ,carte : carteADeploye) //insere carte sur CB
      p.joueurAdverse().royaume().enleverRoyaume() //enleve carte du royaume
    }
    else //fin de partie
    {
      p.setMotifFin(nvMotifFin : "conscription impossible du joueur"+p.joueurAdverse().nom()+"\n")
      p.setGagnant(nvGagnant : p.joueurCourant().nom())
      p.setFin(nvFin : true)
    }
  }
}

//permet de mettre une carte venant de la main du joueurCourant dans son royaume
//donnee-resultat : une partie
func mettreAuRoyaume(p : inout Partie)
{
  for c in p.joueurCourant().main() //parcours des cartes grace à l'iterateur de Main
  {
    afficherCarte(c : c)
  }
  var rep1 : String = saisieUtilisateur(message : "Quelle nom de carte voulez-vous mettre sur votre Royaume ?")
  var rep2 : String = saisieUtilisateur(message : "avec quel point de défense ?")
  var rep3 : String = saisieUtilisateur(message : "avec quel point d'attaque ?")
  var carte : Carte = p.joueurCourant().main().getCarte(nom : rep1, defense : Int(rep2), attaque : Int(rep3)) //carte a ajouter au royaume
  p.joueurCourant().royaume().ajouterRoyaume(carte : carte) //ajoute la carte au royaume
  p.joueurCourant().main().carte.getEmplacement().setEmplacement(newEmplacement : 2)//change l'emplacement de la carte
  p.joueurCourant().main().enleverMain(carte : carte)
}

//permet au joueurCourant d'attaquer autant de fois qu'il veut et si cela est possible
//donnee-resultat : une partie
func attaquer(p : inout Partie)
{
  var attaque : Bool = true //le joueur veut attaquer
  while attaque && p.joueurCourant().champBataille().NbreCarteDefenseChamp()!=0
  //tant que le joueur veut attaquer et qu'il reste des cartes en mode defense sur son CB
  {
    for c in p.joueurCourant().champBataille() //parcours des cartes grace à l'iterateur de CB
    {
      if !c.etatCarte() //carte en defense
      {
        afficherCarteCB(c : c) //affichage de la carte
      }
    }
    var rep1 : String
    repeat
    {
      rep1 = saisieUtilisateur(message : "La carte avec laquelle vous voulez attaquer est sur quelle case?")
    }while !p.joueurCourant().champBataille().getCase(nom : rep1).etatCase() //TQ il choisi une case qui n'a pas de carte
    var essai : Int =0
    var rep2 : String
    repeat
    {
      rep2 = saisieUtilisateur(message : "Quelle case adverse voulez-vous attaquer F1, F2, F3, A1, A2, ou A3 ?")
      essai+=1
    }while (!p.joueurAdverse().champBataille().getCase(nom : rep2).etatCase() || !p.joueurCourant().champBataille().caseAtteignable(caseDep : p.joueurCourant().champBataille().getCase(nom : rep1) , caseArr : p.joueurAdverse().champBataille().getCase(nom : rep2), nomCarte : p.joueurCourant().champBataille().getCarte(position : rep1).nom())) && essai<6
    //TQ case adverse n'est pas occupée ou non atteignable par la carte choisi comme attaque et qu'on a essayé moins de 6 fois (car max de cartes présentes sur CB adverse)
    if (!p.joueurAdverse().champBataille().getCase(nom : rep2).etatCase() || !p.joueurCourant().champBataille().caseAtteignable(caseDep : p.joueurCourant().champBataille().getCase(nom : rep1) , caseArr : p.joueurAdverse().champBataille().getCase(nom : rep2), nomCarte : p.joueurCourant().champBataille().getCarte(position : rep1).nom())) && essai=6
    {
      print("cette carte ne peut pas attaquée votre adversaire\n")
    }
    else //il peut attaquer
    {
      p.joueurCourant().champBataille().getCarte(position : rep1).modifierEtatCarte(newEtat : true) //carte en position attaque
      var nbAttaque : Int = p.joueurCourant().champBataille().getCarte(position : rep1).getAttaque() //nbre Attaque du joueur Courant
      var nbDefense : Int = p.joueurAdverse().champBataille().getCarte(position : rep2).getDefense() //nbre Defense du joueur Adverse
      var nbDegat : Int = p.joueurAdverse().champBataille().getCarte(position : rep2).getDegat() //nbre degat carte adverse

      if p.joueurAdverse().champBataille().getCarte(position : rep2).getNom()=="Roi"
      {//fin partie par capture de roi
        p.setMotifFin(nvMotifFin : "execution du roi")
        p.setGagnant(nvGagnant : joueurCourant().nom())
        p.setFin(nvFin : true)
      }
      else if nbAttaque == nbDefense && nbDegat == 0
      //si lattaque joueurCourant = defense joueurAdverse et que cest la premiere attaque sur cette carte de ladversaire
      {
        //mettre la carte de l'adversaire dans le royaume
        p.joueurAdverse().champBataille().getCarte(position : rep2).setPosition(nvPos : nil) //mettre position de la carte capturée à vide
        p.joueurAdverse().champBataille().getCarte(position : rep2).setEmplacement(newEmplacement : 2) //MAJ emplacement carte capturé (2: royaume)
        p.joueurAdverse().champBataille().getCase(nom : rep2).modifierCase(newEtat : false) //libérer la case
        p.joueurCourant().royaume().ajouterRoyaume(carte : p.joueurAdverse().champBataille().getCarte(position : rep2)) //ajout dans royaume du joueurCourant
        testConscription(p : &p) //si le CB de l'adversaire devient vide il faut le remplir
      }
      else if nbAttaque < nbDefense && nbDegat + nbDefense < nbAttaque
      //si point defense > point attaque ET pointdefense + point degat avant attaque < point attaque
      {
        //enregistrer degat
        p.joueurAdverse().champBataille().getCarte(position : rep2).setdegat(degat : nbDegat + nbAttaque) //MAJ degat de carte adverse
      }
      else //carte au cimetiere (=detruite)
      {
        p.joueurAdverse().champBataille().getCarte(position : rep2).setPosition(nvPos : nil) //mettre position de la carte detruite à vide
        p.joueurAdverse().champBataille().getCarte(position : rep2).getEmplacement().setEmplacement(newEmplacement : nil) //MAJ emplacement carte capturé (Vide: cimetiere)
        p.joueurAdverse().champBataille().getCase(nom : rep2).modifierCase(newEtat : false) //libérer la case
        testConscription(p : &p) //si le CB de l'adversaire devient vide il faut le remplir
      }
    }
    var att : String
    repeat
    {
      att = saisieUtilisateur(message : "Voulez-vous attaquer avec une autre de vos cartes ? 1-Oui 2-Non")
    }while att != "1" && att != "2"
    if att=="2"
    {
      attaque = false
    }
    if p.joueurCourant().champBataille().NbreCarteDefenseChamp()==0{ print("Vous n'avez plus de carte pour attaquer\n")}
  }
}

//permet au joueur de mettre une carte de sa main dans son royaume (il est obligé si il a plus de 6 cartes en main)
//donnee-resultat : une partie
func developpement(p : inout Partie)
{
  if p.joueurCourant().main().nbreCartesMain()>6
  {
    print("vous devez mettre une carte de votre main au royaume\n")
    mettreAuRoyaume(p : &p)
  }
  else if p.joueurCourant().main().mainVide()
  {
    print("Vous n'avez plus de carte en main donc vous ne pouvez pas mettre une carte au royaume\n")
  }
  else
  {
    var rep : String
    repeat
    {
      rep = saisieUtilisateur(message : "Voulez vous mettre une carte au royaume ? 1-Oui, 2-Non\n")
    }while rep != "1" && rep != "2"
    if rep=="1"
    {
      mettreAuRoyaume(p : &p)
    }
  }
}

//programme principale qui permet de jouer à Art Of War

var partie = Partie() //initialise la partie avec 2 joueurs et des conditions de fin

while !partie.getFin()//tant que la partie n'est pas terminée
{
  //préparation
  preparation(p : &partie)

  //action
  var reponse : String = saisieUtilisateur(message : "choisissez une action : 1-ne rien faire  2-déployer une carte  3-attaquer l'adversaire")
  if reponse=="2"//déployer
  {
    deployer(p : &partie)
  }
  else if reponse=="3" //attaquer
  {
    attaquer(p : &Partie)
  }
  else if reponse!="1"  {print("Mauvaise réponse à la question posée tant pis vous ne pourrez pas effectuer d'action pour ce tour")}

  //developpement
  developpement(p : &partie)

  //fin tour
  print("Fin du tour de "+partie.joueurCourant().nom()+"au tour de "partie.joueurAdverse().nom()+"\n")
  var temp : Joueur = partie.joueurCourant() //inverse les roles des joueurs
  partie.setJoueurCourant(j : partie.joueurAdverse())
  partie.setJoueurAdverse(j : temp)
}
//fin de partie
print("partie terminée par "+partie.getMotifFin()+" et le gagnant est"+partie.getGagnant()+"\n")

