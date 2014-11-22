Item = require("./Item").Item

class exports.Pills extends Item
    health_add: 20

    constructor: (@game)->
        @sprite = @game.make.sprite(
            @game.rnd.integerInRange(0,@game.width),
            @game.rnd.integerInRange(0,@game.height),
            'pills'
        )
        @sprite.update = @update
        @sprite.collide = @collide
        @sprite.pickUp = @pickUp


    update: ()=>


    pickUp: (owner)=>
        @owner = owner
        @applyEffect()
        @sprite.destroy()


    add: (group)->
        group.add @sprite

    # Give Heals!
    applyEffect: ()->
        @owner.reducePain 20
