linear_extrude(twist = -360) latt();
linear_extrude(twist = 360) latt();

module latt()
{
	translate([-5, -6, 0])
		{  //hexagon of points (circles)
			circle(r = 1);
			translate([10, 0, 0]) circle(r = 1);
			translate([-3, 10, 0]) circle(r = 1);
			translate([13, 10, 0]) circle(r = 1);
			translate([5, 15, 0]) circle(r = 1);
		}
}