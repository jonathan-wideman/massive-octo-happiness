Room = require("./Room").Room

class exports.Level extends Phaser.Group

    constructor: (@game)->
        @group = @game.add.group()

        @rooms = []
        @currentRoom = null

        @build()
        # console.log @

    build: () ->
        @buildRooms 10

    buildRooms: (count) ->
        @rooms = []
        for i in [0...count] by 1
            @rooms.push(new Room @game, @)


    # Shows the room at `index` in our array of rooms.
    showRoom: (index) ->
        # get rid of current room if necessary
        if @currentRoom
            @currentRoom.remove()

        @currentRoom = @rooms[index]
        @currentRoom.add()


    nextRoom: () ->
        index = _.indexOf @rooms, @currentRoom

        if index < 0
            return

        index += 1

        if index >= @rooms.length
            index = 0

        @showRoom index
        console.log 'showing room ' + index + '/' + @rooms.length




