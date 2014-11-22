

class exports.Gun extends Phaser.Sprite
    number_of_bullets: 12
    last_bullet_time: 0
    BULLET_SPEED: 500
    FIRE_DELAY: 100

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


    shoot: ()=>
        return if @game.time.now - @last_bullet_time < @FIRE_DELAY
        @last_bullet_time = @game.time.now

        bullet = @pool.getFirstDead()

        if not bullet?
            return

        bullet.revive()
        bullet.reset @x, @y
        bullet.rotation = @rotation

        bullet.body.velocity.x = Math.cos(bullet.rotation) * @BULLET_SPEED
        bullet.body.velocity.y = Math.sin(bullet.rotation) * @BULLET_SPEED


    _fillPool: ()->
        for i in [0..@number_of_bullets]
            bullet = @game.add.sprite 0, 0, 'player_bullet'
            bullet.anchor.setTo 0.5, 0.5
            bullet.checkWorldBounds = true
            bullet.outOfBoundsKill = true

            @pool.add(bullet)

            @game.physics.enable bullet, Phaser.Physics.ARCADE
            bullet.kill()
