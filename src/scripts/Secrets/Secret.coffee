

class exports.Secret

    MAJOR: 'MAJOR'
    MINOR: 'MINOR'

    constructor: (@game)->


    update: ()->


    applyEffect: ()->
        return if not @player?

        @player.sanity -= 10
