

class exports.Room

    constructor: (@game, @level)->
        @backImgName = 'blah.png'
        @backImg = null
        @tiles = null

        @build()
        # console.log @

    add: () ->
        @level.group.add @backImg

    remove: () ->
        @level.group.remove @backImg

        return
        if @backImg.parent
            @backImg.parent.remove @backImg


    getRandom: () ->
        return Math.floor Math.random() * 100

    build: () ->
        @buildDummy()

    buildDummy: () ->
        backTexture = @game.make.bitmapData 800, 600, 'backTexture', true
        backTexture.fill @getRandom(), @getRandom(), @getRandom(), 1
        @backImg = @game.make.image 0, 0
        @backImg.loadTexture backTexture
