AIO-SplatPost
=============

This package is a fork of [`P4RI4H`](https://github.com/P4RI4H/AIO-SplatPost).

🆕 This package use the latest **Python 3** *(tested with 3.9.1)* and **LUFA 210130**.
Also, I improved a batch file with more options to help you to configure easily your Teensy++ 2.0 card.

Tools needed
------------

  1. **Python 3.x** : Install latest version *(currently 3.9.1)*
  https://www.python.org/downloads/

  2. **Arduino IDE** : Install the package to have all tools
  https://www.arduino.cc/en/software
  After, don't forget to add the PATH Environnement : `C:\Program Files (x86)\Arduino\hardware\tools\avr\bin`
  
  3. **LUFA** : Check if a new version is available
  https://www.fourwalledcubicle.com/LUFA.php
  NB: In this package, LUFA 210130 is already installed.
  
  4. **GIMP** : Install latest version
  https://www.gimp.org/downloads/

Configuration
-------------

  1. Unzip the package source on your desktop.

  2. With GIMP, create a picture with dimensions: `320x120` (example available in the folder ./GIMP_Example)

  Convert your picture: Go to menu Image > Mode > Indexed.
  In the new window opened, click on `Use black and white (1-bit) palette.` and change the drop-down menu next to color dithering to `Floyd-Steinberg (normal)`.
  Once done, click on `Convert` button.
  
  Export your work: Go to menu File > Export As...
  In the new window, click on `All export images` menu and select `Raw Image Data (*.data)`.
  Give the file name `image.data` and put the file in the folder ./SplatPost. 
    
  3. Connect your card Teensy++ 2.0 on your computer.
  
  4. Launch batch file "Configure your card.bat" and follow steps!
