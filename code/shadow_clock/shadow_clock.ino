#include <Adafruit_NeoPixel.h>
#include <ESP8266WiFi.h>
#include <time.h>

#define PIN      5
#define N_LEDS 60

const char* ssid = "YOURSSIDHERE";
const char* password = "YOURPASSWORDHERE";
const char* host     = "time.nist.gov";   

Adafruit_NeoPixel strip = Adafruit_NeoPixel(N_LEDS, PIN, NEO_GRB + NEO_KHZ800);

void setup() {
  Serial.begin(115200);
  delay(1000);
  
  Serial.println("initializing strip");
  strip.begin();
  delay(1000);

  Serial.println("initializing wifi");
  WiFi.mode(WIFI_STA);
  WiFi.disconnect();
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(100);
  }

  syncTime();
}

int h = 6;
int m = 24;
int s = 55;
int brightness = 255;
int count = 0;

void loop() {

  count++;
  if(count >= 3600) {
    count=0;
    syncTime();
  }

  time_t now = time(nullptr);  
  Serial.println(ctime(&now));

  struct tm* timeinfo;
  timeinfo = localtime(&now);

  h = timeinfo->tm_hour;
  m = timeinfo->tm_min;
  s = timeinfo->tm_sec;

  if(h>=7 && h<=14) {
    brightness = 10;
  } else {
    brightness = 255;
  }
  
  setTimePixels((h%12)*5 + (m*5/60), m ,s, brightness);
  /*
  s = s + 1;
  if(s>=60) {
    m+=1;
    s=0;
  }
  if(m>=60) {
    h=(h+1)%12;
    m=0;
  }*/
  delay(1000);
}

static void setTimePixels(int r, int g, int b, int brightness) {
  int oppR = 59 - ((r+30)%60);
  int oppG = 59 - ((g+30)%60);
  int oppB = 59 - ((b+30)%60);
  
  uint32_t black = strip.Color(0,0,0);
  uint32_t red = strip.Color(brightness,0,0);
  uint32_t green = strip.Color(0,brightness,0);
  uint32_t blue = strip.Color(0,0,brightness);

  int pixelColor;
  for(uint16_t i=0;i<60;i++) {
    pixelColor = black;
    if(i==oppR) {
      pixelColor += red;
    }
    if(i==oppG) {
      pixelColor += green;
    }
    if(i==oppB) {
      pixelColor += blue;
    }
    strip.setPixelColor(i, pixelColor);
  }
  strip.show();
}

static void syncTime() {
  configTime(0, 0, "pool.ntp.org", "time.nist.gov"); // UTC
  
  Serial.println("\nWaiting for time");
  while (!time(nullptr)) {
    Serial.print(".");
    delay(100);
  }
  Serial.println("");
}
