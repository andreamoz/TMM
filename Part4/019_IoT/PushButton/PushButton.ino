int button = 2;
int led = 3;

void setup(){
  pinMode(button, INPUT);
  pinMode(led, OUTPUT);
}

void loop() { 
  if (digitalRead(button) == HIGH) {
    digitalWrite(led, HIGH);        
    // ask php page to tweet
    digitalWrite(led, LOW);
  }
}
