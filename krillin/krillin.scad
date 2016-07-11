union() {
	// Device size and layout:
	// 1-135-1
	// |     |
	// 69    69
	// |     |
	// 1-135-1
   // XXX: I'm adding an extra mm on each side to account
	// for the 1mm sides actually coming out closer to 1.5mm

	//base
	difference() {
		cube(size=[139,73,2]);
		translate([13,14,0])
			cube(size=[113,44,2]);
	}
	
	//left
	cube(size=[138,2,14]);
	//right
	difference() {
		translate([0,71,0])
			cube(size=[138,2,14]); // fill in the corner
		translate([15,71,0])
			cube(size=[13,2,14]); // cutout for voldown
		translate([35.5,71,0])
			cube(size=[20,2,14]); // cutout for voldown
	}
	//top
	translate([0, 0, 0])
		cube(size=[2,73,14]);
	//bottom
	difference() {
		translate([137,0,0])
			cube(size=[2,73,14]);
		translate([137,30,0])
			cube(size=[2,13,14]); // cutout for usb charging
	}
	//right side servo mount (power button)
	translate([29,73,0])
		rotate(180)
			servo_mount();
	//right side servo mount (volume buttons)
	translate([53,94,0])
		rotate(180)
			servo_mount();
	//Connect the volume servo base back to the rest
	translate([12,72,0])
		cube(size=[45.5,26,2]);
	//short slide next to the frame for alignment
	translate([38.5,72,0]) {
		// slide sides
        translate([-5,0,0])
            cube(size=[2,13,14]);
		translate([17,0,0])
			cube(size=[2,13,14]);
	}

}

module servo_mount() {
	// Start from edge of hole that is 13 wide,
	// the edge *opposite* the servo mount

	// This section makes the hole for the slider to 
	// push the button, thus everything is translated
	translate([0,-12,0]) {
		// short base to connect to servo mount
		cube(size=[39,13,2]);
		// slide sides
        translate([-1,0,0])
            cube(size=[2,14,14]);
		translate([14,0,0])
			cube(size=[2,14,14]);
		translate([15,0,0])
			cube(size=[2,1,14]);
		//top
		translate([0,0,13])
			cube(size=[15,14,1]);

		// This section is just the servo mount by itself
		//base
		difference() {
			translate([17,-13,0])
				cube(size=[22,13,2]);
			translate([18.5,-13,0])
				cube(size=[3,13,2]);
		}
		translate([16.5,-13,0])
			cube(size=[2,13,5]);
		translate([21.5,-13,0])
			cube(size=[2,13,5]);
		translate([31,-13,0])
			cube(size=[2,13,5]);
		//side walls
		translate([16,0,0])
			cube(size=[23,2,14]);
		translate([16.5,-14.5,0])
			cube(size=[22.5,2,14]);
		//back wall
		translate([37,-14.5,0])
			cube(size=[2,16.5,14]);
	}
}