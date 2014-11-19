
Quneo q;
Robots rob;

while( true ) {
    
    <<< q.pad[0] >>>;
    
    if( q.pad[0] ) {
        rob.gana( 1, 127 );
    }
    
    100::ms => now;
}