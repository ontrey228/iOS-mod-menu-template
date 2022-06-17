//
//  Tweak.xm
//
//  Created by ontrey228 on 7/06/22.
//  Copyright © 2022 ontrey228. All rights reserved.
//

const char *framework = "UnityFramework";

#include "utils.h"

UIFont *swithcFont = [UIFont fontWithName:@"ChalkboardSE-Bold" size:17];
UIColor *switchTextColor = [UIColor colorWithRed:1.00 green:0.01 blue:0.01 alpha:0.90];

/*🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥
These values ​​can be used instead of bytes
NOP, RET, BOOLfalse, BOOLtrue, INT0, INT20, INT50, INT100, INT500, INT1000, INT5000, INT10000, FLOAT0, FLOAT5, FLOAT10, FLOAT15, FLOAT20, FLOAT25, FLOAT30

    usage example in patch:
    [patch offset:@"0x1A64BB0" value:RET];
   
    usage example in offset button:
    [button buttonHeight:30 name:@"chams bypass" textColor:switchTextColor font:swithcFont offsets:@[@"0x1C6B6E4"] bytes:@[@"RET"]];

🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥🟥*/

void (*old_setweapon)(void *instance, int weapID);
void setweapon(void *instance, int weapID) {

    //check if the button is ON
    if([button buttonOn:@"index"]) {
    //use index button ⬇️
    weapID = [[indexs valueFromIndex:@"index"]intValue];
    }
    if([button buttonOn:@"index2"]) {
    //or like this ⬇️
    if([indexs expected:@"akr" fromIndexValue:@"index2"]) {
    weapID = 44;
    }
    if([indexs expected:@"m4" fromIndexValue:@"index2"]) {
    weapID = 46;
    }
    if([indexs expected:@"m4a1" fromIndexValue:@"index2"]) {
    weapID = 43;
        }
    }
    if([button buttonOn:@"textfield"]) {
    //use textfield button ⬇️
    weapID = [[textfield valueFromTextfield:@"textfield"]intValue];
    }
    old_setweapon(instance, weapID);
}

float (*old_speedhack)(void *instance);
float speedhack(void *instance) {
    if(instance != NULL) {
    if([button buttonOn:@"slider"]) {
    //use slider button ⬇️
    return [slider valueFromSlider:@"slider"];
        }
    }
    return old_speedhack(instance);
}

void loadfunction() {

    HOOK(0x1C6776C, setweapon, old_setweapon);
    HOOK(0x1A61B10, speedhack, old_speedhack);

    //chams bypass
    [patch offset:@"0x1A64BB0" byte:@"0xC0035FD6"];

[button buttonHeight:30 name:@"button" textColor:switchTextColor font:swithcFont];

[button buttonHeight:30 name:@"offset" textColor:switchTextColor font:swithcFont offsets:@[@"0x1C6B6E4"] /*protected override bool CanSpawnPlayer()*/ bytes:@[@"0x20008052C0035FD6"]];

[slider sliderSize:40 name:@"slider" slideMin:0 slideMax:25 slideMinColor:switchTextColor slideMaxColor:[UIColor whiteColor] textColor:switchTextColor font:swithcFont];

[textfield textfieldSize:35 name:@"textfield" borderWidth:1 borderColor:switchTextColor textColor:switchTextColor font:swithcFont];

[indexs indexSize:35 name:@"index" indexText:@[@"Butterfly", @"Flip Knife", @"Kunai", @"Scorpino", @"Tanto", @"Daggers"] indexValues:@[@"75", @"77", @"78", @"79", @"80", @"81"] textColor:switchTextColor font:swithcFont];

[indexs indexSize:25 name:@"index2" indexText:@[@"AKR", @"M4", @"M4A1"] indexValues:@[@"akr", @"m4", @"m4a1"] textColor:switchTextColor font:swithcFont];

}

void loadmenu() {

menu *cheat;
cheat = [[menu alloc] initFrameworkName:framework
menuWidth:240 
menuHeight:280
menuRadius:32
topViewColor:UIColorFromRGBA(0xFF0000, 0.70) 
bottomViewColor:UIColorFromRGBA(0xFF0000, 0.70)
topTextColor:UIColorFromRGB(0x00FF00) 
bottomTextColor:UIColorFromRGB(0x00FF00)
topText:@"@@USER@@ mod menu"
bottomText:@"@@SITE@@"
topFont:[UIFont fontWithName:@"ChalkboardSE-Bold" size:24]
bottomFont:[UIFont fontWithName:@"ChalkboardSE-Bold" size:16]
switchesOnColor:[UIColor colorWithRed:0.00 green:1.00 blue:1.00 alpha:0.60]
switchesOffColor:[UIColor colorWithRed:0.00 green:0.00 blue:0.00 alpha:0.10]
numberClicksToOpen:2 //number of repeated taps anywhere on the screen to open the menu
numberFingersToOpen:3 //number of fingers used to open the menu
numberClicksToHide:2 //number of clicks on the top and bottom of the menu to close the menu
];

loadfunction();

}

static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info) {
timer(2) {
loadmenu();
});
}


%ctor {
  CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}