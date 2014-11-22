Player = require("./Player/Player").Player


window.onload = ()->
    window.game = new Phaser.Game(800, 600, Phaser.CANVAS, 'game-container', gamestate);


gamestate =
    preload: ()->
        #game.load.spritesheet('player', 'assets/img/dude.png', 32, 48);
        game.load.image('phaser', 'assets/img/phaser.png');
        game.load.image('player', 'assets/img/obj/player.png');

    create: ()->
        game.physics.startSystem(Phaser.Physics.ARCADE);
        #game.add.sprite(0, 0, 'phaser');
        window.player = new Player(game)
        game.add.existing(player)
        game.physics.enable(player, Phaser.Physics.ARCADE)

