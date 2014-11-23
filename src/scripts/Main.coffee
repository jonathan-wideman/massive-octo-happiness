Player = require("./Player/Player").Player
# EnemyHorror = require("./Enemy/EnemyHorror").EnemyHorror
Ui = require("./Ui/Ui").Ui
Level = require("./Level").Level
Room = require("./Room").Room
ScreenFlash = require("./Misc/ScreenFlash").ScreenFlash

window.onload = ()->
    # haaax
    window.gameDepth = 3

    window.game = new Phaser.Game(800, 600, Phaser.CANVAS, 'game-container', gamestate)


gamestate =
    preload: ()->
        game.load.image 'player', 'assets/img/obj/player.png'
        game.load.image 'gun', 'assets/img/obj/gun.png'
        game.load.image 'player_bullet', 'assets/img/obj/bullet.png'
        game.load.image 'pills', 'assets/img/obj/pills2.png'
        game.load.image 'ammo', 'assets/img/obj/ammo2.png'
        game.load.image 'secret', 'assets/img/obj/secret2.png'
        game.load.image 'secret_exit', 'assets/img/obj/secretExit.png'
        game.load.image 'sanity_potion', 'assets/img/obj/sanity_potion2.png'

        game.load.image('map_tiles', 'assets/img/ui/mapTiles.png');
        game.load.image('youAreHere', 'assets/img/ui/youAreHere.png');


    update: ()->
        # if game.input.keyboard.justPressed(Phaser.Keyboard.SPACEBAR, 10)
        #     @level.nextRoom()

        if game.input.keyboard.justPressed(Phaser.Keyboard.Q, 10)
            @ui.toggleMap()

        # if game.input.keyboard.justPressed(Phaser.Keyboard.BACKSPACE, 10)
            # game.state.restart(true)
            # game.nextLevel()

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

        if !player.alive and !@triggeredGameOver
            @triggeredGameOver = true
            game.gameOver()


    create: ()->
        game.custom_fx ?= {}

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
        game.level = @level
        @level.showRoom(0)

        game.physics.startSystem Phaser.Physics.ARCADE

        @player = new Player(game)
        window.player = @player
        game.player = @player

        # enemy = new EnemyHorror(game, 200, 200)
        # game.add.existing enemy

        game.physics.enable player, Phaser.Physics.ARCADE

        @ui = new Ui(game, player)
        window.ui = @ui
        @ui.addMap @level.layoutLayer


        flash = new ScreenFlash game
        flash2 = new ScreenFlash game
        flash.add()
        flash2.add()

        game.custom_fx.flash = flash
        game.custom_fx.flash2 = flash2

        game.nextLevel = () ->
            window.gameDepth += 1
            window.ui.showMessage('there are always more secrets...')
            console.log 'next level: ' + window.gameDepth
            game.time.events.add(Phaser.Timer.SECOND * 3, game.doRestart, this);

        game.doRestart = () ->
            game.state.restart(true)

        game.gameOver = () ->
            window.gameDepth = 3
            window.ui.showMessage('you went mad; start over' + (window.gameDepth - 2))
            console.log 'you died; restarting at level ' + window.gameDepth
            # game.state.restart(true)
            game.time.events.add(Phaser.Timer.SECOND * 3, game.doRestart, this);


        # console.log game.world.bounds
