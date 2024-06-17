# AVR Project Customization and Build Tool

![alt text](https://github.com/Amiiir19/AVRCUBE_BASH_final/blob/main/pics/menu.png)



This repository provides Bash scripts (avrmenu.sh and install.sh) designed to configure and customize AVR microcontroller projects seamlessly. 
It includes instructions on handling generated drivers and prerequisites for setting up the environment.

- Interactively guides you through selecting the desired AVR drivers using the kconfig menu.
- Downloads a base project structure from a remote repository (configurable).
- Customizes the project by copying relevant driver files based on your selections.



## Contents 
* [Features](#features)
* [Prerequisites](#prerequisites)
* [Getting Started ](#getting-started)
* [Usage](#usage)
* [Compile](#compile)
* [Flashing](#flashing)



## Features

- **Interactive Configuration**: Use avrmenu.sh with kconfig-mconf to select AVR drivers and project configurations interactively.
- **Project Customization**: Automates fetching a project template from GitHub (https://github.com/Amiiir19/AVR_DRIVERS) and integrates selected drivers based on user preferences.
- **Build Setup**: Instructions to set up and build the customized AVR project using CMake are provided.

## Prerequisites
Ensure you have the following installed and configured:

- **Bash Shell**: Required for running the setup scripts (avrmenu.sh and install.sh).
- **CMake**: Used to automate the build process. Install CMake version 3.28 or higher.
- **AVR Toolchain**: Install AVR-GCC and AVR-G++ compilers (avr-gcc and avr-g++).
- **Set the path to your AVR toolchain** in CMakeLists.txt (AVR_TOOLCHAIN_PATH).
- **kconfig-mconf** Used for interactive configuration. Ensure it's installed and configured for use with Bash.


## Getting Started 

### 1. Clone this repository:
```bash 
git clone https://github.com/Amiiir19/AVRCUBE_BASH_final.git
cd AVRCUBE_BASH_final
```
### 2. Run the installation script. This creates an alias `avrmenu` for `avrmenu.sh`

```bash 
./install.sh
```

## Usage
### 1. Navigate to the working directory
```bash 
mkdir myproj
cd myproj
avrmenu 
```
### 2. Run `avrmenu` to a Configuration Menu Display 
```bash 
avrmenu
```
![alt text](https://github.com/Amiiir19/AVRCUBE_BASH_final/blob/main/pics/menu.png)

### 3. Shows Which AVR Drivers You need to use with your application 
Be Careful Till now this project doesnt support the depenedency of drivers on eah other so choose your drivers carefully. 

![alt text](https://github.com/Amiiir19/AVRCUBE_BASH_final/blob/main/pics/Drivers.png)


### 4. Shows Whether you want to get the drivers from github online or just copy from the Local. 

![alt text](https://github.com/Amiiir19/AVRCUBE_BASH_final/blob/main/pics/download.png)

### 5. Your project and ready to read your application.

![alt text](https://github.com/Amiiir19/AVRCUBE_BASH_final/blob/main/pics/tree.png)


## Compile 

### 1- **Create a Build Directory** 
Navigate to the top-level project directory and create a folder named build 

### 2-  **Generate Makefiles:**
Run the following command to configure CMake and generate the necessary makefiles:

![alt text](https://github.com/Amiiir19/AVRCUBE_BASH_final/blob/main/pics/cmake.png)


Replace .. with the path to your project's top directory if you're running this command from a different location.

CMake will analyze your project structure, including the provided CMakeLists.txt file.
It will determine the compiler toolchain and linker flags based on the settings in the CMakeLists.txt.


### 3- **Build the Project:**
Once CMake finishes configuring, use the following command to build 
your project:

This will compile your source code (.c files) and link them with the appropriate driver libraries, creating an executable file (typically named project_name.elf).

![alt text](https://github.com/Amiiir19/AVRCUBE_BASH_final/blob/main/pics/tree.png)


## Flashing 
### **Flashing the MCU:** 
Another custom target allows you to flash the generated hex file directly to your microcontroller using avrdude:

![alt text](https://github.com/Amiiir19/AVRCUBE_BASH_final/blob/main/pics/tree.png)

Ensure you have avr-objcopy, avrdude, and the appropriate programmer tool installed and configured for this step to work.



Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

