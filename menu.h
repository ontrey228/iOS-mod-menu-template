//
//  menu.h
//
//  Created by ontrey228 on 7/06/22.
//  Copyright © 2022 ontrey228. All rights reserved.
//

#import "UIKit/UIKit.h"

#import <vector>
#import <initializer_list>

@interface menu : UIView

- (id)initFrameworkName:(const char *)name menuWidth:(CGFloat)menuWidth menuHeight:(CGFloat)menuHeight menuRadius:(CGFloat)menuRadius topViewColor:(UIColor *)topViewColor bottomViewColor:(UIColor *)bottomViewColor topTextColor:(UIColor *)topTextColor bottomTextColor:(UIColor *)bottomTextColor topText:(NSString *)topText bottomText:(NSString *)bottomText topFont:(UIFont *)topFont bottomFont:(UIFont *)bottomFont switchesOnColor:(UIColor *)switchesOnColor switchesOffColor:(UIColor *)switchesOffColor numberClicksToOpen:(int)numberClicksToOpen numberFingersToOpen:(int)numberFingersToOpen numberClicksToHide:(int)numberClicksToHide;

typedef NS_ENUM(NSInteger, ByteValues) {
NOP,
RET,
BOOLfalse,
BOOLtrue,
INT0, 
INT20, 
INT50, 
INT100, 
INT500,
INT1000,
INT5000,
INT10000,
FLOAT0,
FLOAT5,
FLOAT10,
FLOAT15,
FLOAT20,
FLOAT25, 
FLOAT30
};

@end

@interface patch : NSObject

+ (void)offset:(NSString *)offset byte:(NSString *)byte;
+ (void)offset:(NSString *)offset_ value:(ByteValues)value;

@end

@interface button : UIButton

+ (void)buttonHeight:(float)buttonHeight name:(NSString *)name textColor:(UIColor *)textColor font:(UIFont *)font;
+ (void)buttonHeight:(float)buttonHeight name:(NSString *)name textColor:(UIColor *)textColor font:(UIFont *)font offsets:(NSArray *)offsets bytes:(NSArray *)bytes;

+ (BOOL)buttonOn:(NSString *)name;

@end

@interface slider : UIButton

+ (void)sliderSize:(float)sliderSize name:(NSString *)name slideMin:(float)slideMin slideMax:(float)slideMax slideMinColor:(UIColor *)slideMinColor slideMaxColor:(UIColor *)slideMaxColor textColor:(UIColor *)textColor font:(UIFont *)font;

+ (float)valueFromSlider:(NSString *)name;

@end

@interface textfield : UIButton <UITextFieldDelegate>

+ (void)textfieldSize:(float)textfieldSize name:(NSString *)name borderWidth:(float)borderWidth borderColor:(UIColor *)borderColor textColor:(UIColor *)textColor font:(UIFont *)font;

+ (NSString *)valueFromTextfield:(NSString *)name;

@end

@interface indexs : UIButton

+ (void)indexSize:(float)indexSize name:(NSString *)name indexText:(NSArray *)indexText indexValues:(NSArray *)indexValues textColor:(UIColor *)textColor font:(UIFont *)font;

+ (NSString *)valueFromIndex:(NSString *)name;
+ (BOOL)expected:(NSString *)value fromIndexValue:(NSString *)name;

@end