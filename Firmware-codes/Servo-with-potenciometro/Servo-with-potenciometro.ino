#include <Arduino.h>
#include <Servo.h>
#define potenciometro A2 

Servo myservo; 
void setup() {
  myservo.attach(6); 
  pinMode(potenciometro,INPUT);
}

void loop() {
  int angulo = map(analogRead(potenciometro),0,1023,0,180);
  myservo.write(angulo);
}
