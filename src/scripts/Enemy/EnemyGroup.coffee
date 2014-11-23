

class exports.EnemyGroup extends Phaser.Group
    constructor: ()->
        super arguments...

        @enableBody = true
        @physicsBodyType = Phaser.Physics.ARCADE

    update: ()=>
        #@game.physics.arcade.overlap(window.player, @, @collidePlayer)
        @game.physics.arcade.overlap(window.player.gun.pool, @, @collideBullet)


    collideBullet: (bullet, enemy)=>
        # console.log bullet
        # hurt the enemy
        enemy.damage bullet.damageAmount
        bullet.kill()
        #enemy.collide(bullet)
        #bullet.collideEnemy(enemy)

