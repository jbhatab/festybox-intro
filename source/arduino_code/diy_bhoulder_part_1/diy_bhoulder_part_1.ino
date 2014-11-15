#include "SevSeg.h"
#include "math.h"

//Create an instance of the object.
SevSeg sevseg;

//Create global variables
int ledPin = A0;
int tempPin = A1;

double thermistorTemp;

void setup() {
  Serial.begin(9600);
  //I am using a common anode display, with the digit pins connected
  //from 2-5 and the segment pins connected from 6-13
  sevseg.Begin(1,2,3,4,5,6,7,8,9,10,11,12,13);
  //Set the desired brightdness (0 to 100);
  sevseg.Brightness(90);

  pinMode( ledPin, OUTPUT);

  pinMode( tempPin, INPUT);
}

void loop() {
  thermistorTemp = Thermister(analogRead(tempPin));

  analogWrite(ledPin, 255);
  sevseg.NewNum(thermistorTemp, 1);
  sevseg.PrintOutput();
}


double Thermister(int RawADC) {
  double Temp;
  Temp = log(((10240000/RawADC) - 10000));
  Temp = 1 / (0.001129148 + (0.000234125 + (0.0000000876741 * Temp * Temp ))* Temp );
  Temp = Temp - 273.15;            // Convert Kelvin to Celcius
  Temp = (Temp * 9.0)/ 5.0 + 32.0; // Convert Celcius to Fahrenheit
  return Temp;
}

