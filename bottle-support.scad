//diameter: .76in 19.4mm
//wall diam: 1.2mm
//prong width 4.7mm

//date: 2024 september 24
//purpose: replace broken bottle steamer part

//cylinder with cutout
//curved 'finger' to hold bottles
//prongs on the bottom to snap into the warmer
$fn=200;
cylheight = 51.7;
cyldiam = 19.6;
wallwidth = 1.2;
//cylinder(r = cyldiam, h = cylheight)
module mainCylinder()
{
    difference()
    {
        cylinder(r = cyldiam, h = cylheight);
        cylinder(r = cyldiam - wallwidth, h = cylheight );
    };
}

//mirror/rotate this to either side
module prong() {
    //TODO:
}

module curvedTop() {
    //TODO:
}


module final() {
    union() {
        mainCylinder();
        //TODO:
    }
}

final();