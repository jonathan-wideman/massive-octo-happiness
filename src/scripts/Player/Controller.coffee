

class exports.Controller
    constructor: (@game, @player)->
        @cursors = game.input.keyboard.createCursorKeys()

    update: ()->
        @player.body.velocity.x = 0
        @player.body.velocity.y = 0

        if @cursors.left.isDown
            @player.body.velocity.x = -1 * @player.speed
        else if @cursors.right.isDown
            @player.body.velocity.x = @player.speed

        if @cursors.up.isDown
            @player.body.velocity.y = -1 * @player.speed
        else if @cursors.down.isDown
            @player.body.velocity.y = @player.speed


        if @game.input.keyboard.justPressed(Phaser.Keyboard.R)
            @player.reloadGun()
