var idleOffsets = [3, 0]; // Idle offsets
var leftOffsets = [85, -10];
var downOffsets = [84, -80];
var upOffsets = [21, 27];
var rightOffsets = [-48, 2];

// Animation names
var idleXmlName = 'sing_idle0';
var leftXmlName = 'sing_left0';
var downXmlName = 'sing_down0';
var upXmlName = 'sing_up0';
var rightXmlName = 'sing_right0';

// Character properties
var xPosition = -100;
var yPosition = 200;
var xScale = 1;
var yScale = 1;
var invisible = false;
var nameOfCharacterXml = '2Dean_sing';
var nameOfCharacter = '2Dean_sing';
var nameOfNoteType = '2Dean';
var foreground = true;
var playableCharacter = false;

var doIdle = true;

function onCreate() {
    var charSprite = FlxSprite.fromGraphic(Assets.getPath('characters/' + nameOfCharacterXml));
    charSprite.x = xPosition;
    charSprite.y = yPosition;
    charSprite.scale.set(xScale, yScale);
    
    charSprite.animation.addByPrefix('idle', idleXmlName, 24, true);
    charSprite.animation.addByPrefix('singLEFT', leftXmlName, 24, false);
    charSprite.animation.addByPrefix('singDOWN', downXmlName, 24, false);
    charSprite.animation.addByPrefix('singUP', upXmlName, 24, false);
    charSprite.animation.addByPrefix('singRIGHT', rightXmlName, 24, false);
    
    if (playableCharacter) {
        charSprite.flipX = true;
    }
    
    if (invisible) {
        charSprite.alpha = 0;
    }
    
    add(charSprite, foreground);
    charSprite.animation.play('idle');
}

function opponentNoteHit(id, direction, noteType, isSustainNote) {
    if (noteType == nameOfNoteType) {
        doIdle = false;
        var anims = ['singLEFT', 'singDOWN', 'singUP', 'singRIGHT'];
        var offsets = [leftOffsets, downOffsets, upOffsets, rightOffsets];
        var currentOffset = offsets[direction];
        
        charSprite.animation.play(anims[direction]);
        charSprite.offset.set(currentOffset[0], currentOffset[1]);
    }
}

function onBeatHit() {
    if (curBeat % 2 == 0 && doIdle) {
        charSprite.animation.play('idle');
        charSprite.offset.set(idleOffsets[0], idleOffsets[1]);
    }
    doIdle = true;
}

function onCountdownTick(counter) {
    if (counter % 2 == 0 && doIdle) {
        charSprite.animation.play('idle');
        charSprite.offset.set(idleOffsets[0], idleOffsets[1]);
    }
}