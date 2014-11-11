console.log "hi"


window.onload = ()->

    preload = ()->
        game.load.image('phaser', 'phaser.png');

    create = ()->
        game.add.sprite(0, 0, 'phaser');

    window.game = new Phaser.Game(800, 600, Phaser.CANVAS, 'game-container', { preload: preload, create: create });
