//diameter: .76in 19.4mm
//wall diam: 1.2mm
//prong width 4.7mm

//date: 2024 september 24
//purpose: replace broken bottle steamer part

//cylinder with cutout
//curved 'finger' to hold bottles
//prongs on the bottom to snap into the warmer
//thoughts on 2024 october 10, after having reached a conclusion:
//If I were cleverer with trig/geometry, I wouldn't have to manually tweak all the translate/rotates.
$fn = 200; //200 when done
cylheight = 51.7;
cyldiam = 19.6;
cylrad = cyldiam / 2; // oops. yes I did print this out using diameter as radius. as I said: oops.
wallwidth = 1.2;
prongwidth = 4.8;
prong_height_offset = 7;
extraHeight = 14;
//cylinder(r = cyldiam, h = cylheight)
module mainCylinder()
{
    
    cylinder(r = cylrad, h = cylheight + extraHeight);
}

module notch() {
    scale([2, 3.5, 2])
    linear_extrude(prongwidth/2)
    polygon([[0,0],[0,1],[1,1]]);
}

module support() {
    rotate([0, 0, -12]) difference() {
        cube([4, wallwidth, prong_height_offset, ]);
        translate([10.75, 3, 0]) rotate ([90,0,0]) cylinder(3, 10, 10);
    }
}

module prong(includeNotch = true) {
    difference() {
    //curved support underneath hanging bit to improve printing
    translate([0, cylrad - wallwidth, -prong_height_offset]) {
        support();
        mirror([1, 0, 0]) support();
        }
        translate([-5, cylrad-.2, -prong_height_offset]) cube(10, 10, 10); //subtract the problem1 edges
    }
    if (includeNotch) {
        translate([- prongwidth / 2, cylrad - wallwidth - 0.5, -prong_height_offset - 1]) {
            cube([prongwidth, wallwidth + .3, 1 + prong_height_offset]);
            translate([0, 1.5, 0]) rotate([90, 0, 90]) notch();
        }
    }
}

module curvedTop() {
    translate([0, 0, cylheight])
    rotate([25, 0, 0]) 
    difference() {
        cylinder(cylheight, 10, 10);
        cylinder(cylheight, 10 - wallwidth, 10 - wallwidth);
    }
}

module prongs() {
    prong();
    mirror([0, 1, 0]) prong();
    rotate([0, 0, 90]) prong(false);
    
    rotate([0, 0, 90]) mirror ([0, 1, 0]) prong(false);
    rotate([0, 0, 90]) prong(false);
}

module supportPoly() {
    
    polygon([
    [0.1,0.01],
    [0.6,0.36],
    [1,1],
    [1.4,1.96],
    [1.8,3.24],
    [2.2,4.84],
    [2.6,6.76],
    [3,9],
    [3.4,11.56],
    [3.8,14.44],
    [4.2,17.64],
    [4.6,21.16],
    [5,25],
    ]);
}

module supportPolyEx() {
    translate([-20, 0, 0])
    scale([8, 2, 2.8])
    difference() {
        linear_extrude(4) supportPoly();
        translate([-0.50, .5, -5]) linear_extrude(10) supportPoly();
    }
}

module curvedTop() {
    w = 5;
    rotate([0, 0, 90])
    translate([cylrad-1.5, 0, cylheight-1.0]) {        
        union() {
            rotate([90, 0, 0]) {
                supportPolyEx();
                mirror([0, 0, 1]) supportPolyEx();
            }
        }
    }
    
    
}

module curvedTopSupport() {
    w = 5;
    rotate([0, 0, 90])
    translate([cylrad-1.5, 0, cylheight-1.0]) {
        translate([-5, -w/2, -12]) rotate([0, 12, 0]) cube([6, w, 35]);
        translate([5.9, -w/2, 20]) rotate([0, 12, 0]) cube([2, w, 7.5]);
    }
}


module final() {
    difference() {
        union() {
            curvedTop();
            curvedTopSupport();
            mainCylinder();
            prongs();
        }
        cylinder(r = cylrad - wallwidth, h = cylheight + extraHeight + 1);
        //this is very computationally expensive (read: inefficient) but I can't think of a better way to do it.
        subtractAboveCurvedTop();
    }
}

module subtractAboveCurvedTop() {
    difference() {
        curvedTopInv();
        curvedTop();
    }
}

module curvedTopInv() {
    //this is used to map out the space directly above curvedTop, in order to be able to difference with it
    //I essentially want everything above the surface of curvedTop, and this is a clumsy way to find it, but
    //it's all I could come up with
    w = 24;
    h = 50;
    translate([0, -1, 6])
    scale([1, 1, 0.85])
    for (i = [0: .1 : 9.5]) {
        translate([-w/2, -10 + i*4, cylheight + (i*i + 4)*.65]) rotate([0, 0, 0]) cube([w, 0.5, h * (.5)]);
    }
}

final();
//curvedTopInv();