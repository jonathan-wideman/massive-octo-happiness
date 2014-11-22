

class exports.ItemGroup extends Phaser.Group
    constructor: ()->
        super arguments...

        @enableBody = true
        @physicsBodyType = Phaser.Physics.ARCADE

    update: ()=>
        @game.physics.arcade.overlap(window.player, @, @collidePlayer)


    collidePlayer: (player, item)=>
        item.collide(player)
        player.collideItem(item)
