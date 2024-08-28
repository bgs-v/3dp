// File: beam.scad
// Author: K R Sloan
// Last Modified: 30 October 2014
// Purpose: define a "beam"
//          this is a simple minded cylinder with spherical endcaps
//          to do something different, change it!
module beam(h=1.0, r=1.0)
{

 cylinder(h=h,r=r);
 sphere(r=r);
 translate([0,0,h])
  sphere(r=r);
}
