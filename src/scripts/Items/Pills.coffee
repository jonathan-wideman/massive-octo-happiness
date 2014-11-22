OneTimePickup = require("./OneTimePickup").OneTimePickup

class exports.Pills extends OneTimePickup
    health_add: 20

    makeSprite: ()->
        return @game.make.sprite(
            @game.rnd.integerInRange(0,@game.width),
            @game.rnd.integerInRange(0,@game.height),
            'pills'
        )

    # Give Heals!
    applyEffect: ()->
        @owner.reducePain @health_add
