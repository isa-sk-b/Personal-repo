#include <Arduino.h>
#define LDR 
#define led

void setup() {
  pinMode(LDR,INPUT);
  pinMode(led,OUTPUT);
  Serial.begin(9600)); 
}

void loop() {
  int ldr_read = analogRead(LDR); 
  if(ldr_read>600) digitalWrite(led,HIGH); 
  else digitalWrite(led,LOW); 
  Serial.println(ldr_read); // colocar caso queira ter a leitura dos valores
  delay(10);
  // precisa colocar delay aqui? se sim pq e se n pq?
}
