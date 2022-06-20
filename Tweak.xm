//
//  Tweak.xm
//
//  Created by ontrey228 on 7/06/22.
//  Copyright © 2022 ontrey228. All rights reserved.
//

const char *framework = "UnityFramework";

#include "utils.h"

    UIFont *swithcFont = [UIFont fontWithName:@"ChalkboardSE-Bold" size:14];
    UIColor *switchTextColor = [UIColor colorWithRed:1.00 green:0.01 blue:0.01 alpha:0.90];

/*******************************************

These values ​​can be used instead of bytes
NOP, RET, BOOLfalse, BOOLtrue, INT0, INT20, INT50, INT100, INT500, INT1000, INT5000, INT10000, FLOAT0, FLOAT5, FLOAT10, FLOAT15, FLOAT20, FLOAT25, FLOAT30

    usage example in patch:
    [patch offset:@"0x1A64BB0" value:RET];
   
    usage example in offset button:
    [button buttonHeight:30 name:@"Chams Bypass" textColor:switchTextColor font:swithcFont offsets:@[@"0x1C6B6E4"] bytes:@[@"RET"]];

*******************************************/

void (*old_setweapon)(void *instance, int weapID);
void setweapon(void *instance, int weapID) {

    //check if the button is ON
    if([button buttonOn:@"Set Weapon"]) {
        //use index button ⬇️
        weapID = [[indexs valueFromIndex:@"Set Weapon"]intValue];
    }
    
    if([button buttonOn:@"Set Weapon"]) {
        //or like this ⬇️
        if([indexs expected:@"tanto knife" fromIndexValue:@"Set Weapon"]) {
            weapID = 80;
        }
    if([indexs expected:@"daggers knife" fromIndexValue:@"Set Weapon"]) {
        weapID = 81;
        }
    }

    if([button buttonOn:@"Set Weapon ID"]) {
        //use textfield button ⬇️
        weapID = [[textfield valueFromTextfield:@"Set Weapon ID"]intValue];
    }
    old_setweapon(instance, weapID);
}

float (*old_speedhack)(void *instance);
float speedhack(void *instance) {
    if(instance != NULL) {
        if([button buttonOn:@"Speed Hack"]) {
        //use slider button ⬇️
        return [slider valueFromSlider:@"Speed Hack"];
        }
    }
    return old_speedhack(instance);
}

void loadfunction() {

    HOOK(0x1C6776C, setweapon, old_setweapon);
    HOOK(0x1A61B10, speedhack, old_speedhack);

    //chams bypass
    [patch offset:@"0x1A64BB0" byte:@"0xC0035FD6"];

    [button buttonHeight:30 name:@"Developer Mode" textColor:switchTextColor font:swithcFont];

    [button buttonHeight:30 name:@"Spawn Hack" textColor:switchTextColor font:swithcFont offsets:@[@"0x1C6B6E4"] bytes:@[@"0x20008052C0035FD6"]];

    [slider sliderSize:40 name:@"Speed Hack" slideMin:0 slideMax:25 slideMinColor:switchTextColor slideMaxColor:[UIColor whiteColor] textColor:switchTextColor font:swithcFont];

    [textfield textfieldSize:35 name:@"Set Weapon ID" borderWidth:1 borderColor:switchTextColor textColor:switchTextColor font:swithcFont];

    [indexs indexSize:35 name:@"Set Weapon" indexText:@[@"Butterfly", @"Flip Knife", @"Kunai", @"Scorpino", @"Tanto", @"Daggers"] indexValues:@[@"75", @"77", @"78", @"79", @"tanto knife", @"daggers knife"] textColor:switchTextColor font:swithcFont];
}

void loadmenu() {

menu *cheat;
cheat = [[menu alloc] initFrameworkName:framework
menuWidth:250 
menuHeight:290
menuRadius:25
topViewColor:UIColorFromRGBA(0xFF0000, 0.70) 
bottomViewColor:UIColorFromRGBA(0xFF0000, 0.70)
topTextColor:UIColorFromRGB(0x00FF00) 
bottomTextColor:UIColorFromRGB(0x00FF00)
topText:@"template mod menu"
bottomText:@"discord.gg/leontap"
topFont:[UIFont fontWithName:@"ChalkboardSE-Bold" size:23]
bottomFont:[UIFont fontWithName:@"ChalkboardSE-Bold" size:15]
switchesOnColor:[UIColor colorWithRed:0.00 green:1.00 blue:1.00 alpha:0.60]
switchesOffColor:[UIColor colorWithRed:0.00 green:0.00 blue:0.00 alpha:0.10]
numberClicksToOpen:2 //number of repeated taps anywhere on the screen to open the menu.
numberFingersToOpen:3 //number of fingers used to open the menu.
numberClicksToHide:2 //number of clicks on the top and bottom of the menu to close the menu.
openButton:NO //if yes, the user will be able to open the menu using only the button.
button:@"BASE 64 LINK"
buttonWidth:40 
buttonHeight:60
];

loadfunction();

}

static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info) {
    timer(2) {
/*******************************************

Optionally, you can check the user's game version.  If the user has an older or newer version of the game installed, they will get an error and will not be able to use the cheat.

use case:
    if([menu gameVersion:@"version"])

*******************************************/
    loadmenu();
    });
}


%ctor {
  CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}