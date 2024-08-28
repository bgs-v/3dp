// File: Beams.scad
// Author: K R Sloan
// Last Modified: 30 October 2014
// Purpose: create objects out of "beams"
//
// beam.scad defines a "beam"
// for a different style, change beam.scad
// probably, maintain several alternatives, and swap in as needed
use <beam.scad>


function L2squared(a,b) = pow(b[0]-a[0],2)+pow(b[1]-a[1],2)+pow(b[2]-a[2],2);
function L2(a,b) = sqrt(L2squared(a,b));
function angleAboutY(a,b) = atan2(sqrt(L2squared(a,b)-pow(b[2]-a[2],2)), b[2]-a[2]);
//function angleAboutY(a,b) = atan2(L2squared(a,b)-pow(b[2]-a[2],2), b[2]-a[2]);
function angleAboutZ(a,b) = atan2(b[1]-a[1], b[0]-a[0]);

// 
// beam(h=<height>,r=<radius>) produces a beam of height <height> and radius <radius>
//
// just like "cylinder" (but perhaps much more complex)
//
// our job is to create and position a beam so that it starts at [x0,y0,z0]
//  and ends at [x1,y1,z1]

module position_beam(a=[0,0,0], b=[1,2,3], radius=1.0)
{
echo(L2squared(a,b));
echo(angleAboutY(a,b));
echo(angleAboutZ(a,b));

echo(L2squared(a,b));

echo(pow(b[2]-a[2],2));
 translate(a)
  rotate([0,0,angleAboutZ(a,b)])
   rotate([0,angleAboutY(a,b),0])
     beam(h=L2(a,b),r=radius);
}

// sample usage - a cube

r = 0.5;
position_beam(a=[ 0, 0, 0],b=[ 0, 0,10],radius=r);
position_beam(a=[ 0, 0,10],b=[ 0,10,10],radius=r);
position_beam(a=[ 0,10,10],b=[ 0,10, 0],radius=r);
position_beam(a=[ 0,10, 0],b=[ 0, 0, 0],radius=r);

position_beam(a=[10, 0, 0],b=[10, 0,10],radius=r);
position_beam(a=[10, 0,10],b=[10,10,10],radius=r);
position_beam(a=[10,10,10],b=[10,10, 0],radius=r);
position_beam(a=[10,10, 0],b=[10, 0, 0],radius=r);

position_beam(a=[ 0, 0, 0],b=[10, 0, 0],radius=r);
position_beam(a=[ 0, 0,10],b=[10, 0,10],radius=r);
position_beam(a=[ 0,10,10],b=[10,10,10],radius=r);
position_beam(a=[ 0,10, 0],b=[10,10, 0],radius=r);

