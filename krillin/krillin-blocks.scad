cube(size=[12.5, 18, 8]);

translate([40,0,0])
    union() {
        translate([0,10,0])
            cube(size=[12.5,29,8]);
        difference() {
            translate([-3.5,0,0])
                cube(size=[19.5,15,8]);
            translate([-.5,0,0])
                cube(size=[13.5,10,8]);
        }           
    }