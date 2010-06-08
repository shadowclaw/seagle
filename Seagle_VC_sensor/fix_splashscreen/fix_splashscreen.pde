void setup()
{
  Serial.begin(9600);
  delay(10000);
   Serial.print(254,BYTE); //character to clear the screen 0xFE01
  Serial.print(1,BYTE);
  Serial.print("      ERAU           SEAGLE");
   Serial.print(124,BYTE);
   Serial.print(10,BYTE);
  delay(10000);
  
}

void loop()
{
  delay(50000);
}

  
