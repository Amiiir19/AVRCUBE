#!/bin/bash

#kconfig-mconf ~/avrmenu/KConfig

# script running scrip
#workDir=$(dirname "$(readlink -f "$0")")
#echo $workDir

# future command to run
#cmdline="last "

# read config

#source $workDir/.config || {
#    echo "ERROR! Unable to read config"
#    exit 1
#}

dir=$(pwd)
source "${dir}"/.config || {
    echo "ERROR! Unable to read config"
    exit 1
}

if [ "x$CONFIG_runNow" == "xy" ]; then

    if [ "x$CONFIG_ONLINE" == "xy" ]; then
        if [ -f "project" ]; then
            mv -r project/APP .
            rm -r project
            echo "done my friend ****** "
        fi
        curl -L -o project.zip https://github.com/Amiiir19/AVR_DRIVERS/archive/main.zip
        unzip -o -q -d  $(echo project.zip | sed 's/\(.*\)\.zip/\1/') project
        rm project.zip
        if [ -f "APP" ]; then
            rm -r project/AVR_DRIVERS-main/APP
            mv -r APP project/AVR_DRIVERS-main
        fi
        cd project || exit
        cd AVR_DRIVERS-main || exit
        mv * ../
        cd ..
        rm -r AVR_DRIVERS-main

        if [ "x$CONFIG_GPIO" != "xy" ]; then
            rm -r MCAL_DRIVERS/GPIO
        fi
        if [ "x$CONFIG_ADC" != "xy" ]; then
            rm -r MCAL_DRIVERS/ADC
        fi
        if [ "x$CONFIG_EXTI" != "xy" ]; then
            rm -r MCAL_DRIVERS/EXTI
            echo "remove timer"
        fi
        if [ "x$CONFIG_TIMER" != "xy" ]; then
            rm -r MCAL_DRIVERS/TIMER
        fi

        if [ "x$CONFIG_PWM" != "xy" ]; then
            rm -r MCAL_DRIVERS/PWM
        fi

        if [ "x$CONFIG_WDT" != "xy" ]; then
            rm -r MCAL_DRIVERS/WDT
        fi
        if [ "x$CONFIG_ICU" != "xy" ]; then
            rm -r MCAL_DRIVERS/ICU
        fi
        if [ "x$CONFIG_SPI" != "xy" ]; then
            rm -r MCAL_DRIVERS/SPI
        fi
        if [ "x$CONFIG_I2C" != "xy" ]; then
            rm -r MCAL_DRIVERS/I2C
        fi

        if [ "x$CONFIG_UART" != "xy" ]; then
            rm -r MCAL_DRIVERS/UART
        fi

        if [ "x$CONFIG_BUZZER" != "xy" ]; then
            rm -r HAL_DRIVERS/BUZZER
        fi

        if [ "x$CONFIG_DC_MOTOR" != "xy" ]; then
            rm -r HAL_DRIVERS/DC_MOTOR
        fi

        if [ "x$CONFIG_KEYPAD" != "xy" ]; then
            rm -r HAL_DRIVERS/KEYPAD
        fi

        if [ "x$CONFIG_LCD" != "xy" ]; then
            rm -r HAL_DRIVERS/LCD
        fi

        if [ "x$CONFIG_ULTRASONIC" != "xy" ]; then
            rm -r HAL_DRIVERS/ULTRASONIC
        fi

        if [ "x$CONFIG_TEMP_SENSOR" != "xy" ]; then
            rm -r HAL_DRIVERS/SENSOR
        fi

        if [ "x$CONFIG_EEPROM" != "xy" ]; then
            rm -r HAL_DRIVERS/EEPROM
        fi
    else
        mkdir project
        cd project || exit
        mkdir MCAL_DRIVERS HAL_DRIVERS build
        cp -r ~/AVR_DRIVERS/LIB_DRIVERS .
        cp -r ~/AVR_DRIVERS/APP .
        cp -r ~/AVR_DRIVERS/src .
        cp ~/AVR_DRIVERS/CMakeLists.txt .

        #we put x here to avoid the $ being empty
        if [ "x$CONFIG_GPIO" == "xy" ]; then
            echo "GPIO Enabled"
            cp -r ~/AVR_DRIVERS/MCAL_DRIVERS/GPIO MCAL_DRIVERS/
        fi

        if [ "x$CONFIG_ADC" == "xy" ]; then
            echo "ADC Enabled"
            cp -r ~/AVR_DRIVERS/MCAL_DRIVERS/ADC MCAL_DRIVERS/
        fi

        if [ "x$CONFIG_EXTI" == "xy" ]; then
            echo "EXTI Enabled"
            cp -r ~/AVR_DRIVERS/MCAL_DRIVERS/EXTI MCAL_DRIVERS/
        fi

        if [ "x$CONFIG_TIMER" == "xy" ]; then
            echo "Timers Enabled"
            cp -r ~/AVR_DRIVERS/MCAL_DRIVERS/TIMER MCAL_DRIVERS/
        fi

        if [ "x$CONFIG_PWM" == "xy" ]; then
            echo "PWM Enabled"
            cp -r ~/AVR_DRIVERS/MCAL_DRIVERS/PWM MCAL_DRIVERS/
        fi

        if [ "x$CONFIG_WDT" == "xy" ]; then
            echo "WDT Enabled"
            cp -r ~/AVR_DRIVERS/MCAL_DRIVERS/WDT MCAL_DRIVERS/
        fi

        if [ "x$CONFIG_ICU" == "xy" ]; then
            echo "ICU Enabled"
            cp -r ~/AVR_DRIVERS/MCAL_DRIVERS/ICU MCAL_DRIVERS/
        fi

        if [ "x$CONFIG_SPI" == "xy" ]; then
            echo "SPI Enabled"
            cp -r ~/AVR_DRIVERS/MCAL_DRIVERS/SPI MCAL_DRIVERS/
        fi

        if [ "x$CONFIG_I2C" == "xy" ]; then
            echo "I2C Enabled"
            cp -r ~/AVR_DRIVERS/MCAL_DRIVERS/I2C MCAL_DRIVERS/
        fi

        if [ "x$CONFIG_UART" == "xy" ]; then
            echo "UART Enabled"
            cp -r ~/AVR_DRIVERS/MCAL_DRIVERS/UART MCAL_DRIVERS/
        fi

        if [ "x$CONFIG_BUZZER" == "xy" ]; then
            echo "BUZZER Enabled"
            cp -r ~/AVR_DRIVERS/HAL_DRIVERS/BUZZER HAL_DRIVERS/
        fi

        if [ "x$CONFIG_DC_MOTOR" == "xy" ]; then
            echo "DC Motor Enabled"
            cp -r ~/AVR_DRIVERS/HAL_DRIVERS/DC_MOTOR HAL_DRIVERS/
        fi

        if [ "x$CONFIG_KEYPAD" == "xy" ]; then
            echo "KEYPAD Enabled"
            cp -r ~/AVR_DRIVERS/HAL_DRIVERS/KEYPAD HAL_DRIVERS/
        fi

        if [ "x$CONFIG_LCD" == "xy" ]; then
            echo "LCD Enabled"
            cp -r ~/AVR_DRIVERS/HAL_DRIVERS/LCD HAL_DRIVERS/
        fi

        if [ "x$CONFIG_ULTRASONIC" == "xy" ]; then
            echo "ULTRASONIC Enabled"
            cp -r ~/AVR_DRIVERS/HAL_DRIVERS/ULTRASONIC HAL_DRIVERS/
        fi

        if [ "x$CONFIG_TEMP_SENSOR" == "xy" ]; then
            echo "TEMP_SENSOR Enabled"
            cp -r ~/AVR_DRIVERS/HAL_DRIVERS/SENSOR HAL_DRIVERS/
        fi

        if [ "x$CONFIG_EEPROM" == "xy" ]; then
            echo "EEPROM Enabled"
            cp -r ~/AVR_DRIVERS/HAL_DRIVERS/EEPROM HAL_DRIVERS/
        fi

    fi

fi
