int larghezzaBarra = 80;
int spessoreBarra = 10;
float xSinistra;
float ySinistra;
float xDestra;
float yDestra;
color sfondo = #70A4B2;
int passo = 10;

void setup(){
  size(800, 600);
  background(sfondo);  
  stroke(255);
  xSinistra = spessoreBarra;
  ySinistra = 0;
  xDestra = width - 2 * spessoreBarra;
  yDestra = 0;
  aggiornaDisplay();
  println(width);
}

void draw(){
}

void keyPressed(){
  if (key == 'z' && ySinistra < height - larghezzaBarra) {
    ySinistra = ySinistra + passo;
  } else if (key == 'a' && ySinistra > 0) {
    ySinistra = ySinistra - passo;
  } else if (key == 'm') {
    yDestra = yDestra + passo;
  } else if (key == 'k') {
    yDestra = yDestra - passo;
  }
  aggiornaDisplay();
}

void aggiornaDisplay(){
  background(sfondo);
  rect(xSinistra, ySinistra, spessoreBarra, larghezzaBarra);
  rect(xDestra, yDestra, spessoreBarra, larghezzaBarra);
}
