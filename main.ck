// main.ck

Quneo q;
Robots rob;

[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
21, 22, 23] @=> int bass[];

[0, 1, 2, 3, 4, 14, 16, 17] @=> int clap[];

[0, 1, 3, 5, 6, 7, 8, 9, 11, 12] @=> int drum[];

[0, 1, 4, 5, 6, 7, 8, 10, 11] @=> int devi[];

[1, 2, 3, 6, 7, 8] @=> int gana[];

[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
11, 12, 13, 14, 15, 16, 17, 18, 19,
20, 21, 22, 23, 24, 25, 26, 27, 28,
29, 30, 31, 32, 33] @=> int gtr[];

[0, 1, 2, 3, 4, 5, 6, 7] @=> int perc[];

// plays all the robots controlled by the main fader
fun void allPlay() {
    for (int i; i < clap.cap(); i++) {
        spork ~ allClap(i);
    }
    
    for (int i; i < drum.cap(); i++) {
        spork ~ allDrum(i);
    }
    
    for (int i; i < devi.cap(); i++) {
        spork ~ allDevi(i);
    }
    
    for (int i; i < gana.cap(); i++) {
        spork ~ allGana(i);
    }
    
    for (int i; i < perc.cap(); i++) {
        spork ~ allPerc(i);
    }
    
    while (true){
        1::second => now;
    }    
}


// clappers function to be sporked in allPlay
fun void allClap(int which) {
    while (true) {
        if (Math.random2(4, 127) <= q.fader) {
            rob.clap(which, Math.random2(0, 127));
        }
        Math.random2(100, 1000)::ms => now;
    }
}


// drumBot function to be sporked in allPlay
fun void allDrum(int which) {
    while (true) {
        if (Math.random2(4,127) <= q.fader) {
            rob.drum(which, Math.random2(0,127));
        }
        Math.random2(100, 1000)::ms => now;
    }
}


// devi function to be sporked in allPlay
fun void allDevi(int which) {
    while (true) {
        if (Math.random2(4,127) <= q.fader) {
            rob.devi(which, Math.random2(0,127));
        }
        Math.random2(100, 1000)::ms => now;
    }
}


// gana function to be sporked in allPlay
fun void allGana(int which) {
    while (true) {
        if (Math.random2(4,127) <= q.fader) {
            rob.gana(which, Math.random2(0,127));
        }
        Math.random2(100, 1000)::ms => now;
    }
}

// jackperc function to be sporked in allPlay
fun void allPerc(int which) {
    while (true) {
        if (Math.random2(4,127) <= q.fader) {
            rob.perc(which, Math.random2(0,127));
        }
        Math.random2(100, 1000)::ms => now;
    }
}


// spork allplay function
spork ~ allPlay();



// function to play clappers randomly using slider[0]
fun void clapPlay(int which) {
    while (true) {
        if (Math.random2(4, 127) <= q.slider[0]) {
            rob.clap(which, Math.random2(0, 127));
        }
        Math.random2(100, 1000)::ms => now;
    }
}

// spork clapPlay
for (int i; i < clap.cap(); i++) {
    spork ~ clapPlay(i);
}


// function to play drumBot randomly using slider[1]
fun void drumPlay(int which) {
    while (true) {
        if (Math.random2(4,127) <= q.slider[1]) {
            rob.drum(which, Math.random2(0,127));
        }
        Math.random2(100, 1000)::ms => now;
    }
}

// spork drumPlay
for (int i; i < drum.cap(); i++) {
    spork ~ drumPlay(i);
}


// function to play deviBot randomly using slider[2]
fun void deviPlay(int which) {
    while (true) {
        if (Math.random2(4,127) <= q.slider[2]) {
            rob.devi(which, Math.random2(0,127));
        }
        Math.random2(100, 1000)::ms => now;
    }
}

// spork deviPlay
for (int i; i < devi.cap(); i++) {
    spork ~ deviPlay(i);
}


// function to play ganaBot randomly using slider[3]
fun void ganaPlay(int which) {
    while (true) {
        if (Math.random2(4,127) <= q.slider[3]) {
            rob.gana(which, Math.random2(0,127));
        }
        Math.random2(100, 1000)::ms => now;
    }
}

// spork ganaPlay
for (int i; i < gana.cap(); i++) {
    spork ~ ganaPlay(i);
}


// function to play jackperc randomly using slider[6]
fun void percPlay(int which) {
    while (true) {
        if (Math.random2(4,127) <= q.slider[6]) {
            rob.perc(which, Math.random2(0,127));
        }
        Math.random2(100, 1000)::ms => now;
    }
}

