#include <Ethernet.h>
#include <SPI.h>

int button = 2;
int led = 3;

byte mac[] = { 0x90, 0xA2, 0xDA, 0x09, 0x00, 0x93};
byte ip[] = { 192, 168, 100, 238 };
byte gateway[] = { 192, 168, 100, 100 };
byte subnet[] = { 255, 255, 255, 0 };

String server = "127.0.0.1";
String page_doTweet = "/iot/dotweet.php";

EthernetClient client;

char buf[32];
int indice = 0;
boolean inLettura = false;

void setup(){
  pinMode(button, INPUT);
  pinMode(led, OUTPUT);

  delay(2000);
  Ethernet.begin(mac, ip, gateway, subnet);
  Serial.begin(9600);
}

void loop() { 
  if (digitalRead(button) == HIGH) {
    digitalWrite(led, HIGH);        
    // ask php page to tweet
    String twt = connectAndRead(page_doTweet);
    Serial.println(twt);
    Serial.println("pippo");
    digitalWrite(led, LOW);
  }
}

String connectAndRead(String addr){
  Serial.println("Connecting...");
  char buf[server.length()];
  server.toCharArray(buf, server.length());
  if (client.connect(buf ,80)) {
    client.print("GET ");
    client.print(addr);
    client.println(" HTTP/1.0");
    client.print("Host: ");
    client.println(server);
    client.println();

    return readPage();
  } else {
    return "connection failed";
  }
}

String readPage(){
  indice = 0;
  memset(&buf, 0, 32 );
  
  while (true) {
    if (client.available()) {
      char c = client.read();
      
      if (c == '<' ) {
        inLettura = true;
      } else if(inLettura) {
        if (c != '>'){
          buf[indice] = c;
          indice ++;
        } else {
          inLettura = false;
          client.stop();
          client.flush();
          Serial.println("disconnecting.");
          return buf;
        }
      }
    }
  }
}
