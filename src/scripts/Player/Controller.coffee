

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

        # TODO: we'll want to switch this so we've got our check-ammo
        # screen, rather than explicitly pressing the R key to reload
        if @game.input.keyboard.justPressed(Phaser.Keyboard.R)
            @player.reloadGun()
