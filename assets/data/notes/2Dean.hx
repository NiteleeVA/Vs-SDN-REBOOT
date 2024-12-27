function onCreate() {
    // Iterate over all notes
    for (i in 0...game.unspawnNotes.length) {
        if (game.unspawnNotes[i].noteType == "2Dean") { // Check if the note type matches "2Dean"
            // Change the texture of the note
            game.unspawnNotes[i].texture = Paths.image("sdn");
            
            // Uncomment the following lines if needed to customize splash effects
            // game.unspawnNotes[i].noteSplashHue = 0;
            // game.unspawnNotes[i].noteSplashSat = -20;
            // game.unspawnNotes[i].noteSplashBrt = 1;

            // Disable the default singing animation
            game.unspawnNotes[i].noAnimation = true;

            if (game.unspawnNotes[i].mustPress) { // Ensure it affects only player notes
                game.unspawnNotes[i].ignoreNote = true; // Make missing these notes penalize the player
            }
        }
    }
}