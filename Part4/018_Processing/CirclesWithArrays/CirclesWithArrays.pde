
int numberOfCircles = 10;
int[] x = new int[numberOfCircles];
int[] y = new int[numberOfCircles];
int[] dim = new int[numberOfCircles];
color[] colors = new color[numberOfCircles];
int[] step = new int[numberOfCircles];

void setup() {
  size(500, 200);
  
  int distance = height / numberOfCircles;
  
  int temp = distance / 2;
  for (int i = 0; i < numberOfCircles; i++) {
    y[i] = temp;
    temp = temp + distance;
    dim[i] = int(random(5, 2.5 * distance));
    colors[i] = color(int(random(255)), int(random(255)), int(random(255)));
    step[i] = int(random(1, 15));
  }
}

void draw(){
  background(200);
  for (int i = 0; i < numberOfCircles; i++) {
    x[i] = x[i] + step[i];
    fill(colors[i]);
    ellipse(x[i], y[i], dim[i], dim[i]);
    if (x[i] > width || x[i] < 0) {
      step[i] = - step[i];
    }
  }
}

