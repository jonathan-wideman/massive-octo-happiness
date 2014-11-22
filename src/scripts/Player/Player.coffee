Controller = require("./Controller").Controller
Gun = require("./Gun").Gun

class exports.Player extends Phaser.Sprite
    speed: 200

    constructor: (@game)->
        x = @game.world.centerX
        y = @game.world.centerY
        super @game, x, y, 'player', 1

        @anchor.setTo 0.5, 0.5

        @controller = new Controller @, @game
        @gun = new Gun @, @game

        this


    update: ()=>
        @controller.update()
