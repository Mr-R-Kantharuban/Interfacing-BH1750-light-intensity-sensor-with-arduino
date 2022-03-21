#include <Wire.h> // adds I2C library 
#include <BH1750.h> // adds BH1750 library file 
#include<LiquidCrystal.h> // include LCD library function
// Define which pins of Arduino used with 16X2 LCD
LiquidCrystal lcd (7,6,5,4,3,2); //RS, E, D4, D5, D6, D7
// Create an object "lightMeter" from sensor library structure
// Because we can interface multiple sensor 
// by giving them different names.  
BH1750 lightMeter;

// Initialization of library functions and codes
void setup()
{

  Serial.begin(9600); // set serial buad rate of 9600
  Wire.begin(); // Enable I2C pins of Arduino
  lcd.begin(16,2); // Defines LCD size to 16x2
  lcd.print("Intensity in LUX"); //Print "Intensity in LUX" message on first line LCD
  delay(2000);  // add delay
  // accessing library function through dot operator and object name
  // .begin function start with object name initialize sensor library
  lightMeter.begin();
  delay(2000);

}

void loop() 
{

  // readLightLevel() function use to reads light intensity value
  // this line reads light value and store it in float variable "lux")
  float lux = lightMeter.readLightLevel();
  // set the LCD curson to second line and 6th position
  lcd.setCursor(6,1);
  // print lux value on LCD (2nd row and 6th position) 
  lcd.print(lux);
  delay(1000);

}
