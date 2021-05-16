int sayi=0; 
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

Adafruit_SSD1306 display(128, 64, &Wire, 4);

#include <SPI.h>
#include <mcp2515.h>

struct can_frame canMsg;
MCP2515 mcp2515(10);
void setup()   {            
  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);
  Wire.begin();
     Serial.begin(115200);
  
  mcp2515.reset();
  mcp2515.setBitrate(CAN_125KBPS);
  mcp2515.setNormalMode();
}
void loop() {  

  if (mcp2515.readMessage(&canMsg) == MCP2515::ERROR_OK) {
    Serial.print(canMsg.can_id, DEC); // print ID
    Serial.print(" "); 
    Serial.print(canMsg.can_dlc, DEC); // print DLC
    Serial.print(" ");

    if(canMsg.can_id==1){
       for (int i = 0; i<canMsg.can_dlc; i++)  {  // print the data
      Serial.print(canMsg.data[i],HEX);
      Serial.print(" ");


        
  sayi=(canMsg.data[0] *1)+(canMsg.data[1] *10)+(canMsg.data[2]*100);
  if( canMsg.data[3] ==1)
sayi=sayi*-1;
    }
    }
  }

  display.setTextColor(WHITE);
  display.setCursor(0,20);
  display.setTextSize(3);
  display.println("Q1:");
   display.setCursor(50,20);
  display.setTextSize(3);
  display.println(sayi);
  display.display();
  display.clearDisplay();
}
