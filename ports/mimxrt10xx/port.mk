UF2_FAMILY_ID = 0x4fb2d5bd

SDK_DIR = lib/nxp/mcux-sdk
MCU_DIR = $(SDK_DIR)/devices/$(MCU)

# Port Compiler Flags
CFLAGS += \
  -mthumb \
  -mabi=aapcs \
  -mcpu=cortex-m7 \
  -mfloat-abi=hard \
  -mfpu=fpv5-d16 \
  -D__ARMVFP__=0 -D__ARMFPV5__=0 \
  -DXIP_EXTERNAL_FLASH=1 \
  -DXIP_BOOT_HEADER_ENABLE=1 \
  -DCFG_TUSB_MCU=OPT_MCU_MIMXRT10XX
  
# mcu driver cause following warnings
CFLAGS += -Wno-error=unused-parameter

# Port source
SRC_C += \
	$(PORT_DIR)/boards.c \
	$(MCU_DIR)/system_$(MCU).c \
	$(MCU_DIR)/project_template/clock_config.c \
	$(MCU_DIR)/drivers/fsl_clock.c \
	$(SDK_DIR)/drivers/cache/armv7-m7/fsl_cache.c \
	$(SDK_DIR)/drivers/common/fsl_common.c \
	$(SDK_DIR)/drivers/igpio/fsl_gpio.c \
	$(SDK_DIR)/drivers/lpuart/fsl_lpuart.c \
	$(SDK_DIR)/drivers/ocotp/fsl_ocotp.c \
	$(SDK_DIR)/drivers/pwm/fsl_pwm.c \
	$(SDK_DIR)/drivers/xbara/fsl_xbara.c \

ifndef BUILD_NO_TINYUSB
SRC_C += lib/tinyusb/src/portable/nxp/transdimension/dcd_transdimension.c
endif

SRC_S += $(MCU_DIR)/gcc/startup_$(MCU).S

# Port include
INC += \
  $(TOP)/$(PORT_DIR) \
  $(TOP)/$(BOARD_DIR) \
	$(TOP)/$(SDK_DIR)/CMSIS/Include \
	$(TOP)/$(MCU_DIR) \
	$(TOP)/$(MCU_DIR)/project_template \
	$(TOP)/$(MCU_DIR)/xip \
	$(TOP)/$(MCU_DIR)/drivers \
	$(TOP)/$(SDK_DIR)/drivers/cache/armv7-m7 \
	$(TOP)/$(SDK_DIR)/drivers/common \
	$(TOP)/$(SDK_DIR)/drivers/igpio \
	$(TOP)/$(SDK_DIR)/drivers/lpuart \
	$(TOP)/$(SDK_DIR)/drivers/ocotp \
	$(TOP)/$(SDK_DIR)/drivers/pwm \
	$(TOP)/$(SDK_DIR)/drivers/rtwdog \
	$(TOP)/$(SDK_DIR)/drivers/xbara \
	$(TOP)/$(SDK_DIR)/drivers/wdog01 \
