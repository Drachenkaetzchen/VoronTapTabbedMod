# TabbedOpticalPCB Mod

This mod allows the use of tabbed sensors with the PCB. Example part numbers:

* Optek OPB960L51 (Tested, requires left variant)
* Optek OPB961P51


## Background

Due to supply chain issues, you may find it difficult to find the non-tabbed versions of the recommended sensors. This mod changes the original STL file to make space for sensors with a tab on the left, right or both sides.

The OpenSCAD file is included, which chops the mounting posts off accordingly. Note that it is a hack, but due to the lack of Fusion360 skills I decided to use OpenSCAD. Whenever the position or rotation in the source file changes, you need to adjust the import positions in the OpenSCAD file.