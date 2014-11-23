Player = require("./Player/Player").Player
Ui = require("./Ui/Ui").Ui
Level = require("./Level").Level
Room = require("./Room").Room


window.onload = ()->
    window.game = new Phaser.Game(800, 600, Phaser.CANVAS, 'game-container', gamestate)


gamestate =
    preload: ()->
        game.load.image 'player', 'assets/img/obj/player.png'
        game.load.image 'gun', 'assets/img/obj/gun.png'
        game.load.image 'player_bullet', 'assets/img/obj/bullet.png'
        game.load.image 'pills', 'assets/img/obj/pills2.png'
        game.load.image 'ammo', 'assets/img/obj/ammo2.png'
        game.load.image 'secret', 'assets/img/obj/secret2.png'
        game.load.image 'sanity_potion', 'assets/img/obj/sanity_potion2.png'

        game.load.image('map_tiles', 'assets/img/ui/mapTiles.png');
        game.load.image('youAreHere', 'assets/img/ui/youAreHere.png');


    update: ()->
        if game.input.keyboard.justPressed(Phaser.Keyboard.SPACEBAR, 10)
            @level.nextRoom()

        if game.input.keyboard.justPressed(Phaser.Keyboard.ENTER, 10)
            @ui.toggleMap()

        if game.input.keyboard.justPressed(Phaser.Keyboard.BACKSPACE, 10)
            game.state.restart(true)

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
        # capture some keys
        game.input.keyboard.addKeyCapture Phaser.Keyboard.SPACEBAR
        game.input.keyboard.addKeyCapture Phaser.Keyboard.ENTER
        game.input.keyboard.addKeyCapture Phaser.Keyboard.BACKSPACE
        game.input.keyboard.addKeyCapture Phaser.Keyboard.UP
        game.input.keyboard.addKeyCapture Phaser.Keyboard.DOWN
        game.input.keyboard.addKeyCapture Phaser.Keyboard.LEFT
        game.input.keyboard.addKeyCapture Phaser.Keyboard.RIGHT

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

        # console.log game.world.bounds
