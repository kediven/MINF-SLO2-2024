#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/TP1_TimerPwm_VCO_LMS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/TP1_TimerPwm_VCO_LMS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
<<<<<<< HEAD
SOURCEFILES_QUOTED_IF_SPACED=../src/system_config/default/framework/driver/oc/src/drv_oc_mapping.c ../src/system_config/default/framework/driver/oc/src/drv_oc_static.c ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/default/framework/system/devcon/src/sys_devcon.c ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/default/framework/system/ports/src/sys_ports_static.c ../src/system_config/default/system_init.c ../src/system_config/default/system_interrupt.c ../src/system_config/default/system_exceptions.c ../src/system_config/default/system_tasks.c ../src/app.c ../src/main.c ../src/gestPWM.c ../../../../../../../../bsp/pic32mx_skes/bsp.c ../../../../../../../../bsp/pic32mx_skes/Mc32Delays.c ../../../../../../../../bsp/pic32mx_skes/Mc32DriverAdc.c ../../../../../../../../bsp/pic32mx_skes/Mc32DriverAdcAlt.c ../../../../../../../../bsp/pic32mx_skes/Mc32DriverLcd.c ../../../../../../../../bsp/pic32mx_skes/Mc32CoreTimer.c ../../../../../../../../framework/system/int/src/sys_int_pic32.c ../src/GesFifoTh32.c ../src/Mc32CalCrc16.c ../src/Mc32gest_RS232.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o ${OBJECTDIR}/_ext/1047219354/drv_oc_static.o ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ${OBJECTDIR}/_ext/1688732426/system_init.o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/gestPWM.o ${OBJECTDIR}/_ext/75253217/bsp.o ${OBJECTDIR}/_ext/75253217/Mc32Delays.o ${OBJECTDIR}/_ext/75253217/Mc32DriverAdc.o ${OBJECTDIR}/_ext/75253217/Mc32DriverAdcAlt.o ${OBJECTDIR}/_ext/75253217/Mc32DriverLcd.o ${OBJECTDIR}/_ext/75253217/Mc32CoreTimer.o ${OBJECTDIR}/_ext/1196215957/sys_int_pic32.o ${OBJECTDIR}/_ext/1360937237/GesFifoTh32.o ${OBJECTDIR}/_ext/1360937237/Mc32CalCrc16.o ${OBJECTDIR}/_ext/1360937237/Mc32gest_RS232.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o.d ${OBJECTDIR}/_ext/1047219354/drv_oc_static.o.d ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d ${OBJECTDIR}/_ext/340578644/sys_devcon.o.d ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d ${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d ${OBJECTDIR}/_ext/1688732426/system_init.o.d ${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d ${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d ${OBJECTDIR}/_ext/1688732426/system_tasks.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/gestPWM.o.d ${OBJECTDIR}/_ext/75253217/bsp.o.d ${OBJECTDIR}/_ext/75253217/Mc32Delays.o.d ${OBJECTDIR}/_ext/75253217/Mc32DriverAdc.o.d ${OBJECTDIR}/_ext/75253217/Mc32DriverAdcAlt.o.d ${OBJECTDIR}/_ext/75253217/Mc32DriverLcd.o.d ${OBJECTDIR}/_ext/75253217/Mc32CoreTimer.o.d ${OBJECTDIR}/_ext/1196215957/sys_int_pic32.o.d ${OBJECTDIR}/_ext/1360937237/GesFifoTh32.o.d ${OBJECTDIR}/_ext/1360937237/Mc32CalCrc16.o.d ${OBJECTDIR}/_ext/1360937237/Mc32gest_RS232.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o ${OBJECTDIR}/_ext/1047219354/drv_oc_static.o ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ${OBJECTDIR}/_ext/1688732426/system_init.o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/gestPWM.o ${OBJECTDIR}/_ext/75253217/bsp.o ${OBJECTDIR}/_ext/75253217/Mc32Delays.o ${OBJECTDIR}/_ext/75253217/Mc32DriverAdc.o ${OBJECTDIR}/_ext/75253217/Mc32DriverAdcAlt.o ${OBJECTDIR}/_ext/75253217/Mc32DriverLcd.o ${OBJECTDIR}/_ext/75253217/Mc32CoreTimer.o ${OBJECTDIR}/_ext/1196215957/sys_int_pic32.o ${OBJECTDIR}/_ext/1360937237/GesFifoTh32.o ${OBJECTDIR}/_ext/1360937237/Mc32CalCrc16.o ${OBJECTDIR}/_ext/1360937237/Mc32gest_RS232.o

# Source Files
SOURCEFILES=../src/system_config/default/framework/driver/oc/src/drv_oc_mapping.c ../src/system_config/default/framework/driver/oc/src/drv_oc_static.c ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/default/framework/system/devcon/src/sys_devcon.c ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/default/framework/system/ports/src/sys_ports_static.c ../src/system_config/default/system_init.c ../src/system_config/default/system_interrupt.c ../src/system_config/default/system_exceptions.c ../src/system_config/default/system_tasks.c ../src/app.c ../src/main.c ../src/gestPWM.c ../../../../../../../../bsp/pic32mx_skes/bsp.c ../../../../../../../../bsp/pic32mx_skes/Mc32Delays.c ../../../../../../../../bsp/pic32mx_skes/Mc32DriverAdc.c ../../../../../../../../bsp/pic32mx_skes/Mc32DriverAdcAlt.c ../../../../../../../../bsp/pic32mx_skes/Mc32DriverLcd.c ../../../../../../../../bsp/pic32mx_skes/Mc32CoreTimer.c ../../../../../../../../framework/system/int/src/sys_int_pic32.c ../src/GesFifoTh32.c ../src/Mc32CalCrc16.c ../src/Mc32gest_RS232.c
=======
SOURCEFILES_QUOTED_IF_SPACED=../src/app.c ../src/main.c ../src/gestPWM.c "../../../../../../../../../../Users/vitgoncalves/OneDrive - Education Vaud/ETML-ES/MINF/TP/Pratique_TP/TP2_PwmRs232/Fichiers_TP2/Base_TP2_PwmRs232/GesFifoTh32.c" "../../../../../../../../../../Users/vitgoncalves/OneDrive - Education Vaud/ETML-ES/MINF/TP/Pratique_TP/TP2_PwmRs232/Fichiers_TP2/Base_TP2_PwmRs232/Mc32CalCrc16.c" "../../../../../../../../../../Users/vitgoncalves/OneDrive - Education Vaud/ETML-ES/MINF/TP/Pratique_TP/TP2_PwmRs232/Fichiers_TP2/Base_TP2_PwmRs232/Mc32gest_RS232.c" ../../../../../../../framework/system/int/src/sys_int_pic32.c ../../../../../../../bsp/pic32mx_skes/bsp.c ../../../../../../../bsp/pic32mx_skes/Mc32Delays.c ../../../../../../../bsp/pic32mx_skes/Mc32DriverAdc.c ../../../../../../../bsp/pic32mx_skes/Mc32DriverAdcAlt.c ../../../../../../../bsp/pic32mx_skes/Mc32DriverLcd.c ../../../../../../../bsp/pic32mx_skes/Mc32CoreTimer.c ../src/system_config/default/framework/driver/oc/src/drv_oc_mapping.c ../src/system_config/default/framework/driver/oc/src/drv_oc_static.c ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c ../src/system_config/default/framework/driver/usart/src/drv_usart_static_byte_model.c ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/default/framework/system/devcon/src/sys_devcon.c ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/default/framework/system/ports/src/sys_ports_static.c ../src/system_config/default/system_init.c ../src/system_config/default/system_interrupt.c ../src/system_config/default/system_exceptions.c ../src/system_config/default/system_tasks.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/gestPWM.o ${OBJECTDIR}/_ext/1766713012/GesFifoTh32.o ${OBJECTDIR}/_ext/1766713012/Mc32CalCrc16.o ${OBJECTDIR}/_ext/1766713012/Mc32gest_RS232.o ${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o ${OBJECTDIR}/_ext/1623445232/bsp.o ${OBJECTDIR}/_ext/1623445232/Mc32Delays.o ${OBJECTDIR}/_ext/1623445232/Mc32DriverAdc.o ${OBJECTDIR}/_ext/1623445232/Mc32DriverAdcAlt.o ${OBJECTDIR}/_ext/1623445232/Mc32DriverLcd.o ${OBJECTDIR}/_ext/1623445232/Mc32CoreTimer.o ${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o ${OBJECTDIR}/_ext/1047219354/drv_oc_static.o ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o ${OBJECTDIR}/_ext/327000265/drv_usart_static.o ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ${OBJECTDIR}/_ext/1688732426/system_init.o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ${OBJECTDIR}/_ext/1688732426/system_tasks.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/gestPWM.o.d ${OBJECTDIR}/_ext/1766713012/GesFifoTh32.o.d ${OBJECTDIR}/_ext/1766713012/Mc32CalCrc16.o.d ${OBJECTDIR}/_ext/1766713012/Mc32gest_RS232.o.d ${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o.d ${OBJECTDIR}/_ext/1623445232/bsp.o.d ${OBJECTDIR}/_ext/1623445232/Mc32Delays.o.d ${OBJECTDIR}/_ext/1623445232/Mc32DriverAdc.o.d ${OBJECTDIR}/_ext/1623445232/Mc32DriverAdcAlt.o.d ${OBJECTDIR}/_ext/1623445232/Mc32DriverLcd.o.d ${OBJECTDIR}/_ext/1623445232/Mc32CoreTimer.o.d ${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o.d ${OBJECTDIR}/_ext/1047219354/drv_oc_static.o.d ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d ${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o.d ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d ${OBJECTDIR}/_ext/340578644/sys_devcon.o.d ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d ${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d ${OBJECTDIR}/_ext/1688732426/system_init.o.d ${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d ${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d ${OBJECTDIR}/_ext/1688732426/system_tasks.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/gestPWM.o ${OBJECTDIR}/_ext/1766713012/GesFifoTh32.o ${OBJECTDIR}/_ext/1766713012/Mc32CalCrc16.o ${OBJECTDIR}/_ext/1766713012/Mc32gest_RS232.o ${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o ${OBJECTDIR}/_ext/1623445232/bsp.o ${OBJECTDIR}/_ext/1623445232/Mc32Delays.o ${OBJECTDIR}/_ext/1623445232/Mc32DriverAdc.o ${OBJECTDIR}/_ext/1623445232/Mc32DriverAdcAlt.o ${OBJECTDIR}/_ext/1623445232/Mc32DriverLcd.o ${OBJECTDIR}/_ext/1623445232/Mc32CoreTimer.o ${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o ${OBJECTDIR}/_ext/1047219354/drv_oc_static.o ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o ${OBJECTDIR}/_ext/327000265/drv_usart_static.o ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ${OBJECTDIR}/_ext/1688732426/system_init.o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ${OBJECTDIR}/_ext/1688732426/system_tasks.o

# Source Files
SOURCEFILES=../src/app.c ../src/main.c ../src/gestPWM.c ../../../../../../../../../../Users/vitgoncalves/OneDrive - Education Vaud/ETML-ES/MINF/TP/Pratique_TP/TP2_PwmRs232/Fichiers_TP2/Base_TP2_PwmRs232/GesFifoTh32.c ../../../../../../../../../../Users/vitgoncalves/OneDrive - Education Vaud/ETML-ES/MINF/TP/Pratique_TP/TP2_PwmRs232/Fichiers_TP2/Base_TP2_PwmRs232/Mc32CalCrc16.c ../../../../../../../../../../Users/vitgoncalves/OneDrive - Education Vaud/ETML-ES/MINF/TP/Pratique_TP/TP2_PwmRs232/Fichiers_TP2/Base_TP2_PwmRs232/Mc32gest_RS232.c ../../../../../../../framework/system/int/src/sys_int_pic32.c ../../../../../../../bsp/pic32mx_skes/bsp.c ../../../../../../../bsp/pic32mx_skes/Mc32Delays.c ../../../../../../../bsp/pic32mx_skes/Mc32DriverAdc.c ../../../../../../../bsp/pic32mx_skes/Mc32DriverAdcAlt.c ../../../../../../../bsp/pic32mx_skes/Mc32DriverLcd.c ../../../../../../../bsp/pic32mx_skes/Mc32CoreTimer.c ../src/system_config/default/framework/driver/oc/src/drv_oc_mapping.c ../src/system_config/default/framework/driver/oc/src/drv_oc_static.c ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c ../src/system_config/default/framework/driver/usart/src/drv_usart_static_byte_model.c ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/default/framework/system/devcon/src/sys_devcon.c ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/default/framework/system/ports/src/sys_ports_static.c ../src/system_config/default/system_init.c ../src/system_config/default/system_interrupt.c ../src/system_config/default/system_exceptions.c ../src/system_config/default/system_tasks.c
>>>>>>> b12139c619f81a68ceeebf0d4749fe3f592ac829



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/TP1_TimerPwm_VCO_LMS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
<<<<<<< HEAD
${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o: ../src/system_config/default/framework/driver/oc/src/drv_oc_mapping.c  .generated_files/flags/default/d63cc8755b85c8b345aa1b041f04a746b40973b1 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1047219354" 
	@${RM} ${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o.d" -o ${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o ../src/system_config/default/framework/driver/oc/src/drv_oc_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1047219354/drv_oc_static.o: ../src/system_config/default/framework/driver/oc/src/drv_oc_static.c  .generated_files/flags/default/c3b2988351a57870e62fd4a32f82aa6b68cff1a7 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1047219354" 
	@${RM} ${OBJECTDIR}/_ext/1047219354/drv_oc_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1047219354/drv_oc_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1047219354/drv_oc_static.o.d" -o ${OBJECTDIR}/_ext/1047219354/drv_oc_static.o ../src/system_config/default/framework/driver/oc/src/drv_oc_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o: ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c  .generated_files/flags/default/b5a9b33df0218564bcb4fd37df64beaf44cc7e2d .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1407244131" 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d" -o ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o: ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c  .generated_files/flags/default/354caddb224a7c9e63aa084a340ab8ed4852c124 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1407244131" 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d" -o ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o: ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c  .generated_files/flags/default/ee3a536cbe71b48e0f8cc487ba6a90d53d137c5c .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/639803181" 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/340578644/sys_devcon.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon.c  .generated_files/flags/default/34a971dff80bd5922b967bef394f2932dc57a922 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ../src/system_config/default/framework/system/devcon/src/sys_devcon.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/flags/default/69fe04be332cc8a6214a1a7504602f422474e5ef .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822048611/sys_ports_static.o: ../src/system_config/default/framework/system/ports/src/sys_ports_static.c  .generated_files/flags/default/8125b2143e670833d4ac9c726257359b0d3d802 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/822048611" 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ../src/system_config/default/framework/system/ports/src/sys_ports_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_init.o: ../src/system_config/default/system_init.c  .generated_files/flags/default/ec9b89933d8369cfad07dc40e58d9bb0f3eb6a6c .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_init.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_init.o ../src/system_config/default/system_init.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_interrupt.o: ../src/system_config/default/system_interrupt.c  .generated_files/flags/default/478f8e2a141c62fa41494bbbeefebb7f64a3e452 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ../src/system_config/default/system_interrupt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_exceptions.o: ../src/system_config/default/system_exceptions.c  .generated_files/flags/default/5767ea90367f9fbe3ab005badeb6f38975c6a043 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ../src/system_config/default/system_exceptions.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_tasks.o: ../src/system_config/default/system_tasks.c  .generated_files/flags/default/2959276774f32795459a43ea513c25d3cb87165d .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ../src/system_config/default/system_tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/default/42c28dc088bcd4a1339601be10f7e995dd4af31b .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/598204117d1fd507982637e87a99390b3d61824 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/gestPWM.o: ../src/gestPWM.c  .generated_files/flags/default/dba07f6b9e203110b8f9da07095454290064a8b1 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/gestPWM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/gestPWM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/gestPWM.o.d" -o ${OBJECTDIR}/_ext/1360937237/gestPWM.o ../src/gestPWM.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/75253217/bsp.o: ../../../../../../../../bsp/pic32mx_skes/bsp.c  .generated_files/flags/default/24319c8f4927f13586634ad8be29ce6fd985c683 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/75253217" 
	@${RM} ${OBJECTDIR}/_ext/75253217/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/75253217/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/75253217/bsp.o.d" -o ${OBJECTDIR}/_ext/75253217/bsp.o ../../../../../../../../bsp/pic32mx_skes/bsp.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/75253217/Mc32Delays.o: ../../../../../../../../bsp/pic32mx_skes/Mc32Delays.c  .generated_files/flags/default/7618069bf8db0f9f9bd80692fd6b696dff5c0c77 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/75253217" 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32Delays.o.d 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32Delays.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/75253217/Mc32Delays.o.d" -o ${OBJECTDIR}/_ext/75253217/Mc32Delays.o ../../../../../../../../bsp/pic32mx_skes/Mc32Delays.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/75253217/Mc32DriverAdc.o: ../../../../../../../../bsp/pic32mx_skes/Mc32DriverAdc.c  .generated_files/flags/default/1624347f6f1aaa1e8c0ac9d6c13ec56a8b35d6e4 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/75253217" 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32DriverAdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32DriverAdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/75253217/Mc32DriverAdc.o.d" -o ${OBJECTDIR}/_ext/75253217/Mc32DriverAdc.o ../../../../../../../../bsp/pic32mx_skes/Mc32DriverAdc.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/75253217/Mc32DriverAdcAlt.o: ../../../../../../../../bsp/pic32mx_skes/Mc32DriverAdcAlt.c  .generated_files/flags/default/c70d1915a6871c6e679d24cd7dbf1c4369b8ef34 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/75253217" 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32DriverAdcAlt.o.d 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32DriverAdcAlt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/75253217/Mc32DriverAdcAlt.o.d" -o ${OBJECTDIR}/_ext/75253217/Mc32DriverAdcAlt.o ../../../../../../../../bsp/pic32mx_skes/Mc32DriverAdcAlt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/75253217/Mc32DriverLcd.o: ../../../../../../../../bsp/pic32mx_skes/Mc32DriverLcd.c  .generated_files/flags/default/4c85690ed95009f529c58dbd1cf09e33e5a309a3 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/75253217" 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32DriverLcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32DriverLcd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/75253217/Mc32DriverLcd.o.d" -o ${OBJECTDIR}/_ext/75253217/Mc32DriverLcd.o ../../../../../../../../bsp/pic32mx_skes/Mc32DriverLcd.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/75253217/Mc32CoreTimer.o: ../../../../../../../../bsp/pic32mx_skes/Mc32CoreTimer.c  .generated_files/flags/default/a1a32a2314d4112c1f26d4f7fd4b6d515a93356a .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/75253217" 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32CoreTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32CoreTimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/75253217/Mc32CoreTimer.o.d" -o ${OBJECTDIR}/_ext/75253217/Mc32CoreTimer.o ../../../../../../../../bsp/pic32mx_skes/Mc32CoreTimer.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1196215957/sys_int_pic32.o: ../../../../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/flags/default/cc7127f48852a5a763eccb6913f5d0d69e3f988e .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1196215957" 
	@${RM} ${OBJECTDIR}/_ext/1196215957/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1196215957/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1196215957/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1196215957/sys_int_pic32.o ../../../../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/GesFifoTh32.o: ../src/GesFifoTh32.c  .generated_files/flags/default/8f4775fba88f5c4ec4245cbaecbc6065a6ea26c1 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/GesFifoTh32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/GesFifoTh32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/GesFifoTh32.o.d" -o ${OBJECTDIR}/_ext/1360937237/GesFifoTh32.o ../src/GesFifoTh32.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/Mc32CalCrc16.o: ../src/Mc32CalCrc16.c  .generated_files/flags/default/60787ba68a2fea5fc862c66f9738f1766e4c6566 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32CalCrc16.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32CalCrc16.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Mc32CalCrc16.o.d" -o ${OBJECTDIR}/_ext/1360937237/Mc32CalCrc16.o ../src/Mc32CalCrc16.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/Mc32gest_RS232.o: ../src/Mc32gest_RS232.c  .generated_files/flags/default/1a448e3a0823c3c5fd34b707bf83a20994caecd7 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32gest_RS232.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32gest_RS232.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Mc32gest_RS232.o.d" -o ${OBJECTDIR}/_ext/1360937237/Mc32gest_RS232.o ../src/Mc32gest_RS232.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o: ../src/system_config/default/framework/driver/oc/src/drv_oc_mapping.c  .generated_files/flags/default/d23222875c23422bf87750add77f08799e64bfc1 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1047219354" 
	@${RM} ${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o.d" -o ${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o ../src/system_config/default/framework/driver/oc/src/drv_oc_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1047219354/drv_oc_static.o: ../src/system_config/default/framework/driver/oc/src/drv_oc_static.c  .generated_files/flags/default/295924507013e4ad3a03d47cfca634d900107eae .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1047219354" 
	@${RM} ${OBJECTDIR}/_ext/1047219354/drv_oc_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1047219354/drv_oc_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1047219354/drv_oc_static.o.d" -o ${OBJECTDIR}/_ext/1047219354/drv_oc_static.o ../src/system_config/default/framework/driver/oc/src/drv_oc_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o: ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c  .generated_files/flags/default/43fd154b816deb4a520961592e897b9dd2efed90 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1407244131" 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d" -o ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o: ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c  .generated_files/flags/default/c287f82483db73af4b537b81af2dc09b34d68d3d .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1407244131" 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d" -o ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o: ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c  .generated_files/flags/default/e589c533f85a8a9ea2e0ddcb8edb3159fc144e3b .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/639803181" 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/340578644/sys_devcon.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon.c  .generated_files/flags/default/f04286f633ff90e598efba4137802a1ec009dde3 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ../src/system_config/default/framework/system/devcon/src/sys_devcon.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/flags/default/40a531aaf68d2c4378d5db2298ca67d5d2d3bf75 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822048611/sys_ports_static.o: ../src/system_config/default/framework/system/ports/src/sys_ports_static.c  .generated_files/flags/default/3e93dc1cbc4829cc1a41131631117c1465585c31 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/822048611" 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ../src/system_config/default/framework/system/ports/src/sys_ports_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_init.o: ../src/system_config/default/system_init.c  .generated_files/flags/default/c749a4e869519af01558631ce39f4733176f554a .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_init.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_init.o ../src/system_config/default/system_init.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_interrupt.o: ../src/system_config/default/system_interrupt.c  .generated_files/flags/default/121935ae48fe3c52cf24ab2dac13f32f7a0e44f8 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ../src/system_config/default/system_interrupt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_exceptions.o: ../src/system_config/default/system_exceptions.c  .generated_files/flags/default/8c626bbc2c253c5fcd2d12fa22d640f2ce7f8eef .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ../src/system_config/default/system_exceptions.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_tasks.o: ../src/system_config/default/system_tasks.c  .generated_files/flags/default/db43c9e395fa2df09867e6d20910b6dd0473b83 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ../src/system_config/default/system_tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/default/6756c0b17d7cf88a5424502cae401ac1713a7aa6 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/34ef464670188126d7cbbae72f33d479a2f751ec .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/gestPWM.o: ../src/gestPWM.c  .generated_files/flags/default/5cfc163b0a5baaa0896469395abda6794f2e0a0e .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/gestPWM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/gestPWM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/gestPWM.o.d" -o ${OBJECTDIR}/_ext/1360937237/gestPWM.o ../src/gestPWM.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/75253217/bsp.o: ../../../../../../../../bsp/pic32mx_skes/bsp.c  .generated_files/flags/default/655d470eccb518bdb4b5c9d0a6e5a68d5664924a .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/75253217" 
	@${RM} ${OBJECTDIR}/_ext/75253217/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/75253217/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/75253217/bsp.o.d" -o ${OBJECTDIR}/_ext/75253217/bsp.o ../../../../../../../../bsp/pic32mx_skes/bsp.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/75253217/Mc32Delays.o: ../../../../../../../../bsp/pic32mx_skes/Mc32Delays.c  .generated_files/flags/default/a9252349dce61704fb6174260098341eec2714bb .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/75253217" 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32Delays.o.d 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32Delays.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/75253217/Mc32Delays.o.d" -o ${OBJECTDIR}/_ext/75253217/Mc32Delays.o ../../../../../../../../bsp/pic32mx_skes/Mc32Delays.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/75253217/Mc32DriverAdc.o: ../../../../../../../../bsp/pic32mx_skes/Mc32DriverAdc.c  .generated_files/flags/default/d73fb34fe0b1a94cbf57def87eacdae24948f9bd .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/75253217" 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32DriverAdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32DriverAdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/75253217/Mc32DriverAdc.o.d" -o ${OBJECTDIR}/_ext/75253217/Mc32DriverAdc.o ../../../../../../../../bsp/pic32mx_skes/Mc32DriverAdc.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/75253217/Mc32DriverAdcAlt.o: ../../../../../../../../bsp/pic32mx_skes/Mc32DriverAdcAlt.c  .generated_files/flags/default/b9d6e6e5ad8cd44e56029e7759cc7e51a2e3f202 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/75253217" 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32DriverAdcAlt.o.d 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32DriverAdcAlt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/75253217/Mc32DriverAdcAlt.o.d" -o ${OBJECTDIR}/_ext/75253217/Mc32DriverAdcAlt.o ../../../../../../../../bsp/pic32mx_skes/Mc32DriverAdcAlt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/75253217/Mc32DriverLcd.o: ../../../../../../../../bsp/pic32mx_skes/Mc32DriverLcd.c  .generated_files/flags/default/5bbc73b69ed79bc1952b0000063792f67baa0dc8 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/75253217" 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32DriverLcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32DriverLcd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/75253217/Mc32DriverLcd.o.d" -o ${OBJECTDIR}/_ext/75253217/Mc32DriverLcd.o ../../../../../../../../bsp/pic32mx_skes/Mc32DriverLcd.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/75253217/Mc32CoreTimer.o: ../../../../../../../../bsp/pic32mx_skes/Mc32CoreTimer.c  .generated_files/flags/default/5a0e6c135438bffe8a2e319444464cf93c535fe1 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/75253217" 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32CoreTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/75253217/Mc32CoreTimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/75253217/Mc32CoreTimer.o.d" -o ${OBJECTDIR}/_ext/75253217/Mc32CoreTimer.o ../../../../../../../../bsp/pic32mx_skes/Mc32CoreTimer.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1196215957/sys_int_pic32.o: ../../../../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/flags/default/a651ee66b331a467863811c2894bd092e717b097 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1196215957" 
	@${RM} ${OBJECTDIR}/_ext/1196215957/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1196215957/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1196215957/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1196215957/sys_int_pic32.o ../../../../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/GesFifoTh32.o: ../src/GesFifoTh32.c  .generated_files/flags/default/8eace27094a6b5a6e252023a889a0ce4b39b5901 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/GesFifoTh32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/GesFifoTh32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/GesFifoTh32.o.d" -o ${OBJECTDIR}/_ext/1360937237/GesFifoTh32.o ../src/GesFifoTh32.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/Mc32CalCrc16.o: ../src/Mc32CalCrc16.c  .generated_files/flags/default/b3e6a906adaf4979f5f554ee42fcbd2d0c8c21c0 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32CalCrc16.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32CalCrc16.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Mc32CalCrc16.o.d" -o ${OBJECTDIR}/_ext/1360937237/Mc32CalCrc16.o ../src/Mc32CalCrc16.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/Mc32gest_RS232.o: ../src/Mc32gest_RS232.c  .generated_files/flags/default/4de2878bf2e2509f4a703ccddc33958382be5b9c .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32gest_RS232.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32gest_RS232.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../../framework" -I"../../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Mc32gest_RS232.o.d" -o ${OBJECTDIR}/_ext/1360937237/Mc32gest_RS232.o ../src/Mc32gest_RS232.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
=======
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/default/96ed616470876b8d58b34e576b03f2dd6f4c6852 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/3b44bfcc36db87b0124b359b72b88dd96a11a06f .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/gestPWM.o: ../src/gestPWM.c  .generated_files/flags/default/b4fb48efe3635736f99b7fb62283cf64521e6c30 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/gestPWM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/gestPWM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/gestPWM.o.d" -o ${OBJECTDIR}/_ext/1360937237/gestPWM.o ../src/gestPWM.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1766713012/GesFifoTh32.o: ../../../../../../../../../../Users/vitgoncalves/OneDrive\ -\ Education\ Vaud/ETML-ES/MINF/TP/Pratique_TP/TP2_PwmRs232/Fichiers_TP2/Base_TP2_PwmRs232/GesFifoTh32.c  .generated_files/flags/default/c493f373cdfe38365fbe8af7db3c1f21ac1a3ec7 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1766713012" 
	@${RM} ${OBJECTDIR}/_ext/1766713012/GesFifoTh32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1766713012/GesFifoTh32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1766713012/GesFifoTh32.o.d" -o ${OBJECTDIR}/_ext/1766713012/GesFifoTh32.o "../../../../../../../../../../Users/vitgoncalves/OneDrive - Education Vaud/ETML-ES/MINF/TP/Pratique_TP/TP2_PwmRs232/Fichiers_TP2/Base_TP2_PwmRs232/GesFifoTh32.c"    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1766713012/Mc32CalCrc16.o: ../../../../../../../../../../Users/vitgoncalves/OneDrive\ -\ Education\ Vaud/ETML-ES/MINF/TP/Pratique_TP/TP2_PwmRs232/Fichiers_TP2/Base_TP2_PwmRs232/Mc32CalCrc16.c  .generated_files/flags/default/c879a116db39d0866e69c848a5b9370bc590eb9c .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1766713012" 
	@${RM} ${OBJECTDIR}/_ext/1766713012/Mc32CalCrc16.o.d 
	@${RM} ${OBJECTDIR}/_ext/1766713012/Mc32CalCrc16.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1766713012/Mc32CalCrc16.o.d" -o ${OBJECTDIR}/_ext/1766713012/Mc32CalCrc16.o "../../../../../../../../../../Users/vitgoncalves/OneDrive - Education Vaud/ETML-ES/MINF/TP/Pratique_TP/TP2_PwmRs232/Fichiers_TP2/Base_TP2_PwmRs232/Mc32CalCrc16.c"    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1766713012/Mc32gest_RS232.o: ../../../../../../../../../../Users/vitgoncalves/OneDrive\ -\ Education\ Vaud/ETML-ES/MINF/TP/Pratique_TP/TP2_PwmRs232/Fichiers_TP2/Base_TP2_PwmRs232/Mc32gest_RS232.c  .generated_files/flags/default/a82518a89818ed5f6af3849396c1200b791a576f .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1766713012" 
	@${RM} ${OBJECTDIR}/_ext/1766713012/Mc32gest_RS232.o.d 
	@${RM} ${OBJECTDIR}/_ext/1766713012/Mc32gest_RS232.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1766713012/Mc32gest_RS232.o.d" -o ${OBJECTDIR}/_ext/1766713012/Mc32gest_RS232.o "../../../../../../../../../../Users/vitgoncalves/OneDrive - Education Vaud/ETML-ES/MINF/TP/Pratique_TP/TP2_PwmRs232/Fichiers_TP2/Base_TP2_PwmRs232/Mc32gest_RS232.c"    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o: ../../../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/flags/default/29ed15867ef4ec0e55ce64a89242db47ff61508c .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1140991836" 
	@${RM} ${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o ../../../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1623445232/bsp.o: ../../../../../../../bsp/pic32mx_skes/bsp.c  .generated_files/flags/default/706ab21c101ca0a52fda2fd20c8d4dd0fc48bb63 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1623445232" 
	@${RM} ${OBJECTDIR}/_ext/1623445232/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1623445232/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1623445232/bsp.o.d" -o ${OBJECTDIR}/_ext/1623445232/bsp.o ../../../../../../../bsp/pic32mx_skes/bsp.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1623445232/Mc32Delays.o: ../../../../../../../bsp/pic32mx_skes/Mc32Delays.c  .generated_files/flags/default/222f0d31561394f22103a7adce59f3cca948467c .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1623445232" 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32Delays.o.d 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32Delays.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1623445232/Mc32Delays.o.d" -o ${OBJECTDIR}/_ext/1623445232/Mc32Delays.o ../../../../../../../bsp/pic32mx_skes/Mc32Delays.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1623445232/Mc32DriverAdc.o: ../../../../../../../bsp/pic32mx_skes/Mc32DriverAdc.c  .generated_files/flags/default/c90e2e3fdfc60161b95e3c8c76065c8b2c57a91c .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1623445232" 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32DriverAdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32DriverAdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1623445232/Mc32DriverAdc.o.d" -o ${OBJECTDIR}/_ext/1623445232/Mc32DriverAdc.o ../../../../../../../bsp/pic32mx_skes/Mc32DriverAdc.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1623445232/Mc32DriverAdcAlt.o: ../../../../../../../bsp/pic32mx_skes/Mc32DriverAdcAlt.c  .generated_files/flags/default/4ba5246673ebfb2782e2f677ed72b363b09a7a97 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1623445232" 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32DriverAdcAlt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32DriverAdcAlt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1623445232/Mc32DriverAdcAlt.o.d" -o ${OBJECTDIR}/_ext/1623445232/Mc32DriverAdcAlt.o ../../../../../../../bsp/pic32mx_skes/Mc32DriverAdcAlt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1623445232/Mc32DriverLcd.o: ../../../../../../../bsp/pic32mx_skes/Mc32DriverLcd.c  .generated_files/flags/default/61d35631ce62a18177e236577ca7cc7d3057f3de .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1623445232" 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32DriverLcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32DriverLcd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1623445232/Mc32DriverLcd.o.d" -o ${OBJECTDIR}/_ext/1623445232/Mc32DriverLcd.o ../../../../../../../bsp/pic32mx_skes/Mc32DriverLcd.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1623445232/Mc32CoreTimer.o: ../../../../../../../bsp/pic32mx_skes/Mc32CoreTimer.c  .generated_files/flags/default/780e7e04780a88691236b9e248c626bcbda3509a .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1623445232" 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32CoreTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32CoreTimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1623445232/Mc32CoreTimer.o.d" -o ${OBJECTDIR}/_ext/1623445232/Mc32CoreTimer.o ../../../../../../../bsp/pic32mx_skes/Mc32CoreTimer.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o: ../src/system_config/default/framework/driver/oc/src/drv_oc_mapping.c  .generated_files/flags/default/4e9c81009749c3db99e1b64c6f224654d561bdd5 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1047219354" 
	@${RM} ${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o.d" -o ${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o ../src/system_config/default/framework/driver/oc/src/drv_oc_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1047219354/drv_oc_static.o: ../src/system_config/default/framework/driver/oc/src/drv_oc_static.c  .generated_files/flags/default/551a063a49dc97371eccf2a088a8277738b71c2 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1047219354" 
	@${RM} ${OBJECTDIR}/_ext/1047219354/drv_oc_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1047219354/drv_oc_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1047219354/drv_oc_static.o.d" -o ${OBJECTDIR}/_ext/1047219354/drv_oc_static.o ../src/system_config/default/framework/driver/oc/src/drv_oc_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o: ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c  .generated_files/flags/default/2c81f325f3d12efd3ab87b2e651aeae5f83de6e .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1407244131" 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d" -o ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o: ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c  .generated_files/flags/default/9f2daa66b23eaf2ddd168a986faf06005ab79790 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1407244131" 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d" -o ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c  .generated_files/flags/default/39355c4f447a2ec9d1426f92535ec17a2728226d .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/327000265/drv_usart_static.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c  .generated_files/flags/default/3ec29105dc9537b54a15f9a272b5765ff0108d3d .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_static.o ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_static_byte_model.c  .generated_files/flags/default/9287402fada7c277a9da0c1b7a78a2c4fec08897 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o ../src/system_config/default/framework/driver/usart/src/drv_usart_static_byte_model.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o: ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c  .generated_files/flags/default/8907bab6b82588be20f3dd87cbbda90fe907704d .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/639803181" 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/340578644/sys_devcon.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon.c  .generated_files/flags/default/ca70d292e7bb2d3e0fac0de846d9f759b3cfe1d5 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ../src/system_config/default/framework/system/devcon/src/sys_devcon.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/flags/default/3c9b5b6e1f5941abcb007751e14fbdda45d6c052 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822048611/sys_ports_static.o: ../src/system_config/default/framework/system/ports/src/sys_ports_static.c  .generated_files/flags/default/b202bc7d4eb7d5eede96e4f6b91755a4926d7369 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/822048611" 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ../src/system_config/default/framework/system/ports/src/sys_ports_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_init.o: ../src/system_config/default/system_init.c  .generated_files/flags/default/86a68ce9ad1efad747fabb6eac3e94fbee03c519 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_init.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_init.o ../src/system_config/default/system_init.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_interrupt.o: ../src/system_config/default/system_interrupt.c  .generated_files/flags/default/a37d4745561c6c69d4ca03c5cb087712c087c483 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ../src/system_config/default/system_interrupt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_exceptions.o: ../src/system_config/default/system_exceptions.c  .generated_files/flags/default/b383d8f2dfb488a93a66928e9a9bce3bdf7cf7f2 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ../src/system_config/default/system_exceptions.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_tasks.o: ../src/system_config/default/system_tasks.c  .generated_files/flags/default/35a1a67e4b28ff8d2b1cf943cd52ac54f5293a34 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ../src/system_config/default/system_tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/default/4028b68a7190c59bca4ea375d2f8f9f1d3f5a0a4 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/a6a34f53285fe94b60ad2c9697d7a8dcba09e47e .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/gestPWM.o: ../src/gestPWM.c  .generated_files/flags/default/7adb2d71e0d64ff1e32c37d549f39c692cd416e5 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/gestPWM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/gestPWM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/gestPWM.o.d" -o ${OBJECTDIR}/_ext/1360937237/gestPWM.o ../src/gestPWM.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1766713012/GesFifoTh32.o: ../../../../../../../../../../Users/vitgoncalves/OneDrive\ -\ Education\ Vaud/ETML-ES/MINF/TP/Pratique_TP/TP2_PwmRs232/Fichiers_TP2/Base_TP2_PwmRs232/GesFifoTh32.c  .generated_files/flags/default/d080c7d41a47f04552648702760dec802f9bdefe .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1766713012" 
	@${RM} ${OBJECTDIR}/_ext/1766713012/GesFifoTh32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1766713012/GesFifoTh32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1766713012/GesFifoTh32.o.d" -o ${OBJECTDIR}/_ext/1766713012/GesFifoTh32.o "../../../../../../../../../../Users/vitgoncalves/OneDrive - Education Vaud/ETML-ES/MINF/TP/Pratique_TP/TP2_PwmRs232/Fichiers_TP2/Base_TP2_PwmRs232/GesFifoTh32.c"    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1766713012/Mc32CalCrc16.o: ../../../../../../../../../../Users/vitgoncalves/OneDrive\ -\ Education\ Vaud/ETML-ES/MINF/TP/Pratique_TP/TP2_PwmRs232/Fichiers_TP2/Base_TP2_PwmRs232/Mc32CalCrc16.c  .generated_files/flags/default/97256d7b38dbc934e4d6ebe099b614ac0d1fd284 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1766713012" 
	@${RM} ${OBJECTDIR}/_ext/1766713012/Mc32CalCrc16.o.d 
	@${RM} ${OBJECTDIR}/_ext/1766713012/Mc32CalCrc16.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1766713012/Mc32CalCrc16.o.d" -o ${OBJECTDIR}/_ext/1766713012/Mc32CalCrc16.o "../../../../../../../../../../Users/vitgoncalves/OneDrive - Education Vaud/ETML-ES/MINF/TP/Pratique_TP/TP2_PwmRs232/Fichiers_TP2/Base_TP2_PwmRs232/Mc32CalCrc16.c"    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1766713012/Mc32gest_RS232.o: ../../../../../../../../../../Users/vitgoncalves/OneDrive\ -\ Education\ Vaud/ETML-ES/MINF/TP/Pratique_TP/TP2_PwmRs232/Fichiers_TP2/Base_TP2_PwmRs232/Mc32gest_RS232.c  .generated_files/flags/default/8f190b5b61d0bcf55d5e6f7f8d43dace69efde33 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1766713012" 
	@${RM} ${OBJECTDIR}/_ext/1766713012/Mc32gest_RS232.o.d 
	@${RM} ${OBJECTDIR}/_ext/1766713012/Mc32gest_RS232.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1766713012/Mc32gest_RS232.o.d" -o ${OBJECTDIR}/_ext/1766713012/Mc32gest_RS232.o "../../../../../../../../../../Users/vitgoncalves/OneDrive - Education Vaud/ETML-ES/MINF/TP/Pratique_TP/TP2_PwmRs232/Fichiers_TP2/Base_TP2_PwmRs232/Mc32gest_RS232.c"    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o: ../../../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/flags/default/9be5796b7188996f3b752b0980ac04ba90e7e4f .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1140991836" 
	@${RM} ${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1140991836/sys_int_pic32.o ../../../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1623445232/bsp.o: ../../../../../../../bsp/pic32mx_skes/bsp.c  .generated_files/flags/default/b171d35c6da76f855877380699a93373b18f14f0 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1623445232" 
	@${RM} ${OBJECTDIR}/_ext/1623445232/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1623445232/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1623445232/bsp.o.d" -o ${OBJECTDIR}/_ext/1623445232/bsp.o ../../../../../../../bsp/pic32mx_skes/bsp.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1623445232/Mc32Delays.o: ../../../../../../../bsp/pic32mx_skes/Mc32Delays.c  .generated_files/flags/default/b4eb6ceb52c464d069b15db0b90f1ae3fa3facda .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1623445232" 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32Delays.o.d 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32Delays.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1623445232/Mc32Delays.o.d" -o ${OBJECTDIR}/_ext/1623445232/Mc32Delays.o ../../../../../../../bsp/pic32mx_skes/Mc32Delays.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1623445232/Mc32DriverAdc.o: ../../../../../../../bsp/pic32mx_skes/Mc32DriverAdc.c  .generated_files/flags/default/994ff8930fa2db57ee11545b0c97d53b82bd5f51 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1623445232" 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32DriverAdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32DriverAdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1623445232/Mc32DriverAdc.o.d" -o ${OBJECTDIR}/_ext/1623445232/Mc32DriverAdc.o ../../../../../../../bsp/pic32mx_skes/Mc32DriverAdc.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1623445232/Mc32DriverAdcAlt.o: ../../../../../../../bsp/pic32mx_skes/Mc32DriverAdcAlt.c  .generated_files/flags/default/6363c9a0345512728a7dbe832de8932a759ebb3e .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1623445232" 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32DriverAdcAlt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32DriverAdcAlt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1623445232/Mc32DriverAdcAlt.o.d" -o ${OBJECTDIR}/_ext/1623445232/Mc32DriverAdcAlt.o ../../../../../../../bsp/pic32mx_skes/Mc32DriverAdcAlt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1623445232/Mc32DriverLcd.o: ../../../../../../../bsp/pic32mx_skes/Mc32DriverLcd.c  .generated_files/flags/default/11aa9de59167c0a55d7caa56e798e1159d8b09de .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1623445232" 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32DriverLcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32DriverLcd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1623445232/Mc32DriverLcd.o.d" -o ${OBJECTDIR}/_ext/1623445232/Mc32DriverLcd.o ../../../../../../../bsp/pic32mx_skes/Mc32DriverLcd.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1623445232/Mc32CoreTimer.o: ../../../../../../../bsp/pic32mx_skes/Mc32CoreTimer.c  .generated_files/flags/default/a912c17fffa0a471efe34acd04c55c7a9c81cce7 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1623445232" 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32CoreTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1623445232/Mc32CoreTimer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1623445232/Mc32CoreTimer.o.d" -o ${OBJECTDIR}/_ext/1623445232/Mc32CoreTimer.o ../../../../../../../bsp/pic32mx_skes/Mc32CoreTimer.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o: ../src/system_config/default/framework/driver/oc/src/drv_oc_mapping.c  .generated_files/flags/default/9c373a46103b17cdf41840a505cb1a19e1568a9b .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1047219354" 
	@${RM} ${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o.d" -o ${OBJECTDIR}/_ext/1047219354/drv_oc_mapping.o ../src/system_config/default/framework/driver/oc/src/drv_oc_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1047219354/drv_oc_static.o: ../src/system_config/default/framework/driver/oc/src/drv_oc_static.c  .generated_files/flags/default/3e2214dda46fd96470bad1ba42f84a8e54a3938a .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1047219354" 
	@${RM} ${OBJECTDIR}/_ext/1047219354/drv_oc_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1047219354/drv_oc_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1047219354/drv_oc_static.o.d" -o ${OBJECTDIR}/_ext/1047219354/drv_oc_static.o ../src/system_config/default/framework/driver/oc/src/drv_oc_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o: ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c  .generated_files/flags/default/8310549e6202895fdf9228e336bcc469a5f56667 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1407244131" 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d" -o ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o: ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c  .generated_files/flags/default/75a344b1355e43fa6df477be3e791723d2c9a045 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1407244131" 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d" -o ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c  .generated_files/flags/default/c34641b386c7fadad04eebc7290e70f7671960ba .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/327000265/drv_usart_static.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c  .generated_files/flags/default/89b13835700f4f29213bf97b36df81d172329ac4 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_static.o ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_static_byte_model.c  .generated_files/flags/default/979a266bb18400d21459e71fd3eda7122da1b9b4 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o ../src/system_config/default/framework/driver/usart/src/drv_usart_static_byte_model.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o: ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c  .generated_files/flags/default/4d447a8ecfd8a7561d3306e941d45c66066a14e5 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/639803181" 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/340578644/sys_devcon.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon.c  .generated_files/flags/default/5f8386d7b260129b1cc1f9a6000b184471d0e78f .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ../src/system_config/default/framework/system/devcon/src/sys_devcon.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/flags/default/cc3a85fcc2d60213e2e4f1973da68b87b79c3a .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822048611/sys_ports_static.o: ../src/system_config/default/framework/system/ports/src/sys_ports_static.c  .generated_files/flags/default/410f1dabbf1ee4293a2d16564423717e1a332f67 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/822048611" 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ../src/system_config/default/framework/system/ports/src/sys_ports_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_init.o: ../src/system_config/default/system_init.c  .generated_files/flags/default/3a1ff3e5c7ca5b42206871ce295c3052eb5b0138 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_init.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_init.o ../src/system_config/default/system_init.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_interrupt.o: ../src/system_config/default/system_interrupt.c  .generated_files/flags/default/9146536527695df0e61a4a03880cf6b9fbc21ce6 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ../src/system_config/default/system_interrupt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_exceptions.o: ../src/system_config/default/system_exceptions.c  .generated_files/flags/default/e62825e10b8519d54d80051b77adff5d822250ec .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ../src/system_config/default/system_exceptions.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_tasks.o: ../src/system_config/default/system_tasks.c  .generated_files/flags/default/74a2f1728d93a7cbbad28ea8fbe15bafce56b940 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../../../framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../../../framework" -I"../src/system_config/default/framework" -I"../../../../../../../bsp/pic32mx_skes" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ../src/system_config/default/system_tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
>>>>>>> b12139c619f81a68ceeebf0d4749fe3f592ac829
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
<<<<<<< HEAD
dist/${CND_CONF}/${IMAGE_TYPE}/TP1_TimerPwm_VCO_LMS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../../../../bin/framework/peripheral/PIC32MX795F512L_peripherals.a  
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/TP1_TimerPwm_VCO_LMS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\..\..\..\bin\framework\peripheral\PIC32MX795F512L_peripherals.a      -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/TP1_TimerPwm_VCO_LMS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../../../../bin/framework/peripheral/PIC32MX795F512L_peripherals.a 
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/TP1_TimerPwm_VCO_LMS.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\..\..\..\bin\framework\peripheral\PIC32MX795F512L_peripherals.a      -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
=======
dist/${CND_CONF}/${IMAGE_TYPE}/TP1_TimerPwm_VCO_LMS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../../../bin/framework/peripheral/PIC32MX795F512L_peripherals.a  
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/TP1_TimerPwm_VCO_LMS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\..\..\bin\framework\peripheral\PIC32MX795F512L_peripherals.a      -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/TP1_TimerPwm_VCO_LMS.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../../../bin/framework/peripheral/PIC32MX795F512L_peripherals.a 
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/TP1_TimerPwm_VCO_LMS.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\..\..\bin\framework\peripheral\PIC32MX795F512L_peripherals.a      -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
>>>>>>> b12139c619f81a68ceeebf0d4749fe3f592ac829
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/TP1_TimerPwm_VCO_LMS.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
