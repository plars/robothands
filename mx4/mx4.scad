union() {
	// Device size is 144x75mm, but some padding is needed
        // Inner opening of 146x77 seems to work ok, but slightly loose
	// 1-146-1
	// |     |
	// 77    77
	// |     |
	// 1-146-1

	//base
	difference() {
		cube(size=[148,79,2]);
		translate([20,20,0])
			cube(size=[108,39,2]);
	}
	
	//left
	difference() {
		cube(size=[148,1,14]);
		translate([48,0,0])
			cube(size=[13,1,14]); // cutout for voldown
	}
	//right
	translate([0,78,0])
		cube(size=[148,1,14]); // fill in the corner
	//top
	difference() {
		translate([0, 1, 0])
			cube(size=[1,77,14]);
		translate([0,48,0])
			cube(size=[1,13,14]); // cutout for power button
	}
	//bottom
	difference() {
		translate([147,1,0])
			cube(size=[1,77,14]);
		translate([147,33,0])
			cube(size=[1,13,14]); // cutout for usb charging
	}
	//left side servo mount (volume down button)
	translate([47,0,0])
		servo_mount();
	//top side servo mount (power button)
	translate([0,62,0])
		rotate(-90)
			servo_mount();
	
}

module servo_mount() {
	// Start from edge of hole that is 13 wide,
	// the edge *opposite* the servo mount

	// This section makes the hole for the slider to 
	// push the button, thus everything is translated
	translate([0,-12,0]) {
		// short base to connect to servo mount
		cube(size=[39,12,2]);
		// slide sides
		cube(size=[1,12,14]);
		translate([14,0,0])
			cube(size=[1,12,14]);
		translate([15,0,0])
			cube(size=[2,1,14]);
		//top
		translate([0,0,13])
			cube(size=[15,13,1]);

		// This section is just the servo mount by itself
		//base
		difference() {
			translate([17,-13,0])
				cube(size=[22,13,2]);
			translate([18,-13,0])
				cube(size=[3.5,13,2]);
		}
		translate([17,-13,0])
			cube(size=[1,13,5]);
		translate([21.5,-13,0])
			cube(size=[1,13,5]);
		translate([31,-13,0])
			cube(size=[1,13,5]);
		//side walls
		translate([17,0,0])
			cube(size=[22,1,15]);
		translate([17,-14,0])
			cube(size=[22,1,15]);
		//back wall
		translate([38,-14,0])
			cube(size=[1,14,15]);
	}
}