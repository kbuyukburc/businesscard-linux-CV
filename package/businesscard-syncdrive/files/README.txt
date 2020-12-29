ABOUT ME

I am an embedded systems engineer with computer vision skills. 
I call my self as embedded vision engineer. I believe edge
computing and AIOT(Artificial Intelligence Of Things) is 
our future. I generally design circuit boards and software for 
MCUs or PC.

But my specific expertise are
- Hardware design for USB 2.0 or super speed USB 3.X devices.
- Modifing drivers for camera sensors.
- Synchronization between multiple cameras and lightning devices.
- Build firmware for Snapdragon 820 SOC.
- Stereo camera, LiDAR calibration and self-calibration systems.
- USB packages sniffing and hacking.

PUBLISHED PAPERS

Hasnain Ali, Pierre-Yves Laffont, Shukri Bin Abdul Jalil,
Kutluhan Buyukburc, Pierre-Yves Guillemet, Samuel Wirajaya, Liqiang Khoo, Teng Deng, 
and Jean-Charles Bazin. "Piezo-actuated varifocal head-mounted displays for virtual 
and augmented reality." In Advances in Display Technologies IX, 
vol. 10942, p. 1094207. International Society for Optics and Photonics, 2019.

Pradeep Anand Ravindranath, Kutluhan Buyukburc, and Ali Hasnain 
"Self-calibration of sensors using point cloud feature extraction", 
Proc. SPIE 11525, SPIE Future Sensing Technologies, 115250M (8 November 2020); 
https://doi.org/10.1117/12.2580630

ABOUT THIS CARD

This is a small Linux computer running a custom-built Linux distribution.
It has a $1.40 system-on-a-chip with 32MB RAM and 16MB storage; 
everything runs in this very constrained environment.
It is configured to appear as a "USB gadget" -- a complete Linux device 
playing the role of a peripheral.
 
In this case, the card emulates a very small flash drive. This readme is on
the flash drive alongside my resume and lenna photos(famous computer vision person).
This small flash drive can mount on linux filesystem or usb mass storage device.
With mounting linux filesystem, You can use opencv libraries with python on 
mounted filesystem. For example, can read lenna.png(cv2.imread), change color space to
grayscale(cv2.cvtColor) and save as jpeg file(cv2.imwrite).
    syncdrive mount
    python
    >>import cv2
    >>import numpy as np
    >>img = cv2.imread('/mnt/lenna.png')
    >>img_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    >>cv2.imwrite('/mnt/lenna_gray.jpg', img_gray)
    >>exit()
    syncdrive usb
You can easly calibrate your cameras with adding checker board images to the
usb mass storage.
You can make panorama image with opencv Stitcher module.
You can undistord your fisheye images.
Rest is your imagination.

The card also emulates a serial port.  You can use this to log into the card's
Linux shell and run programs -- it is a complete computer.  On Windows, you can
use PuTTY or similar to connect to the COM port (you may need to open Device
Manager to discover which COM port number it has been assigned).  On Linux, you
can use screen.  Try this example command:

    sudo screen /dev/ttyUSB0

You should get a "Welcome" message and a login prompt once you connect (if not,
press Enter a few times).  The username is "root" and there is no password.

Best wish
    Kutluhan Buyukburc