// spork percPlay
for (int i; i < perc.cap(); i++) {
    spork ~ percPlay(i);
}


// play random clappers using pad 14
fun void clapPad14() {
    int clapChance;
    while (true) {
        q.padOn[14] => now;
        for(0 => int i; i < clap.cap(); i++){
            Math.random2(0,1) => clapChance;
            if(clapChance) rob.clap(clap[i], q.pad[14]);
        }
    }
}

//spork clappers pad function
spork ~ clapPad14();

// play drumBot using pads 0, 4, 8 and 12 (left column)
fun void drumPad0() {
    while (true) {
        q.padOn[0] => now;
        rob.drum(drum[0], q.pad[0]);
        rob.drum(drum[1], q.pad[0]);
    }
}

fun void drumPad4() {
    while (true) {
        q.padOn[4] => now;
        rob.drum(drum[3], q.pad[4]);
    }
}

fun void drumPad8() {
    while (true) {
        q.padOn[8] => now;
        rob.drum(drum[2], q.pad[8]);
    }
}

fun void drumPad12() {
    while (true) {
        q.padOn[12] => now;
        for( 4 => int i; i < drum.cap(); i++ ) {
            rob.drum(drum[i], q.pad[12]);
        }
    }
}

// spork drumBot pad function
spork ~ drumPad0();
spork ~ drumPad4();
spork ~ drumPad8();
spork ~ drumPad12();



// play deviBot using pads 1, 5, 9 and 13 (2nd column from the left)
fun void deviPad1() {
    while (true) {
        q.padOn[1] => now;
        rob.devi(devi[0], q.pad[1]);
    }
}

fun void deviPad5() {
    while (true) {
        q.padOn[5] => now;
        rob.devi(devi[1], q.pad[5]);
        rob.devi(devi[7], q.pad[5]);
        rob.devi(devi[8], q.pad[5]);
    }

}

fun void deviPad9() {
    while (true) {
        q.padOn[9] => now;
        for( 3 => int i; i <= 6; i++){
            rob.devi(devi[i], q.pad[9]);
        }
    }
}

fun void deviPad13() {
    while (true) {
        q.padOn[13] => now;
        rob.devi(devi[2], q.pad[13]);
    }
}

// spork deviBot pad functions
spork ~ deviPad1();
spork ~ deviPad5();
spork ~ deviPad9();
spork ~ deviPad13();


// play ganaPati using pads 2, 6 and 10 (2nd column from the right)
fun void ganaPad2() {
    while (true) {
        q.padOn[2] => now;
        for( 2 => int i; i < gana.cap(); i++){
            rob.gana(gana[i], q.pad[2]);
        }
    }    
}

fun void ganaPad6() {
    while (true) {
        q.padOn[6] => now;
        rob.gana(gana[0], q.pad[6]);
    }   
}

fun void ganaPad10() {
    while (true) {
        q.padOn[10] => now;
        rob.gana(gana[1], q.pad[10]);
        rob.gana(gana[2], q.pad[10]);
    }
}

// spork ganaPati pad function
spork ~ ganaPad2();
spork ~ ganaPad6();
spork ~ ganaPad10();


// play jackPerc using pads 3, 7, 11, and 15 (right column)
fun void percPad3() {
    while (true) {
        q.padOn[3] => now;
        rob.gana(perc[7], q.pad[3]);
    }      
}

fun void percPad7() {
    while (true) {
        q.padOn[7] => now;
        rob.gana(perc[5], q.pad[7]);
        rob.gana(perc[6], q.pad[7]);
    }      
}

fun void percPad11() {
    while (true) {
        q.padOn[11] => now;
        rob.gana(perc[1], q.pad[11]);
    }      
}

fun void percPad15() {
    while (true) {
        q.padOn[15] => now;
        for( 2 => int i; i <= 4; i++ ) {
            rob.gana(perc[i], q.pad[15]);
        }
    }      
}

// spork jackPerc pad function
spork ~ percPad3();
spork ~ percPad7();
spork ~ percPad11();
spork ~ percPad15();


// test jackbass with slider 7
fun void slider7() {
    while (true) {
        if(q.slider[7]) {
            rob.bass( bass[ Math.random2( 0, bass.cap()-1 )], q.slider[7]);
        }
        .5::second => now;
    }
}

spork ~ slider7();

// test jackgtr with slider 8
fun void slider8() {
    while (true) {
        if(q.slider[8]) {
            rob.gtr( gtr[ Math.random2( 0, gtr.cap()-1 )], q.slider[8]);
        }
        .5::second => now;
    }
}

spork ~ slider8();

// main program
while( true ) second => now;


