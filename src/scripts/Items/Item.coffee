
# Base class for items you can pick up / interact with.
# Secrets count as an "item"
class exports.Item
    # Can the item be picked up and kept?
    holdable: false

    constructor: (@game)->
        @sprite = @makeSprite()
        @sprite.update = @update
        @sprite.collide = @collide
        @sprite.pickUp = @pickUp

    # Add this thing's sprite to a group.
    # If the item needs something more on add,
    # override!
    add: (group)->
        group.add @sprite

    # Make the sprite for the item
    makeSprite: ()-> #stub

    update: ()-> #stub

    # Each item has varying effects. So,
    # override this method to provide an effect.
    applyEffect: ()-> #stub

    # Some types of items need to handle being picked up
    # differently. The player will call "pickUp" when colliding +
    # pressing some interaction key, and then the item will handle
    # what exactly it does from there
    pickUp: (player)-> # stub

    # When collided with the player. Some items
    collide: ()-> #stub

    # Not really doing things with this yet
    # planned on using it for pick-upable items
    isHeld: ()->
        return @owner? and @holdable


