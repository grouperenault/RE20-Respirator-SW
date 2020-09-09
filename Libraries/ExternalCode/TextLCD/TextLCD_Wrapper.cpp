
#include "rtwtypes.h"
#include "TextLCD.h"
#include "mw_mbed_interface.h"
#include <string>

using namespace std;

TextLCD* Screen;
char row2Char1;

extern "C" void initScreen(int pin_rs, int pin_e, int pin_d4, int pin_d5, int pin_d6, int pin_d7)
{
    Screen = new TextLCD(MW_MbedPins[pin_rs].mbed_pin,
                         MW_MbedPins[pin_e].mbed_pin, 
                         MW_MbedPins[pin_d4].mbed_pin, 
                         MW_MbedPins[pin_d5].mbed_pin, 
                         MW_MbedPins[pin_d6].mbed_pin,
                         MW_MbedPins[pin_d7].mbed_pin,
                         TextLCD::LCD20x4);
}

extern "C" void writeToScreen(const char* pRow1, const char* pRow2, const char* pRow3, const char* pRow4)
{
    

    //Screen->cls();
    //Screen->locate(0,0); //Column , Row
    //Screen->printf("Hello World");
    
    Screen->locate(0,0); //Column , Row
    Screen->printf(pRow1);

    Screen->locate(0,1); //Column , Row
    Screen->printf(pRow2);

    Screen->locate(0,2); //Column , Row
    Screen->printf(pRow3);

    Screen->locate(0,3); //Column , Row
    Screen->printf(pRow4);

    /*
    Screen->locate(0,0);
    Screen->printf(row1);

    Screen->locate(0,1);
    Screen->printf(row2);

    Screen->locate(0,2);
    Screen->printf(row3);

    Screen->locate(0,3);
    Screen->printf(row4);
    */
}