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
    "/drumBot" 0-1, 3, 5-9, 11-12
    "/devibot"
    "/ganapati"
    "/clappers"
    "/jackguitar"
    "/jackbass"
    "/jackperc"
    */

    // 0-4, 14, 16-17
    fun void clappers(int num, int vel) {
        note("/clappers", num, vel);
    }

    fun void drum(int num, int vel) {
        note("/drumBot", num, vel);
    }

    // 0-1, 4-8, 10 -11
    fun void devi(int num, int vel) {
        note("/devibot", num, vel); 
    }


}

Robots rob;

while (true) {
    rob.clappers(20, 127);

    1::second => now;
}
