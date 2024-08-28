//author: brandon sharp
//date: 2024 august 28
//purpose: bed leveling 3d ender pro
h = .1;
sqw = .1;
w = 140;
//i = 2;
for ( i = [10 : 20 : w]) {
    //cube params: [w, d, h]
    difference() {
        translate([-i/2, -i/2, 0]) cube([i , i , h]);
        translate([-(i - sqw)/2, -(i - sqw)/2, 0]) cube([i - sqw , i - sqw, h]);
    }   
}