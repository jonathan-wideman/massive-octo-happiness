Player = require("./Player/Player").Player
Ui = require("./Ui/Ui").Ui

window.onload = ()->
    window.game = new Phaser.Game(800, 600, Phaser.CANVAS, 'game-container', gamestate);


gamestate =
    preload: ()->
        game.load.image 'player', 'assets/img/obj/player.png'
        game.load.image 'player_bullet', 'assets/img/obj/bullet.png'

    create: ()->
        game.physics.startSystem Phaser.Physics.ARCADE

        window.player = new Player(game)
        game.add.existing player
        game.add.existing player.gun

        game.physics.enable player, Phaser.Physics.ARCADE

        new Ui(game, player)

