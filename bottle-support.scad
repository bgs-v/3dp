//diameter: .76in 19.4mm
//wall diam: 1.2mm
//prong width 4.7mm

//date: 2024 september 24
//purpose: replace broken bottle steamer part

//cylinder with cutout
//curved 'finger' to hold bottles
//prongs on the bottom to snap into the warmer
$fn=32; //200 when done
cylheight = 51.7 / 10;
cyldiam = 19.6;
wallwidth = 1.2;
prong_height_offset = 7;
//cylinder(r = cyldiam, h = cylheight)
module mainCylinder()
{
    difference()
    {
        cylinder(r = cyldiam, h = cylheight);
        cylinder(r = cyldiam - wallwidth, h = cylheight );
    };
}

module notch() {
    scale([2, 3.5, 2]) //TODO: tweak scale
    linear_extrude(1)
    polygon([[0,0],[0,1],[1,1]]);
}

module prong() {
    //curved support underneath hanging bit to improve printing
    difference() {
        //flat cube with cylinders cut out for rounded corners
        translate([-4, cyldiam - wallwidth - 0.5, -prong_height_offset]) { cube([8, 1.5, prong_height_offset]); }
        translate([10, 25, -8]) rotate([90, 0, 0]) cylinder(10, 10, 10);
        translate([-10, 25, -8]) rotate([90, 0, 0]) cylinder(10, 10, 10);
    }
    translate([-1, cyldiam - wallwidth - 0.5, -prong_height_offset]) {
        cube([2, 1.5, cylheight + prong_height_offset]);
        translate([0, 1.5, 0]) rotate([90, 0, 90]) notch();
    }
    
}

module curvedTop() {
    //TODO: can probably approximate with an arc of a very large circle
}


module final() {
    union() {
        
        curvedTop();
        mainCylinder();
        prong();
        mirror([0, -1, 0]) prong();
    }
}

final();