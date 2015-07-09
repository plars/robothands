Robot Hands
###########

Robot Hands is a project for storing 3d models used to mechanically push
buttons on phones for automated device testing and recovery.

Building
--------

Openscad can be used to preview and export .stl files for 3d printing
from the GUI.  To do it from the command line, use::

    $ openscad -o output.stl filename.scad

Printing
--------

So far, I have only tested printing these on a DaVinci 1.0 printer.
Recommended settings are::

    Infill: 50%
    Speed: normal
    Layer height: 0.2
    Supports: low

