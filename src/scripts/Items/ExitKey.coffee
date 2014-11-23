OneTimePickup = require("./OneTimePickup").OneTimePickup

class exports.ExitKey extends OneTimePickup

    makeSprite: ()->
        return @game.make.sprite(
            @game.rnd.integerInRange(0,@game.width),
            @game.rnd.integerInRange(0,@game.height),
            'secret_exit'
        )

    # Give Heals!
    applyEffect: ()->
        # @owner.addSanity @sanity_add

        # if we have enough secrets
        if @owner.secrets.length >= @game.level.numSecrets
            # goto the next level
            @game.nextLevel()
            return true
        # else, drop the key
        console.log 'not enough secrets: ' + @owner.secrets.length + ' of ' + @game.level.numSecrets
        x = @game.player.x
        y = @game.player.y
        return false


    pickUp: (owner)=>
        @owner = owner
        # only destroy if we sucessfully used it
        if @applyEffect()
            @sprite.destroy()

