Controller = require("./Controller").Controller

class exports.Player extends Phaser.Sprite
    constructor: (@game)->
        x = @game.world.centerX
        y = @game.world.centerY
        super(@game, x, y, 'player', 1)
        @anchor.setTo(0.5, 0.5)

        @controller = new Controller(@, @game)

        return @

