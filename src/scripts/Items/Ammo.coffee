OneTimePickup = require("./OneTimePickup").OneTimePickup

class exports.Ammo extends OneTimePickup
    ammo_add: 6

    makeSprite: ()->
        return @game.make.sprite(
            @game.rnd.integerInRange(0,@game.width),
            @game.rnd.integerInRange(0,@game.height),
            'ammo'
        )

    # Give Heals!
    applyEffect: ()->
        @owner.addAmmo @ammo_add
