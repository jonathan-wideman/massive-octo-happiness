

class exports.Controller
    keyboard_modes: {
        QWERTY: {
            up: Phaser.Keyboard.W
            down: Phaser.Keyboard.S
            left: Phaser.Keyboard.A
            right: Phaser.Keyboard.D
        }
        DVORAK: {
            up: 188 # Comma
            down: Phaser.Keyboard.O
            left: Phaser.Keyboard.A
            right: Phaser.Keyboard.E
        }

    }


    constructor: (@game, @player)->
        @cursors = game.input.keyboard.createCursorKeys()
        @setKeymap("QWERTY")

    setKeymap: (mode)=>
        if @keyboard_modes[mode]?
            @keyboard_mode = @keyboard_modes[mode]

    update: ()->
        @player.body.velocity.x = 0
        @player.body.velocity.y = 0



        if @cursors.left.isDown or @game.input.keyboard.isDown(@keyboard_mode.left)
            @player.body.velocity.x = -1 * @player.speed
        else if @cursors.right.isDown or @game.input.keyboard.isDown(@keyboard_mode.right)
            @player.body.velocity.x = @player.speed

        if @cursors.up.isDown or @game.input.keyboard.isDown(@keyboard_mode.up)
            @player.body.velocity.y = -1 * @player.speed
        else if @cursors.down.isDown or @game.input.keyboard.isDown(@keyboard_mode.down)
            @player.body.velocity.y = @player.speed

        # TODO: we'll want to switch this so we've got our check-ammo
        # screen, rather than explicitly pressing the R key to reload
        if @game.input.keyboard.justPressed(Phaser.Keyboard.R)
            @player.reloadGun()
