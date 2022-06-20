//
//  utils.h
//
//  Created by ontrey228 on 7/06/22.
//  Copyright © 2022 ontrey228. All rights reserved.
//

#include "menu.h"
#import "KittyMemory/writeData.hpp"

#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), dispatch_get_main_queue(), ^
#define UIColorFromRGB(rgbColor) [UIColor colorWithRed:((float)((rgbColor & 0xFF0000) >> 16))/255.0 green:((float)((rgbColor & 0xFF00) >> 8))/255.0 blue:((float)(rgbColor & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGBA(rgbColor, a) [UIColor colorWithRed:((float)((rgbColor & 0xFF0000) >> 16))/255.0 green:((float)((rgbColor & 0xFF00) >> 8))/255.0 blue:((float)(rgbColor & 0xFF))/255.0 alpha:a]

   uint64_t getAbsoluteAddress(uint64_t offset){
	return KittyMemory::getAbsoluteAddress(framework, offset);
}

#include <substrate.h>
#include <mach-o/dyld.h>

#define HOOK(offset, ptr, orig) MSHookFunction((void *)getAbsoluteAddress(offset), (void *)ptr, (void **)&orig)
#define HOOK_NO_ORIG(offset, ptr) MSHookFunction((void *)getAbsoluteAddress(offset), (void *)ptr, NULL)