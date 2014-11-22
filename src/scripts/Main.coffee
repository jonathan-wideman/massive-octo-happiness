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
        game.load.image('youAreHere', 'assets/img/ui/youAreHere.png');


    update: ()->
        if game.input.keyboard.justPressed(Phaser.Keyboard.SPACEBAR, 10)
            @level.nextRoom()

        if game.input.keyboard.justPressed(Phaser.Keyboard.ENTER, 10)
            @ui.toggleMap()

        if @player.y < game.world.bounds.y
            # console.log 'north'
            @level.travel 'north'
            @player.y = game.world.bounds.height - @player.height
        else if @player.y > game.world.bounds.y + game.world.bounds.height
            # console.log 'south'
            @level.travel 'south'
            @player.y = game.world.bounds.y
        else if @player.x < game.world.bounds.x
            # console.log 'west'
            @level.travel 'west'
            @player.x = game.world.bounds.width - @player.width
        else if @player.x > game.world.bounds.x + game.world.bounds.width
            # console.log 'east'
            @level.travel 'east'
            @player.x = game.world.bounds.x



    create: ()->
        game.stage.backgroundColor = '#2d2d2d';

        @level = new Level game
        window.level = @level
        @level.showRoom(0)

        game.physics.startSystem Phaser.Physics.ARCADE

        @player = new Player(game)
        window.player = @player

        game.physics.enable player, Phaser.Physics.ARCADE

        @ui = new Ui(game, player)
        window.ui = @ui
        @ui.addMap @level.layoutLayer

        console.log game.world.bounds
