int sfondo = 200;
int raggioMinimo = 10;
int raggioMassimo = 100;
int raggio = 10;
int coloreIniziale = 100;
int colore = coloreIniziale;
ArrayList<Goccia> gocce = new ArrayList<Goccia>();

void setup() {
  size(200, 200);
  fill(sfondo);
  Goccia goccia = new Goccia(width/2, height/2, raggioMinimo, raggioMassimo, coloreIniziale);
  gocce.add(goccia);
}

void draw() {
  background(sfondo);
  
  println(gocce.size());
  
   if (millis() % 500 < 10) {
      Goccia goccia = new Goccia(int(random(width)), int(random(height)), raggioMinimo, raggioMassimo, coloreIniziale);
      gocce.add(goccia);
  }

  for (int i = 0; i < gocce.size(); i++){
    Goccia goccia = gocce.get(i);
    if (goccia.scomparsa()){
      gocce.remove(goccia);
    } else {
      goccia.aggiorna();
      goccia.disegna();
    }
  }
}

void mousePressed(){
  Goccia goccia = new Goccia(mouseX, mouseY, raggioMinimo, raggioMassimo, coloreIniziale);
  gocce.add(goccia);
}
