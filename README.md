# 1DFlashQuantumTunneling
1DFlashQuantumTunneling Alchitry Code
SUTD 50.002 Computational Structures 1D Project 
Group Members consist of: Toh Kai Feng, Amrish Dev Sandhu, Seah Qi Yan, Ong Kah Yuan Joel, Bryan Phengan Hengardi

The premise of the game is simple. You’re a dot. Always have been. You’re blue in colour and exist in a 1-dimensional world, a single axis to traverse. And so, backward and forward you go on your merry way. 

But you’re not alone. There are others along the path too. And they’re in your way. They’re angry and red, and they’ll kill you and take away one (of your three) lives. Fortunately for you, they blink. Or flash, if you’d prefer. That’ll allow you to get past them. 

You’ve gotta escape. Gotta get to the top of the LED strip. But first, you’ll have to get past 3 waves of angry dots of increasing difficulty. Will you make it? That’s up to you. Godspeed, Soldier. 

(In a 1-Dimensional plane, the player (the blue LED) will have to reach the end of the strip while avoiding the enemies (the red LEDs). The enemies will flash periodically, creating a path for the player to move forward. By pressing on the buttons, the player can either move forward or backwards. With three lives, (the red LEDs on the left of the strip) the player has to clear three levels (the green LEDs on the right of the strip). Our game utilises collision detection by constantly checking on the state of the Enemy LED, Enemy position, Player Position relative to each other and on the LED strip. We stored the state and location of each enemy within one 16 register - the most significant bit stores/encodes the state "ON" or "OFF". The last 5 bits stores/encodes the location of the enemies on a 32bit long LED strip. Checking of collision between player and enemy is performed by an CMPEQ operation in the ALU, and would only return true if an enemy's state is 'On' and has the same location as the player. This is achieved by fixing the player's state to be always 'ON', while toggling the states of the enemies 'ON' and 'OFF' at designated intervals. Similarly, the enemies' locations are fixed while the player's location can increase or decrease with button inputs.)


