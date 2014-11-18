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

    /* osc address
    "/drumBot"
    "/mahadevi"
    "/ganapati"
    "/clappers"
    "/jackguitar"
    "/jackbass"
    "/jackperc"
    */
}

Robots rob;

while (true) {
    rob.note("/drumBot", 0, 127);
    1::second => now;
}
