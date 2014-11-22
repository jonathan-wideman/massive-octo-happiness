Item = require("./Item").Item

class exports.OneTimePickup extends Item

    pickUp: (owner)=>
        @owner = owner
        @applyEffect()
        @sprite.destroy()

