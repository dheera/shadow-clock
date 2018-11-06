include<clock-small-params.scad>

difference() {
    cylinder(d=d_inner-0.1,h=0.8, $fn=fn);
    translate([d_inner/2,0,0])
    cube([5,5,5], center=true);
    cylinder(d=6,h=2,$fn=64);
}
