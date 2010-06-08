//Seagle voltage and current sensor code
//Computer sends a query for data and the arduino will send the current voltage,current,and the mAh used since it was last turned on

//Analog input 0 to 3.3v --> 0 to 1023
//63.69mV per Volt read
//36.60mV per Amp read

//Display on LCD sent over serial
//Labview piggybacks off the same serial line to read in the data
//Data updates at 10 Hz

//2x16 character display
//0123456789ABCDEF
//V: 11.23 C: 1234
//A: 11.23 M: ABCD

const float VOLTAGE_FACTOR=0.050648;
const float CURRENT_FACTOR=0.088136;

float voltage=0;
float current=0;
float mas=0;
float mah=0;

int voltage_pin=0;
int current_pin=1;

long current_time=0;
long last_time=0;
long delta_time=0;

byte buffer[3];

void setup()
{
  Serial.begin(9600);
  last_time=millis();
}


void loop()
{
  delay(950);
  long current_time=millis();
  delta_time=current_time-last_time;
  last_time=current_time;
  
  voltage=(float)analogRead(voltage_pin)*VOLTAGE_FACTOR;
  current=(float)analogRead(current_pin)*CURRENT_FACTOR;
  mas=mas+(current*(float)delta_time);
  mah=mas/3600.0;
  Serial.print(254,BYTE); //character to clear the screen 0xFE01
  Serial.print(1,BYTE);
  Serial.print("V: ");
  if (voltage<10) Serial.print(" ");
  Serial.print(voltage);
  //Serial.print(5.12,2);
  Serial.print(" C: ");
  if (mah<1000) Serial.print(" ");
  if (mah<100) Serial.print(" ");
  if (mah<10) Serial.print(" ");
  Serial.print(int(mah));
  Serial.print("A: ");
  if (current<10) Serial.print(" ");
  Serial.print(current);

//  Serial.print(" M: ");
//  Serial.print("MODE");

  Serial.print(" Seagle");

}
