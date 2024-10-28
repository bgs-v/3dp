x = 64;
y = 33.5;
z = 3;
xa = 2.5;
ya = 2.5;
$fn=30;
minkowski() {
    cube([x, y, z]);
    translate([xa, ya, 0]) cylinder(z, 3, 3);
}

//base
//box that goes up, tapering from the outside 50.4 to 33.2 at the top
//box wall width is 2.5
//lots of various shapes and things
//total height is 67.3