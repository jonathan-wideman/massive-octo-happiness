

class exports.Room

    constructor: (@game, @level, @mapX, @mapY)->
        @backImgName = 'blah.png'
        @backImg = null
        @tiles = null

        @build()
        # console.log @

    add: () ->
        @level.group.add @backImg

    remove: () ->
        @level.group.remove @backImg

    getIndex: () ->
        return @level.getRoomIndex @

    getRandom: () ->
        return Math.floor Math.random() * 100

    build: () ->
        @buildDummy()

    buildDummy: () ->
        backTexture = @game.make.bitmapData 800, 600, 'backTexture', true
        backTexture.fill @getRandom(), @getRandom(), @getRandom(), 1
        @backImg = @game.make.image 0, 0
        @backImg.loadTexture backTexture
