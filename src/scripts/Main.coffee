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

        game.load.image('map_tiles', 'assets/img/ui/mapTiles.png');


    update: ()->
        if game.input.keyboard.justPressed(Phaser.Keyboard.SPACEBAR, 10)
            @level.nextRoom()

        if game.input.keyboard.justPressed(Phaser.Keyboard.ENTER, 10)
            @ui.toggleMap()


    create: ()->
        game.stage.backgroundColor = '#2d2d2d';

        @level = new Level game
        @level.showRoom(0)

        game.physics.startSystem Phaser.Physics.ARCADE

        window.player = new Player(game)

        game.physics.enable player, Phaser.Physics.ARCADE

        @ui = new Ui(game, player)
        window.ui = @ui
        @ui.addMap @level.layoutLayer

