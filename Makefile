OS := $(shell uname)
ARCH := $(shell uname -m)
LEAP_SDK_PATH := "/home/naruto/Downloads/Leap_Developer_Kit_0.8.0_5300_Linux/LeapSDK/"
ifeq ($(OS), Linux)
  ifeq ($(ARCH), x86_64)
    LEAP_LIBRARY := $(LEAP_SDK_PATH)/lib/x64/libLeap.so
  else
    LEAP_LIBRARY := $(LEAP_SDK_PATH)/lib/x86/libLeap.so
  endif
else
  # OS X
  LEAP_LIBRARY := $(LEAP_SDK_PATH)/lib/libLeap.dylib
endif

Sample: Sample.cpp
	$(CXX) -Wall -g -I$(LEAP_SDK_PATH)/include Sample.cpp -o Sample $(LEAP_LIBRARY)
ifeq ($(OS), Darwin)
	install_name_tool -change @loader_path/libLeap.dylib $(LEAP_SDK_PATH)/lib/libLeap.dylib Sample
endif

clean:
	rm -rf Sample Sample.dSYM
