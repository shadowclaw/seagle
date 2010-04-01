int e_stop = 0;
int stop_voltage;

void setup()
{
 Serial.begin(19200);
 pinMode(13,OUTPUT);
}

void loop()
{
  delay (10);
  stop_voltage = analogRead(0);

  if (stop_voltage <= 900)
  {
    digitalWrite(13,HIGH);
    Serial.println(1);
  }
  else
  {
    digitalWrite(13,LOW);
    Serial.println(0);  
  } 
}
