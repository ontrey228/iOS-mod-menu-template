# iOS template mod menu for theos!

<b>Screenshot from the menu: </b>

<img src="https://media.discordapp.net/attachments/807330479837544510/988864134949007430/image.png">
<img src="https://media.discordapp.net/attachments/807330479837544510/988817639059103824/image.png">

## Features:
* Categories in the menu
* User menu color customization
* 5 button types:
  * Empty Button
  * Offset Button
  * Slider Button
  * Textfield Button
  * Index button
* Checking the user's game version

### Menu setup:

**Setting a framework as executable**
```
const char *framework = "frameworkName";
```

### Using the menu:

<b> Create a menu category: </b>
```
[menu category:@"Category Name" textColor:[UIColor purpleColor] font:[UIFont fontWithName:@"ChalkboardSE-Bold" size:12] borderWidth:1 borderRadius:5 borderColor:[UIColor colorWithRed:1.00 green:0.01 blue:0.01 alpha:0.90]];
```

<b> Patching a offset without button: </b>
```
[patch offset:@"0x1A64BB0" value:RET];
// or
[patch offset:@"0x1A64BB0" byte:@"0xC0035FD6"];
```

<b> Empty Button: </b>
```
[button buttonHeight:30 name:@"Developer Mode" textColor:[UIColor colorWithRed:1.00 green:0.01 blue:0.01 alpha:0.90] font:[UIFont fontWithName:@"ChalkboardSE-Bold" size:14]];
```

<b> Offset Button: </b>
```
[button buttonHeight:30 name:@"Drop Knife" textColor:[UIColor colorWithRed:1.00 green:0.01 blue:0.01 alpha:0.90] font:[UIFont fontWithName:@"ChalkboardSE-Bold" size:14] offsets:@[@"0xA9BEA8", @"0xA9BEA0"] bytes:@[@"0x20008052C0035FD6", @"BOOLtrue"]];
```

<b> Slider Button: </b>
```
[slider sliderSize:40 name:@"Flight Altitude" slideMin:0 slideMax:25 slideMinColor:[UIColor colorWithRed:1.00 green:0.01 blue:0.01 alpha:0.90] slideMaxColor:[UIColor whiteColor] textColor:[UIColor colorWithRed:1.00 green:0.01 blue:0.01 alpha:0.90] font:[UIFont fontWithName:@"ChalkboardSE-Bold" size:14]];
```

<b> Textfield Button: </b>
```
[textfield textfieldSize:35 name:@"Custom Ammo Quantity" borderWidth:1 borderColor:[UIColor colorWithRed:1.00 green:0.01 blue:0.01 alpha:0.90] textColor:[UIColor colorWithRed:1.00 green:0.01 blue:0.01 alpha:0.90] font:[UIFont fontWithName:@"ChalkboardSE-Bold" size:14]];
```

<b> Index Button: </b>
```
[indexs indexSize:35 name:@"Set Knife" indexText:@[@"Butterfly", @"Flip Knife", @"Kunai", @"Scorpino", @"Tanto", @"Daggers"] indexValues:@[@"75", @"77", @"78", @"79", @"80", @"81"] textColor:[UIColor colorWithRed:1.00 green:0.01 blue:0.01 alpha:0.90] font:[UIFont fontWithName:@"ChalkboardSE-Bold" size:14]];
```

<b> Checking if a botton  on:
```
if([button buttonOn:@"Button Name"]) {
   //work
}
// or
bool check = [button buttonOn:@"Button Name"];
if(ckeck) {
   //work
}
```

<b> Getting slider button value: </b>
```
float sliderval = [slider valueFromSlider:@"slider name"];
```

<b> Getting textfield button value: </b>
```
int textval = [[textfield valueFromTextfield:@"textfield name"]intValue];
```

<b> Getting index button value: </b>
```
float indexval = [[indexs valueFromIndex:@"index name"]floatValue];
// or
bool check = [indexs expected:@"expected value" fromIndexValue:@"index name"];
```

### Credits:

* [ontrey228](https://discord.gg/dC8tYryTYw)

* [MJx0](https://github.com/MJx0)
  * [KittyMemory](https://github.com/MJx0/KittyMemory)