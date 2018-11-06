include<clock-small-params.scad>

// panel with cutouts
difference() {
    cylinder(h=1,d=d_outer,$fn=fn);
    translate([d_outer/2,0,0])
    cube([40,15,2],center=true);
    translate([-27,0,0])
    cube([20,9,2],center=true);
    
    translate([0,40,0])
    cube([50,30,2],center=true);
    translate([0,-40,0])
    cube([50,30,2],center=true);
    
}

// outer wall
difference() {
    cylinder(h=9,d=d_outer,$fn=fn);
    cylinder(h=12,d=d_outer-6,$fn=fn);
    translate([d_outer/2-3.75,0,0])
    cube([5,5,8],center=true);
    
    translate([-d_outer/2,0,8])
    cube([10,4,7],center=true);
}

// mount for wemos D1 R2
translate([0,0,1])
wemos();

// mount for nail hanger
translate([47,0,0])
hanger();

module hanger() {
    rotate([0,0,-90]) {
    linear_extrude(8)
    minkowski() {
        polygon([[0,2],[-5,-8],[0,1],[5,-8]]);
        circle(r=1);
    }
    translate([0,0,8])
    linear_extrude(1)
    minkowski() {
        polygon([[0,2],[-5,-8],[0,-5],[5,-8]]);
        circle(r=1);
    }
}
}


module wemos() {

translate([0,25.8/2,0]) {
bracket(length=34);

translate([13,-25.8,0])
rotate([0,0,180])
bracket(length=8);

translate([-14,-25.8,0])
rotate([0,0,180])
bracket(length=6);
    
translate([17.3,-25.8/2,0])
rotate([0,0,-90])
wall(length=10,boardThickness=2.2);

translate([-17.3,-4,0])
rotate([0,0,90])
wall(length=5);

translate([-17.3,-25.8+4,0])
rotate([0,0,90])
wall(length=5);
    
}
}

module wall(height=3.5, thickness=2,length=10, boardThickness=1) {
translate([-length/2,0,0])
cube([length,thickness,height+boardThickness]);

translate([0,0,height])
difference() {
    translate([0,0,-1])
    rotate([45,0,0])
    translate([-length/2,0,0])
    cube([length,sqrt(2),sqrt(2)]);
    
    translate([-length/2,-1,0])
    cube([length,2,2]);
}

}

module bracket(height=3.5, thickness=2,length=10, boardThickness=1.2) {
translate([-length/2,0,0])
cube([length,thickness,height+1+boardThickness]);


translate([0,0,height])
difference() {
    translate([0,0,-1])
    rotate([45,0,0])
    translate([-length/2,0,0])
    cube([length,sqrt(2),sqrt(2)]);
    
    translate([-length/2,-1,0])
    cube([length,2,2]);
}

translate([0,0,height+1+boardThickness])
    translate([0,0,-1])
    rotate([45,0,0])
    translate([-length/2,0,0])
    cube([length,sqrt(2)/2,sqrt(2)/2]);

}