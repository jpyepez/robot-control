// Robots.ck

class Robots {
    
    OscOut out;
    
    // fibonacci port number
    ("chuckServer.local", 11235) => out.dest;
    
    // 
    fun void note(string addr, int num, int vel) {
        out.start(addr);
        out.add(num);
        out.add(vel);
        out.send();
    }
    
    /* osc addresses
    "/drumBot" 0-1, 3, 5-9, 11-12
    "/devibot"
    "/ganapati"
    "/clappers"
    "/jackguitar"
    "/jackbass"
    "/jackperc"
    */
    
    // 0-1, 4-8, 10 -11
    fun void devi(int num, int vel) {
        note("/devibot", num, vel); 
    }
}

Robots rob;

while (true) {
    rob.note("/drumBot", 4, 127);
    
    1::second => now;
}
