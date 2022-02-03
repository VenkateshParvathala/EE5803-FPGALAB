#include <Arduino.h>

# define X 2
# define Y 3
# define Z 4
# define W 5

int x, y, z, w, out;

void setup() {
  pinMode(LED_BUILTIN,OUTPUT);
  pinMode(X, INPUT);
  pinMode(Y, INPUT);
  pinMode(Z, INPUT);
  pinMode(W, INPUT);
  // put your setup code here, to run once:
}

void loop() {
	x = digitalRead(X);
	y = digitalRead(Y);
	z = digitalRead(Z);
	w = digitalRead(W);

	out = ((!x)&&(!z)) | ((!y)&&(z)) | ((x)&&(z)&&(!w)); 
	if (out==1)
		digitalWrite(LED_BUILTIN, HIGH);
	else
		digitalWrite(LED_BUILTIN, LOW);
}
