# MATLAB-ARDUINO-ROBOT-ARM-CANBUS
![armscreens](https://user-images.githubusercontent.com/79718914/118394912-3bb09800-b650-11eb-83d8-024914b1706b.png)
Bu projede robot kolunun pozisyon,hız,ivme verilerinin kontrolcü, master ve slave cihazları arasındaki CAN ile haberleşmesi gerçekleştirilmiştir.
MATLAB kısmında kinematik hesaplar yapılarak konum bilgileri Master cihaza serial port üzerinden gönderilmektedir. Bu bilgiler Master cihazdan diğer bütün Slave cihazlara MCP2515 CAN Bus ile gönderilmektedir.
Bu projede kinematik hesaplamalar için MATLAB Peter Corke Robotics Toolbox robot-9.10 yüklü olmalıdır. Fakat bu haberleşme robot kol haricindede kullanılabilir.
Kinematik için yapılan hesaplamalar bütün MATLAB sürümleri ile uyumlu değildir eğer hata alırsanız floor() fonksiyonunu inceleyiniz.
