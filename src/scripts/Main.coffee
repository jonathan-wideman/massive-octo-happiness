Player = require("./Player/Player").Player
Ui = require("./Ui/Ui").Ui
Level = require("./Level").Level
Room = require("./Room").Room


window.onload = ()->
    window.game = new Phaser.Game(800, 600, Phaser.CANVAS, 'game-container', gamestate)


gamestate =
    preload: ()->
        game.load.image 'player', 'assets/img/obj/player.png'
        game.load.image 'player_bullet', 'assets/img/obj/bullet.png'
        game.load.image 'pills', 'assets/img/obj/pills.png'

    update: ()->
        if game.input.keyboard.justPressed(Phaser.Keyboard.SPACEBAR, 10)
            @level.nextRoom()

        #game.physics.arcade.overlap(player, items, @collideItems, null, this)


    collideItems: (player, item)->
        item.collide(player)

    create: ()->
        @level = new Level game
        @level.showRoom(0)

        game.physics.startSystem Phaser.Physics.ARCADE

        window.player = new Player(game)

        game.physics.enable player, Phaser.Physics.ARCADE

        window.ui = new Ui(game, player)

