fn = 512;

leds_per_m = 144;
strip_width = 12;
fudge_factor = 4;

d_inner = 60/leds_per_m/3.141592653*1000 + fudge_factor/3.141592653589;
d_outer = d_inner+8;
h_inner = strip_width;
