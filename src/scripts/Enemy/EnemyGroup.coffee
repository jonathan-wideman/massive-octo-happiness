

class exports.EnemyGroup extends Phaser.Group
    constructor: ()->
        super arguments...

        @enableBody = true
        @physicsBodyType = Phaser.Physics.ARCADE

    update: ()=>
        @game.physics.arcade.overlap(window.player, @, @collidePlayer)


    collidePlayer: (player, enemy)=>
        enemy.collide(player)
        player.collideEnemy(enemy)
