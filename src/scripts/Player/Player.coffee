Controller = require("./Controller").Controller
Gun = require("./Gun").Gun

class exports.Player extends Phaser.Sprite
    # How fast we can move
    speed: 200

    # using Secrets deplete sanity over time
    sanity: 100

    # Being attacked adds to your pain over time
    pain: 0

    # Ammunitions you got for dat dere gun
    ammo: 6


    constructor: (@game)->
        x = @game.world.centerX
        y = @game.world.centerY
        super @game, x, y, 'player', 1

        @anchor.setTo 0.5, 0.5

        @controller = new Controller @, @game
        @gun = new Gun @, @game

        this


    update: ()=>
        @controller.update()

        @kill() if @isYouDead()


    # Dead Conditions:
    # - Sanity hits 0 (you lost your wits!)
    # - Pain hits 100 (ouch that probably hurts)
    # - Sanity and pain intersect. if you lose 50 sanity and gain 50 pain,
    #   now you be ded.
    isYouDead: ()->
        lost_sanity = 100 - @sanity

        return (@pain + lost_sanity) >= 100


    hasAmmunition: ()->
        return @ammo > 0
