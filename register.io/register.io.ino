void setup() {
  Serial.begin(9600);
  pinMode(2, OUTPUT);

}

void loop() {
  digitalWrite(2,HIGH);
  delay(100);
  digitalWrite(2,LOW);
  delay(100);
  Serial.println("clk cycle");
}
