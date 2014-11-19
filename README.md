robot-control
=============

Class for controlling the Machine Lab robots with ChucK.

Example code with all functions present.
 
    // importing our class (after adding it to the VM)
    Robots rob

    // plays a clapper
    rob.clap(0, 127); 
    0.25::second => now; 

    // plays break bot
    rob.drum(0, 127);
    0.25::second => now; 

    // plays mahadevi 
    rob.devi(0, 127);
    0.25::second => now; 

    // plays ganapati
    rob.gana(0, 127);
    0.25::second => now; 

    // plays jackbox guitar 
    rob.gtr(0, 127);
    0.25::second => now;

    // plays jackbox bass
    rob.bass(0, 127);
    0.25::second => now; 

    // plays jackbox percussion
    rob.perc(0, 127);
    0.25::second => now;

Will only work while connected to a Machine Lab ethernet port.
