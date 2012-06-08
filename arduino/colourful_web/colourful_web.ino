int r = 3;
int g = 5;
int b = 6;

int incomingByte = 0;

void setup() {
  pinMode(r, OUTPUT);
  pinMode(g, OUTPUT);
  pinMode(b, OUTPUT);  
  
  Serial.begin(9600);
  Serial.flush();
}

void loop() {
  while (Serial.available() > 0) {
    
    int rr = Serial.parseInt();
    int gg = Serial.parseInt();
    int bb = Serial.parseInt();
    
    if (Serial.read() == '\n') {
      setLed(rr,gg,bb);
    }
  }
}

void setLed(int rr, int gg, int bb) {
  Serial.print(rr, HEX);
  Serial.print(gg, HEX);
  Serial.println(bb, HEX);
  
  rr = constrain(rr, 0, 255);
  gg = constrain(gg, 0, 255);
  bb = constrain(bb, 0, 255);
  
  analogWrite(r, rr);
  analogWrite(g, gg);
  analogWrite(b, bb);
}
