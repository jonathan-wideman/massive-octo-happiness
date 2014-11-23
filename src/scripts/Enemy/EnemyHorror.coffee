class exports.EnemyHorror extends Phaser.Sprite
    # How fast we can move
    speed: 50

    # How much sanity we drain
    sanityDamage: 1

    # attack cooldown in millisecs
    attackCooldown: 3000


    constructor: (@game, x = 0, y = 0)->
        @secrets = []

        x = @game.world.centerX + 64
        y = @game.world.centerY + 64
        super @game, x, y, 'player', 1

        @anchor.setTo 0.5, 0.5

        game.time.events.loop @attackCooldown, @attack, this

        this

    # update: ()=>
        # avoidMouse()

    # avoidMouse: () ->


    attack: () ->
        # console.log 'attempting attack'
        if @alive
            window.player.reduceSanity @sanityDamage
            console.log 'horror attacks, draining ' + @sanityDamage + ' sanity'
