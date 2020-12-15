#include <DHT.h>

#define DHTPIN 4
#define DHTTYPE DHT11

DHT dht(DHTPIN, DHTTYPE);
int incomingByte = 0;

void setup() {
  Serial.begin(9600);
  pinMode(9, OUTPUT);
  dht.begin();
}

void loop() {
  int temp = dht.readTemperature();
int humi = dht.readHumidity();
int suelo = analogRead(A0);

 Serial.print(temp);
  Serial.print(humi);
  Serial.print(suelo);
  Serial.println(' ');
  delay(1000);
  if (Serial.available() > 0){
    incomingByte = Serial.read();
      analogWrite(9, incomingByte);
      delay(9000);
      Serial.println(incomingByte);
   }
}
