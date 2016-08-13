# This file is originally inspired by the esp-open-rtos project 
#

-include $(ROOT)local.mk
-include local.mk

# Flash size in megabits
# Valid values are same as for esptool.py - 2,4,8,16,32
FLASH_SIZE    ?= 16

# Flash mode, valid values are same as for esptool.py - qio,qout,dio.dout
FLASH_MODE    ?= qio

# Flash speed in MHz, valid values are same as for esptool.py - 80, 40, 26, 20
FLASH_SPEED   ?= 40

# Output directories to store intermediate compiled files
# relative to the program directory
BUILD_DIR     ?= $(PROGRAM_DIR)/build
FIRMWARE_DIR  ?= $(PROGRAM_DIR)/firmware

# esptool.py from https://github.com/themadinventor/esptool
ESPTOOL       ?= esptool.py
# serial port settings for esptool.py
ESPPORT       ?= /dev/ttyUSB0
ESPBAUD       ?= 115200

# firmware tool arguments
ESPTOOL_ARGS  = -fs $(FLASH_SIZE)m -fm $(FLASH_MODE) -ff $(FLASH_SPEED)m

# Compiler names, etc. assume gdb
CROSS         ?= xtensa-lx106-elf-

AR            = $(CROSS)ar
CC            = $(CROSS)gcc
CPP           = $(CROSS)cpp
LD            = $(CROSS)gcc
NM            = $(CROSS)nm
C++           = $(CROSS)g++
SIZE          = $(CROSS)size
OBJCOPY       = $(CROSS)objcopy
OBJDUMP       = $(CROSS)objdump

# binary esp-iot-rtos SDK libraries to link. These are pre-processed prior to linking.
LIBS          ?= hal gcc c
SDK_LIBS      ?= json main net80211 lwip phy pp pwm ssl upgrade wpa

LD_SCRIPTS    ?= $(ROOT)/sdk/ld/eagle.app.v6.ld

# V ?= 0
