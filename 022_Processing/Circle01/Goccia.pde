class Goccia {
  
  int x;
  int y;
  int raggio;
  int raggioMinimo;
  int raggioMassimo;
  int colore;
  int coloreIniziale;
  
  Goccia(int x, int y, int raggioMinimo, int raggioMassimo, int coloreIniziale){
    this.x = x;
    this.y = y;
    this.raggioMinimo = raggioMinimo;
    this.raggioMassimo = raggioMassimo;
    this.raggio = raggioMinimo;
    this.coloreIniziale = coloreIniziale;
    this.colore = coloreIniziale;
  }
  
  void aggiorna(){
    if (!scomparsa()) {
      raggio = raggio + 1;
      colore = colore + 1;
    }
  }
  
  void disegna(){
    if (!scomparsa()){
      noFill();
      stroke(colore);
      ellipse(x, y, raggio, raggio);
    }
  }
  
  boolean scomparsa(){
    return raggio > raggioMassimo;  
  }
  
}
