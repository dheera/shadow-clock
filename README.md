# shadow-clock

A simple 3D-printable wall clock that displays time using shadows.

This was inspired by a number of similar projects [0](https://www.coroflot.com/ukeskin/Shadow-Clock) [1](https://atmelcorporation.wordpress.com/2015/10/23/shadowplay-is-like-an-arduino-powered-sundial-for-a-wall/) [2](https://solarbotics.com/product/60400/) but I wanted to create something that was simpler, cheaper, and easier to assemble now that we have these amazing individually-addressable LED strips that take only 3 wires to connect.

![Picture](https://raw.githubusercontent.com/dheera/shadow-clock/master/picture.jpg "Picture")

## 3D printing

4 parts in /design/:
* clock-small-back, clock-small-front, clock-small-cover -- print in black or any color
* clock-small-face -- print in white

## COTS parts

* 144 pixel/m WS2812B strip [Source 0](https://www.amazon.com/gp/product/B01CDTEGGO/) [Source 1](https://www.adafruit.com/product/1506)
* WeMos D1 Mini V2 [Source 0](https://www.amazon.com/gp/product/B01MYSYYKX/)
* Right angle header [Source 0](https://www.amazon.com/Simpo-2-54mm-Connector-Plastic-Gold-plated/dp/B07DRDZ18M/)
* USB A to USB micro-B cable [Source 0](https://www.amazon.com/gp/product/B012WHAG7K/)
* Glue [SCIGRIP 16 for PETG](https://www.amazon.com/gp/product/B003HNFLMY/)

## Assembly

Soldering to the flexible strip's contacts can be tricky but assembly is otherwise pretty straightforward. The one thing to make sure of is that you properly cut off the contacts on the last LED so that it doesn't send signals going back around the clock indefinitely.

You'll need to use glue to fix clock-small-back to clock-small-front. If you're printing with PETGThe Wemos D1 Mini V2 should snap into the bracket on the back. Once you have the strip mounted you can then use some lighter adhesive to affix clock-small-face in case you need to remove it later.

![Picture](https://raw.githubusercontent.com/dheera/shadow-clock/master/assembly0.jpg "Picture")
![Picture](https://raw.githubusercontent.com/dheera/shadow-clock/master/assembly1.jpg "Picture")
![Picture](https://raw.githubusercontent.com/dheera/shadow-clock/master/assembly2.jpg "Picture")
![Picture](https://raw.githubusercontent.com/dheera/shadow-clock/master/assembly3.jpg "Picture")
