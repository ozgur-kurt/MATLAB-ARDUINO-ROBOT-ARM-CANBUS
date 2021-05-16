
int deger=0;
String text;
int joint1=0,joint2=0,joint3=0;
#include <LiquidCrystal_I2C.h>
LiquidCrystal_I2C lcd(0x27,16,2); 
//LiquidCrystal_I2C lcd(0x27,20,4);  // Ekran calismazsa bir önceki satir iptal edilip,bu satir aktif edilecek
  
#include <SPI.h>
#include <mcp2515.h>

struct can_frame canMsg1;
struct can_frame canMsg2;
struct can_frame canMsg3;
struct can_frame canMsg4;
struct can_frame canMsg5;
struct can_frame canMsg6;

MCP2515 mcp2515(10);
void setup() {
 
  Serial.begin(115200);
  Serial.setTimeout(5);
  lcd.init();                 
  lcd.backlight();
  while (!Serial) { 
    ;
  }
 
  mcp2515.reset();
  mcp2515.setBitrate(CAN_125KBPS);
  mcp2515.setNormalMode();
}






// the loop function runs over and over again forever
void loop() {
  lcd.setCursor(0,0);
  lcd.print("Q1:");
  lcd.setCursor(8,0);
  lcd.print("Q2:");
  lcd.setCursor(4,1);
  lcd.print("Q3:");
  lcd.setCursor(3,0);
   lcd.print(joint1);
  lcd.setCursor(11,0);
   lcd.print(joint2);
     lcd.setCursor(7,1);
   lcd.print(joint3);
  while (Serial.available()){
    
    text = Serial.readStringUntil('\n');
      deger= text.toInt(); 
    
   lcd.clear();
    Serial.flush();
    //delay(100);
      }
 if(abs(deger)%10==1){
  joint1=deger/10;

int a = abs(joint1) / 100;             
int b = (abs(joint1) / 10) - (a*10) ;  
int c = abs(joint1) - a*100 - b*10  ;
  canMsg1.can_id  = 1;
  canMsg1.can_dlc = 4;
  
  canMsg1.data[0] = c;
  canMsg1.data[1] = b;
  canMsg1.data[2] = a;
 
if(deger<0)
  canMsg1.data[3] = 1;
else 
  canMsg1.data[3] = 0;
mcp2515.sendMessage(&canMsg1);
 lcd.setCursor(3,0);
   lcd.print(joint1);
   delay(100);
 }





 
 else if(abs(deger)%10==2){
  joint2=deger/10;

 int a = abs(joint2) / 100;             
int b = (abs(joint2) / 10) - (a*10) ;  
int c = abs(joint2) - a*100 - b*10  ;
  canMsg2.can_id  = 2;
  canMsg2.can_dlc = 4;
  
  canMsg2.data[0] = c;
  canMsg2.data[1] = b;
  canMsg2.data[2] = a;
 
if(deger<0)
  canMsg2.data[3] = 1;
else 
  canMsg2.data[3] = 0;
mcp2515.sendMessage(&canMsg2);
  lcd.setCursor(11,0);
   lcd.print(joint2);
   delay(100);
 }




 
  else if(abs(deger)%10==3){
  joint3=deger/10;

 int a = abs(joint3) / 100;             
int b = (abs(joint3) / 10) - (a*10) ;  
int c = abs(joint3) - a*100 - b*10  ;
  canMsg3.can_id  = 3;
  canMsg3.can_dlc = 4;
  
  canMsg3.data[0] = c;
  canMsg3.data[1] = b;
  canMsg3.data[2] = a;
 
if(deger<0)
  canMsg3.data[3] = 1;
else 
  canMsg3.data[3] = 0;
mcp2515.sendMessage(&canMsg3);
lcd.setCursor(7,1);
lcd.print(joint3);
delay(100);
 }



  
}
