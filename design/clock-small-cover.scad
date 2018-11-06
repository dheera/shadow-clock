include<clock-small-params.scad>

difference() {
    cylinder(d=d_outer,h=1,$fn=fn);
    cylinder(d=d_inner-15,h=1,$fn=fn);
}

difference() {
    cylinder(d=d_inner,h=2.5,$fn=fn);
    cylinder(d=d_inner-15,h=2.5,$fn=fn);
}

difference() {
    cylinder(d=d_inner-12,h=6,$fn=fn);
    cylinder(d=d_inner-15,h=6,$fn=fn);
}