void setup() {
  Serial.begin(9600);
  pinMode(2, OUTPUT);  //simulating the CLK
  pinMode(3, OUTPUT);  //serial 
  pinMode(4, OUTPUT);  //serial 

}

void loop() {
  digitalWrite(3,LOW);
  digitalWrite(4,HIGH);
  //CLK
  digitalWrite(2,HIGH);
  delay(1000);
  digitalWrite(2,LOW);
  delay(1000);
  Serial.println("clk cycle");
}
