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
        if (Math.random2(0, 127) <= q.fader) {
            rob.clap(which, Math.random2(0, 127));
        }
        Math.random2(10, 1000)::ms => now;
    }
}


// drumBot function to be sporked in allPlay
fun void allDrum(int which) {
    while (true) {
        if (Math.random2(0,127) <= q.fader) {
            rob.drum(which, Math.random2(0,127));
        }
        Math.random2(10, 1000)::ms => now;
    }
}


// devi function to be sporked in allPlay
fun void allDevi(int which) {
    while (true) {
        if (Math.random2(0,127) <= q.fader) {
            rob.devi(which, Math.random2(0,127));
        }
        Math.random2(10, 1000)::ms => now;
    }
}


// gana function to be sporked in allPlay
fun void allGana(int which) {
    while (true) {
        if (Math.random2(0,127) <= q.fader) {
            rob.gana(which, Math.random2(0,127));
        }
        Math.random2(10, 1000)::ms => now;
    }
}

// jackperc function to be sporked in allPlay
fun void allPerc(int which) {
    while (true) {
        if (Math.random2(0,127) <= q.fader) {
            rob.perc(which, Math.random2(0,127));
        }
        Math.random2(10, 1000)::ms => now;
    }
}


// spork allplay function
spork ~ allPlay();



// function to play clappers randomly using slider[0]
fun void clapPlay(int which) {
    while (true) {
        if (Math.random2(0, 127) <= q.slider[0]) {
            rob.clap(which, Math.random2(0, 127));
        }
        Math.random2(10, 1000)::ms => now;
    }
}

// spork clapPlay
for (int i; i < clap.cap(); i++) {
    spork ~ clapPlay(i);
}


// function to play drumBot randomly using slider[1]
fun void drumPlay(int which) {
    while (true) {
        if (Math.random2(0,127) <= q.slider[1]) {
            rob.drum(which, Math.random2(0,127));
        }
        Math.random2(10, 1000)::ms => now;
    }
}

// spork drumPlay
for (int i; i < drum.cap(); i++) {
    spork ~ drumPlay(i);
}


// function to play deviBot randomly using slider[2]
fun void deviPlay(int which) {
    while (true) {
        if (Math.random2(0,127) <= q.slider[2]) {
            rob.devi(which, Math.random2(0,127));
        }
        Math.random2(10, 1000)::ms => now;
    }
}

// spork deviPlay
for (int i; i < devi.cap(); i++) {
    spork ~ deviPlay(i);
}


// function to play ganaBot randomly using slider[3]
fun void ganaPlay(int which) {
    while (true) {
        if (Math.random2(0,127) <= q.slider[3]) {
            rob.gana(which, Math.random2(0,127));
        }
        Math.random2(10, 1000)::ms => now;
    }
}

// spork ganaPlay
for (int i; i < gana.cap(); i++) {
    spork ~ ganaPlay(i);
}


// function to play jackperc randomly using slider[6]
fun void percPlay(int which) {
    while (true) {
        if (Math.random2(0,127) <= q.slider[6]) {
            rob.perc(which, Math.random2(0,127));
        }
        Math.random2(10, 1000)::ms => now;
    }
}

// spork percPlay
for (int i; i < perc.cap(); i++) {
    spork ~ percPlay(i);
}


// main program
while( true ) {
    
    
    10::ms => now;
}


