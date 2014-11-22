Item = require("../Items/Item").Item

class exports.Secret extends Item
    MAJOR: 'MAJOR'
    MINOR: 'MINOR'
    type: 'MINOR'
    holdable: true

    @isMajor: (the_secret)->
        return (the_secret.type is @MAJOR)

    @isMinor: (the_secret)->
        return (the_secret.type is @MINOR)


    applyEffect: ()->
        return if not @isHeld()

        @owner.reduceSanity 10

