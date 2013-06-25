import processing.serial.*;

Serial portaSeriale;
float altezza = 10;
float larghezza = 10;

void setup(){
  String nomePortaSeriale = Serial.list()[0];
  portaSeriale = new Serial(this, nomePortaSeriale, 9600);
  portaSeriale.bufferUntil('\n');
}

void draw(){
  ellipse(width/2, height/2, altezza, larghezza);
}

void serialEvent() {
  String datiLetti = portaSeriale.readStringUntil('\n');
  datiLetti = trim(datiLetti);
  int valori[] = int(split(datiLetti, ','));
  altezza = map(valori[0], 0, 1024, 10, 100);
  larghezza = map(valori[1], 0, 1024, 10, 100);
}



