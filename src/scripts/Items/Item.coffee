
# Base class for items you can pick up / interact with.
# Secrets count as an "item"
class exports.Item
    # Can the item be picked up and kept?
    holdable: false

    constructor: (@game)->


    update: ()-> #stub

    applyEffect: ()-> #stub

    collide: ()-> #stub

    isHeld: ()->
        return @owner? and @holdable


