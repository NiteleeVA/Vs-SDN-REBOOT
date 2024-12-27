var IntroTextSize = 25;
var IntroSubTextSize = 40;
var IntroSubText2Size = 24;
var IntroTagColor = 0x71ECEE; // Color in hexadecimal
var IntroTagWidth = 30;

function onCreate() {
    var jukeboxTag = FlxSprite.fromGraphic(Assets.getPath('empty'));
    jukeboxTag.makeGraphic(300 + IntroTagWidth, 90, IntroTagColor);
    jukeboxTag.x = -305 - IntroTagWidth;
    jukeboxTag.y = 200;
    jukeboxTag.scrollFactor.set(0, 0);
    jukeboxTag.set_cameras([FlxG.camera]);
    add(jukeboxTag);

    var jukebox = FlxSprite.fromGraphic(Assets.getPath('empty'));
    jukebox.makeGraphic(300, 90, 0x000000);
    jukebox.x = -305 - IntroTagWidth;
    jukebox.y = 200;
    jukebox.scrollFactor.set(0, 0);
    jukebox.set_cameras([FlxG.camera]);
    add(jukebox);

    var jukeboxSubText = FlxText(300, 220, 300, "Doppelganger");
    jukeboxSubText.setFormat(null, IntroSubTextSize, FlxG.WHITE, 'left');
    jukeboxSubText.scrollFactor.set(0, 0);
    add(jukeboxSubText);

    var jukeboxSubText2 = FlxText(300, 260, 300, "NiteleeVA");
    jukeboxSubText2.setFormat(null, IntroSubText2Size, FlxG.WHITE, 'left');
    jukeboxSubText2.scrollFactor.set(0, 0);
    add(jukeboxSubText2);
}

function onSongStart() {
    FlxTween.tween(jukeboxTag, { x: 0 }, 1, { ease: FlxEase.circInOut });
    FlxTween.tween(jukebox, { x: 0 }, 1, { ease: FlxEase.circInOut });
    FlxTween.tween(jukeboxSubText, { x: 0 }, 1, { ease: FlxEase.circInOut });
    FlxTween.tween(jukeboxSubText2, { x: 0 }, 1, { ease: FlxEase.circInOut });

    TimerManager.add(3, () -> onJukeboxTimerComplete());
}

function onJukeboxTimerComplete() {
    FlxTween.tween(jukeboxTag, { x: -450 }, 1.5, { ease: FlxEase.circInOut });
    FlxTween.tween(jukebox, { x: -450 }, 1.5, { ease: FlxEase.circInOut });
    FlxTween.tween(jukeboxSubText, { x: -450 }, 1.5, { ease: FlxEase.circInOut });
    FlxTween.tween(jukeboxSubText2, { x: -450 }, 1.5, { ease: FlxEase.circInOut });
}