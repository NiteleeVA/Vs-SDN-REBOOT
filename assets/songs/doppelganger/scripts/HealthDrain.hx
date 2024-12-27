function opponentNoteHit() {
    var health = getProperty('health');
    if (health > 0.3) {
        setProperty('health', health - 0.01);
    }
}