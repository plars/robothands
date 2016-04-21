union() {
	// Device size is 144x75mm, but some padding is needed
        // Inner opening of 146x77 seems to work ok, but slightly loose
	// 1-156.7-1
	// |       |
	// 78     78
	// |       |
	// 1-156.7-1

	//base
	difference() {
		cube(size=[160,81.5,2]);
		translate([20,20,0])
			cube(size=[118,40,2]);
	}
	
	//left
	
	cube(size=[160,1,14]);
	
	//right
    difference() {
        translate([0,80.5,0])
            cube(size=[160,1,14]);
        translate([57,80.5,0])
            cube(size=[13,1,13]);
    }
	//top
    translate([0, 1, 0])
        cube(size=[1,80.5,14]);
	//bottom
	difference() {
		translate([159,1,0])
			cube(size=[1,80.5,14]);
		translate([159,34,0])
			cube(size=[1,13,14]); // cutout for usb charging
	}
	//right side servo mount
    //has to start from the bottom edge of
    //the slot because of the rotation,
    //so add 13 to the x-translate
	translate([71,81.5,0])
		rotate(180)
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
		cube(size=[1,13,14]);
		translate([14,0,0])
			cube(size=[1,13,14]);
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