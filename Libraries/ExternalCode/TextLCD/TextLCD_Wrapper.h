
#ifndef _TEXTLCD_WRAPPER_H
#define _TEXTLCD_WRAPPER_H

#include "rtwtypes.h"

#ifdef __cplusplus
extern "C" {
#endif

void initScreen(int pin_rs, int pin_e, int pin_d4, int pin_d5, int pin_d6, int pin_d7);
void writeToScreen(const char* pRow1, const char* pRow2, const char* pRow3, const char* pRow4);

#ifdef __cplusplus
}
#endif

#endif /* _TEXTLCD_WRAPPER_H */
