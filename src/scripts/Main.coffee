Player = require("./Player").Player
Level = require("./Level").Level
Room = require("./Room").Room


window.onload = ()->
    window.game = new Phaser.Game(800, 600, Phaser.CANVAS, 'game-container', gamestate)


gamestate =
    preload: ()->
        # console.log(new Player)
        # console.log(new Level)
        # console.log(new Room)

        @level = new Level game

        # game.load.image('phaser', 'assets/img/phaser.png')

    create: ()->
        # game.add.sprite(0, 0, 'phaser')
        @level.showRoom(0)

    update: ()->

