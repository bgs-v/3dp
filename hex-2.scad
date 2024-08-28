difference() {
	for ( i = [0 : 1 : 12])
	{
	    rotate(i * 4, [0, 0, i])
	    translate([0, 0, i*.5])
	    cylinder(h = .5, r=10, $fn = 6, center = true);
	}

	for ( i = [0 : 1 : 12])
	{
	    rotate(i * 4, [0, 0, i])
	    translate([0, 0, i*.5])
	    cylinder(h = .51, r=9.5, $fn = 6, center = true);
	}

}
