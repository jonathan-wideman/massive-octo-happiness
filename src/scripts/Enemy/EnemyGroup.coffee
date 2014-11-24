

class exports.EnemyGroup extends Phaser.Group
    constructor: ()->
        super arguments...

        @enableBody = true
        @physicsBodyType = Phaser.Physics.ARCADE

    update: ()=>
        @game.physics.arcade.overlap(window.player, @, @collidePlayer)
        @game.physics.arcade.overlap(window.player.gun.pool, @, @collideBullet)

        super()


    collideBullet: (bullet, enemy)=>
        # console.log bullet
        # hurt the enemy
        enemy.damage bullet.damageAmount
        bullet.kill()
        #enemy.collide(bullet)
        #bullet.collideEnemy(enemy)

    collidePlayer: (player, enemy)=>
        if !player.immune
            player.pain += 1
            player.immune = true
            console.log window.player.clearImmunity
            @game.time.events.add(50, window.player.clearImmunity, window.player);

