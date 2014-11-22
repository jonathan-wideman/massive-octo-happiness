ItemGroup = require("./Items/ItemGroup").ItemGroup

class exports.Room

    constructor: (@game, @level)->
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

    getRandom: () ->
        return Math.floor Math.random() * 100

    build: () ->
        @buildDummy()
        @itemGroup = new ItemGroup @game, null

        Pills = require("./Items/Pills").Pills
        pills = new Pills(@game)
        pills.add(@itemGroup)


    buildDummy: () ->
        backTexture = @game.make.bitmapData 800, 600, 'backTexture', true
        backTexture.fill @getRandom(), @getRandom(), @getRandom(), 1
        @backImg = @game.make.image 0, 0
        @backImg.loadTexture backTexture


