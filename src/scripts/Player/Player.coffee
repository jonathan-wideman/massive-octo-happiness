Controller = require("./Controller").Controller
Gun = require("./Gun").Gun
# Secret = require("../Secrets/Secret").Secret

class exports.Player extends Phaser.Sprite
    # How fast we can move
    speed: 200

    # using Secrets deplete sanity over time
    sanity: 100

    # Being attacked adds to your pain over time
    pain: 0

    # Ammunitions you got for dat dere gun
    # This counts how much ammo you've got 'in hand';
    # rounds loaded in the gun don't count.
    ammo: 6

    immune: false

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


    addPain: (amount)->
        @pain += amount

    reducePain: (amount)->
        @pain -= amount
        @pain = Math.max @pain, 0

    addSanity: (amount)->
        @sanity += amount

    reduceSanity: (amount)->
        @sanity -= amount
        @sanity = Math.max @sanity, 0

    addAmmo: (amount)->
        @ammo += amount

    # Adds a new secret to your inventory. Try not to get too many of those.
    addSecret: (the_secret)->
        # if not the_secret?
            # the_secret =  new Secret(@game)

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


    # If we are able (we have ammo, the gun isn't full, etc)
    # then reload the gun and decrement our bullet count
    reloadGun: ()->
        return if not @hasAmmunition()
        return if @gun.reload() is false

        @ammo--

    # We collided with an item, such as pills, health, a secret.
    # Use this for flagging if we can pick up the item
    collideItem: (item)=>
        if @game.input.keyboard.justPressed(Phaser.Keyboard.E)
            item.pickUp(@)

    clearImmunity: ()->
        @immune = false
