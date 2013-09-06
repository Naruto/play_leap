export LEAP_SDK_PATH="/home/naruto/Downloads/Leap_Developer_Kit_0.8.0_5300_Linux/LeapSDK/"

if [  `uname -p` = "x86_64" ]; then
    export ARCH_PATH="x64"
else
    export ARCH_PATH="x86"
fi
export LD_LIBRARY_PATH=${LEAP_SDK_PATH}/lib/${ARCH_PATH}:${LD_LIBRARY_PATH}
