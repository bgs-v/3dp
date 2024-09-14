//date: 2024 september 13
//purpose: confirm units of printed versions of openscad -> stl models
h = 5;
sqw = 5; // .5 cm thickness
w = 140;
i = 10;
//for ( i = [10 : 20 : w]) {
    //cube params: [w, d, h]
    difference() {
        translate([-i/2, -i/2, 0]) cube([i , i , h]);
        translate([-(i - sqw)/2, -(i - sqw)/2, 0]) cube([i - sqw , i - sqw, h]);
    }   
//}