#include <Servo.h>
#define tmp 1000

Servo meuServo;
void setup() {
  meuServo.attach(6); 
  meuServo.write(0);
}

void loop() {
  meuServo.write(0);
  delay(tmp); 
  meuServo.write(90);
  delay(tmp);
  meuServo.write(180);
  delay(tmp);
  meuServo.write(90);
  delay(tmp);
}
