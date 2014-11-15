#include "SevSeg.h"
#include "math.h"
#include "PID_v1.h"

//Create an instance of the object.
SevSeg sevseg;

//Create global variables
int ledPin = A0;
int tempPin = A1;
int controlPin = A2;
int powerPin = A3;
int heaterPin = A4;

double thermistorTemp;
double Setpoint, Input, Output;
int desiredTemp;
int powerValue;

PID myPID(&Input, &Output, &Setpoint,2,5,1, DIRECT);

void setup() {
  Serial.begin(9600); // commented so we can use pin 1 and 0
  //I am using a common anode display, with the digit pins connected
  //from 2-5 and the segment pins connected from 6-13
  sevseg.Begin(1,2,3,4,5,6,7,8,9,10,11,12,13);
  //Set the desired brightdness (0 to 100);
  sevseg.Brightness(90);

  myPID.SetMode(AUTOMATIC);
  
  pinMode( ledPin, OUTPUT);
  pinMode( heaterPin, OUTPUT);

  pinMode( tempPin, INPUT );
  pinMode( controlPin, INPUT );
  pinMode( powerPin, INPUT );
  
}

void loop() {
  powerValue = digitalRead(powerPin);

  if(powerValue == 1) {
    
    thermistorTemp = Thermister(analogRead(tempPin));
  
    Input = thermistorTemp;
  
    desiredTemp = map(analogRead(potPin), 450, 1023, 80, 150);
    Setpoint = desiredTemp;
  
    myPID.Compute();
  
    analogWrite(outputPin, Output);

    sevseg.NewNum(desiredTemp, 1);
    sevseg.PrintOutput();
  
  
    if (abs((Setpoint - Input)/Setpoint) < .1) {
      analogWrite(ledPin, 255);
    } 
    else {
      analogWrite(ledPin, 0);
    };

  } else {
   analogWrite(ledpPin, 0);
   analogWrite(outputPin, 0);
  };

  delay(10);
}


double Thermister(int RawADC) {
  double Temp;
  Temp = log(((10240000/RawADC) - 10000));
  Temp = 1 / (0.001129148 + (0.000234125 + (0.0000000876741 * Temp * Temp ))* Temp );
  Temp = Temp - 273.15;            // Convert Kelvin to Celcius
  Temp = (Temp * 9.0)/ 5.0 + 32.0; // Convert Celcius to Fahrenheit
  return Temp;
}

