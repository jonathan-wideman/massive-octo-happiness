class exports.EnemyHorror extends Phaser.Sprite
    # How fast we can move
    speed: 250

    # How much sanity we drain
    sanityDamage: 1

    # attack cooldown in millisecs
    attackCooldown: 3000

    # timer
    # @attackTimer:

    health: 5

    TURN_RATE: 2


    constructor: (@game, x = 0, y = 0)->
        @secrets = []

        # x = @game.world.centerX + 64
        # y = @game.world.centerY + 64
        super @game, x, y, 'player', 1

        @health = 3

        @anchor.setTo 0.5, 0.5

        # @game.time.events.loop @attackCooldown, @attack, this

        this

    update: ()=>
        # avoidMouse()
        @followPlayer()

    # avoidMouse: () ->

    followPlayer: ()=>
        console.log "follow..."
        # Calculate the angle from the missile to the mouse cursor game.input.x
        # and game.input.y are the mouse position; substitute with whatever
        # target coordinates you need.
        targetAngle = @game.math.angleBetween @x, @y, window.player.x, window.player.y
        console.log targetAngle
        # Gradually (@TURN_RATE) aim the missile towards the target angle
        if @rotation != targetAngle
            # Calculate difference between the current angle and targetAngle
            delta = targetAngle - @rotation;

            # Keep it in range from -180 to 180 to make the most efficient turns.
            if delta > Math.PI
                delta -= Math.PI * 2
            if delta < -Math.PI
                delta += Math.PI * 2

            if delta > 0
                # Turn clockwise
                @angle += @TURN_RATE
            else
                # Turn counter-clockwise
                @angle -= @TURN_RATE

            # Just set angle to target angle if they are close
            if (Math.abs(delta) < @game.math.degToRad(@TURN_RATE))
                @rotation = targetAngle

        # Calculate velocity vector based on @rotation and @speed
        @body.velocity.x = Math.cos(@rotation) * @speed;
        @body.velocity.y = Math.sin(@rotation) * @speed;


    attack: () ->
        # console.log 'attempting attack'
        if @alive
            window.player.reduceSanity @sanityDamage
            console.log 'horror attacks, draining ' + @sanityDamage + ' sanity'
