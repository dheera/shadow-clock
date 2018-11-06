include<clock-small-params.scad>

translate([0,0,2])
union() {
    difference() {
        cylinder(d=d_outer, h=h_inner+3, $fn=fn);
        translate([0,0,-0.5])
        cylinder(d=d_inner, h=h_inner+3+1, $fn=fn);
    }
    cylinder(d1=6,d2=1,h=(h_inner+1)*3/4,$fn=64);
}
difference() {
    cylinder(d=d_outer,h=2,$fn=fn);
    translate([d_inner/2,0,0])
    cube([4,4,4], center=true);
}
