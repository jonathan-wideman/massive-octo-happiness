Item = require("./Item").Item

class exports.Pills extends Item
    health_add: 20

    constructor: (@game)->
        @sprite = @game.make.sprite(80, 80, 'pills')
        @sprite.update = @update


    update: ()=>


    add: (group)->
        if not group?
            @game.add.existing(@sprite)
        else
            group.add @sprite

    applyEffect: ()->
        @owner.reducePain 20
