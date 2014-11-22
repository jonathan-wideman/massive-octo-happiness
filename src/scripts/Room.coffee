ItemGroup = require("./Items/ItemGroup").ItemGroup

class exports.Room

    constructor: (@game, @level, @mapX, @mapY)->
        @backImgName = 'blah.png'
        @backImg = null
        @tiles = null

        @build()
        # console.log @

    add: () ->
        console.log "ADDINGS"
        @level.group.add @backImg
        @level.group.add @itemGroup

    remove: () ->
        @level.group.remove @backImg
        @level.group.remove @itemGroup

    getIndex: () ->
        return @level.getRoomIndex @

    getRandom: () ->
        return Math.floor Math.random() * 100

    build: () ->
        @buildDummy()
        @itemGroup = new ItemGroup @game, null

        Pills = require("./Items/Pills").Pills
        SanityPotion = require("./Items/SanityPotion").SanityPotion
        Ammo = require("./Items/Ammo").Ammo
        pills = new Pills @game
        pills.add @itemGroup
        potion = new SanityPotion @game
        potion.add @itemGroup
        ammo = new Ammo @game
        ammo.add @itemGroup


    buildDummy: () ->
        backTexture = @game.make.bitmapData 800, 600, 'backTexture', true
        backTexture.fill @getRandom(), @getRandom(), @getRandom(), 1
        @backImg = @game.make.image 0, 0
        @backImg.loadTexture backTexture


