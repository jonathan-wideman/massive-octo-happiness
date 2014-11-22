Player = require("./Player").Player


window.onload = ()->
    window.game = new Phaser.Game(800, 600, Phaser.CANVAS, 'game-container', gamestate);


gamestate =
    preload: ()->
        console.log(new Player)
        game.load.image('phaser', 'assets/img/phaser.png');

    create: ()->
        game.add.sprite(0, 0, 'phaser');

