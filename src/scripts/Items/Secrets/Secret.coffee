Item = require("../Item").Item

class exports.Secret extends Item
    MAJOR: 'MAJOR'
    MINOR: 'MINOR'
    type: 'MINOR'
    holdable: true

    makeSprite: ()->
        return @game.make.sprite(
            @game.rnd.integerInRange(0,@game.width),
            @game.rnd.integerInRange(0,@game.height),
            'secret'
        )


    pickUp: (player)=>
        @owner = player
        player.addSecret(@)
        @sprite.kill()

    update: ()->
        # If we switched rooms, and isHeld, applyEffect()


    @isMajor: (the_secret)->
        return (the_secret.type is @MAJOR)

    @isMinor: (the_secret)->
        return (the_secret.type is @MINOR)


    applyEffect: ()->
        return if not @isHeld()

        @owner.reduceSanity 10

