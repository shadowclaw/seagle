#include "WProgram.h"
void setup();
void loop();
int new_e_stop = 1;
int old_e_stop = 1;
long delay_time = 0;
int motor_kill_pin = 9;
int buffer;
void setup()
{
 Serial.begin(19200);
 pinMode(13,OUTPUT);
 pinMode(motor_kill_pin,OUTPUT);
}

void loop()
{  
  while (Serial.available())
  {
    buffer=Serial.read();
    if (buffer == 48)
    {
      digitalWrite(motor_kill_pin,LOW);
      digitalWrite(13,LOW);
    }
    
    if(buffer == 49)
    {
      digitalWrite(motor_kill_pin,HIGH);
      digitalWrite(13,HIGH); 
    }
  }
  
  extern volatile unsigned long timer0_millis;
  cli();
  timer0_millis=0;
  sei();
  
  while(!Serial.available())
  {
    if (millis() >= 500)
    {
      digitalWrite(motor_kill_pin,HIGH);    
      digitalWrite(13,HIGH);
    }
  }
}





int main(void)
{
	init();

	setup();
    
	for (;;)
		loop();
        
	return 0;
}

