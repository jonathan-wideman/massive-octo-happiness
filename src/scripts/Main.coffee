Player = require("./Player/Player").Player
Ui = require("./Ui/Ui").Ui
Level = require("./Level").Level
Room = require("./Room").Room


window.onload = ()->
    window.game = new Phaser.Game(800, 600, Phaser.CANVAS, 'game-container', gamestate)


gamestate =
    preload: ()->
        @level = new Level game

        game.load.image 'player', 'assets/img/obj/player.png'
        game.load.image 'player_bullet', 'assets/img/obj/bullet.png'

    update: ()->
        if game.input.keyboard.justPressed(Phaser.Keyboard.SPACEBAR, 10)
            @level.nextRoom()

    create: ()->
        @level.showRoom(0)

        game.physics.startSystem Phaser.Physics.ARCADE

        window.player = new Player(game)
        game.add.existing player
        game.add.existing player.gun

        game.physics.enable player, Phaser.Physics.ARCADE

        new Ui(game, player)

