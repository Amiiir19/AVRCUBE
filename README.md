# AVR Project with Menuconfig

This repository contains an AVR project template that allows you to configure and build your project using `menuconfig` and CMake. It provides a streamlined approach to customize project options and manage drivers efficiently.

## Features

- **Interactive Configuration**: Use `menuconfig` to select AVR drivers and features.
- **CMake Build System**: Build your project with CMake for flexibility and scalability.
- **Customization**: Easily add or remove AVR drivers based on project requirements.

## Prerequisites

- AVR Toolchain: Ensure AVR GCC and related tools are installed.
- CMake (version 3.28 or higher): For configuring and building the project.
- `kconfig-mconf`: Tool for interactive configuration (typically used with Linux-like environments).

## Getting Started

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/yourusername/avr-project.git
   cd avr-project
   ```

2. **Configure Project**:
- Run menuconfig to customize your project settings interactively:
   ```bash
./myscript.sh
   ```
   Select the AVR drivers and features you want to include in your project.

