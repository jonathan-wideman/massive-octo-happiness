Item = require("./Item").Item

class exports.Pills extends Item
    health_add: 20

    constructor: (@game)->
        @sprite = @game.make.sprite(300, 250, 'pills')
        @sprite.update = @update
        @sprite.collide = @collide


    update: ()=>


    collide: (player)=>
        @pickUp(player)
        @applyEffect()
        @sprite.destroy()

    pickUp: (owner)->
        @owner = owner

    add: (group)->
        group.add @sprite

    # Give Heals!
    applyEffect: ()->
        @owner.reducePain 20
