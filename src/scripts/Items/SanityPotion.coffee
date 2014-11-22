OneTimePickup = require("./OneTimePickup").OneTimePickup

class exports.SanityPotion extends OneTimePickup
    sanity_add: 20

    makeSprite: ()->
        return @game.make.sprite(
            @game.rnd.integerInRange(0,@game.width),
            @game.rnd.integerInRange(0,@game.height),
            'sanity_potion'
        )

    # Give Heals!
    applyEffect: ()->
        @owner.addSanity @sanity_add
