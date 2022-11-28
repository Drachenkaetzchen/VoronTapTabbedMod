/**
 * This is an unpolished OpenSCAD Hack which takes the PCB mount and moves
 * the mounting posts so that either tabbed variant of the sensor fits.
*/

/**
 * Set to true if you want to use a sensor with a left tab
 */
 
leftTab = false;

/**
 * Set to true if you want to use a sensor with a left tab
 */

rightTab = true;

/**
  * The input filename. Note that the RC1 files are named wrong, Wired is actually
  * the PCB variant and vice versa.
  */
inputFilename = "Tap_Upper_PCB_r1.stl";


/**
 * Import position definitions. This needs to be adjusted whenever the source
 * STL file position changes.
 *
 * Alignment rules:
 * - Align X=0 to be in the center of the model
 * - Align Y=0 that it is right on the front of the mounting posts
 * - Align Z=0 that it is on the bottom of the model
 */
ImportPosition = [-181.75,-138.22,0];
ImportRotation = [0,0,180];


/**
 * Internal variables. Don't touch, they're a mess.
 */
downwardDistance = 2.7;

topBarHeight = 15.61;



leftTabPosition = [-12,0,topBarHeight-downwardDistance];
rightTabPosition = [12-6.05,0,topBarHeight-downwardDistance];

cutoutCubeDimensionX = 6.05;
cutoutCubeDimensionY = 6.05;
cutoutCubeDimensionZ = downwardDistance;

translate([0,0,-downwardDistance]) {
    
    translate([0,0,0])
    intersectOriginalTop();
}
    
    difference() {
        ImportAndAlignModel();

        if (leftTab) {
            translate(leftTabPosition - [0,0,cutoutCubeDimensionZ]) {
                cube([cutoutCubeDimensionX,6.05,cutoutCubeDimensionZ+topBarHeight]);
            }
        }
        
        if(rightTab) {
            translate(rightTabPosition - [0,0,cutoutCubeDimensionZ]) {
                cube([cutoutCubeDimensionX,6.05,cutoutCubeDimensionZ+topBarHeight]);
            }
        }
    }


module intersectOriginalTop () {
    intersection() {
        ImportAndAlignModel();

        union () {
        if (leftTab) {
            translate(leftTabPosition) {
                cube([6.05,6.05,downwardDistance]);
            }
        }
        
        if (rightTab) {
            translate(rightTabPosition) {
                cube([6.05,6.05,downwardDistance]);
            }
        }
    }
    }
}

module ImportAndAlignModel () {
    rotate(ImportRotation) {
        translate(ImportPosition) {
            import(inputFilename);
        }
    }
}