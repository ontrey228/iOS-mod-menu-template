ARCHS = arm64

FOR_RELEASE = 1
IGNORE_WARNINGS=0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = @@PROJECTNAME@@

@@PROJECTNAME@@_CFLAGS = -fobjc-arc
@@PROJECTNAME@@_CCFLAGS = -std=c++14 -fno-rtti -fno-exceptions -DNDEBUG

@@PROJECTNAME@@_LDFLAGS += Menu/menu.nigger

@@PROJECTNAME@@_FILES = Tweak.xm $(wildcard KittyMemory/*.cpp)

include $(THEOS_MAKE_PATH)/tweak.mk