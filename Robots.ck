// Robots.ck

public class Robots {

    OscOut out;
    
    // fibonacci port number
    ("chuckServer.local", 11235) => out.dest;

    fun void note(string addr, int num, int vel) {
        out.start(addr);
        out.add(num);
        out.add(vel);
        out.send();
    }
    
    /* osc addresses
    "/drumBot" 
    "/devibot"
    "/ganapati"
    "/clappers"
    "/jackgtr"
    "/jackbass"
    "/jackperc"
    */

    // 0-18
    fun void bass(int num, int vel) {
        note("/jackbass", num, vel);
    }
    
    // 0-4, 14, 16-17
    fun void clappers(int num, int vel) {
        note("/clappers", num, vel);
    }
    
    // 0-1, 3, 5-9, 11-12
    fun void drum(int num, int vel) {
        note("/drumBot", num, vel);
    }
    
    // 0-1, 4-8, 10 -11
    fun void devi(int num, int vel) {
        note("/devibot", num, vel); 
    }
    
    // 1-3, 6-8
    fun void gana(int num, int vel) {
        note("/ganapati", num, vel); 
    }
    
    // 0-33
    fun void gtr(int num, int vel) {
        note("/jackgtr", num, vel);
    }
    
    // 1-7
    fun void perc(int num, int vel) {
        note("/jackperc", num, vel);
    }
    
}

Robots rob;

while (true) {
    rob.gtr(31, 127);
    
    1::second => now;
}
