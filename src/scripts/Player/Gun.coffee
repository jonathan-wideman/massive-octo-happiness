

class exports.Gun extends Phaser.Sprite
    # Number of bullets in the bullet @pool (NOT ammo. Check Player.ammo)
    number_of_bullets: 12

    # When we fired the last shot
    last_bullet_time: 0

    # How fast bullets move
    speed: 500

    # How long you have to wait (ms) between shooting
    fire_delay: 100

    constructor: (@player, @game)->
        super @game, 0, 0, 'player_bullet', 1
        @anchor.setTo 0.5, 0.5

        @pool = @game.add.group()
        @_fillPool()

        this

    update: ()=>
        @x = @player.x
        @y = @player.y

        @rotation = @game.physics.arcade.angleToPointer(@)

        if @.game.input.activePointer.isDown
            @shoot()

    # Attempts to shoot the gun.
    # Currently there are a few conditions on shooting:
    #
    #   - you can't fire too fast (we check if @fire_delay) has elapsed
    #       since you last shot
    #   - you can't shoot if you don't have any ammo
    #
    # Bullets are drawn from @pool and recycled
    #
    shoot: ()=>
        return if @game.time.now - @last_bullet_time < @fire_delay

        if not @player.hasAmmunition()
            return

        @last_bullet_time = @game.time.now

        bullet = @pool.getFirstDead()

        if not bullet?
            return

        bullet.revive()
        bullet.reset @x, @y
        bullet.rotation = @rotation

        bullet.body.velocity.x = Math.cos(bullet.rotation) * @speed
        bullet.body.velocity.y = Math.sin(bullet.rotation) * @speed


    # Populates the initial bullet @pool.
    _fillPool: ()->
        for i in [0..@number_of_bullets]
            bullet = @game.add.sprite 0, 0, 'player_bullet'
            bullet.anchor.setTo 0.5, 0.5
            bullet.checkWorldBounds = true
            bullet.outOfBoundsKill = true

            @pool.add(bullet)

            @game.physics.enable bullet, Phaser.Physics.ARCADE
            bullet.kill()
