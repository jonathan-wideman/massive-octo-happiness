Controller = require("./Controller").Controller
Gun = require("./Gun").Gun
Secret = require("../Secrets/Secret").Secret

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
        @secrets = []

        x = @game.world.centerX
        y = @game.world.centerY
        super @game, x, y, 'player', 1

        @anchor.setTo 0.5, 0.5

        # Woooo... magic
        @group = @game.add.group()
        @group.add @

        @controller = new Controller @game, @
        @gun = new Gun @game, @

        this


    update: ()=>
        @controller.update()

        @kill() if @isYouDead()

        # Tell the secrets to update.
        # Some secrets might have Time-based
        # effects, while most (all?) are per-room
        secret.update() for secret in @secrets



    # iterate over the secrets and have them apply
    # their effects. Usually that effect is making you
    # go insane! Typically, this method is called when
    # you switch rooms
    applySecrets: ()->
        secret.applyEffect() for secret in @secrets



    # Adds a new secret to your inventory. Try not to get too many of those.
    addSecret: (the_secret)->
        if not the_secret?
            the_secret =  new Secret(@game)

        the_secret.player = @

        @secrets.push the_secret


    # Dead Conditions:
    # - Sanity hits 0 (you lost your wits!)
    # - Pain hits 100 (ouch that probably hurts)
    # - Sanity and pain intersect. if you lose 50 sanity and gain 50 pain,
    #   now you be ded.
    isYouDead: ()->
        return @pain > @sanity


    hasAmmunition: ()->
        return @ammo > 0


    firedGun: ()->
        @ammo--
