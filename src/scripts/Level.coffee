Room = require("./Room").Room

class exports.Level

    constructor: (game)->
        @game = game

        @rooms = []
        @currentRoom = null

        @build()
        # console.log @


    build: () ->
        @buildRooms 10

    buildRooms: (count) ->
        @rooms = []
        for i in [0..count] by 1
            # add a new room
            @rooms.push(new Room @game)

    showRoom: (index) ->
        # get rid of current room if necessary
        if @currentRoom
            @currentRoom.remove()

        @currentRoom = @rooms[index]
        # console.log 'index: ' + index
        # console.log @rooms
        @currentRoom.add()

    nextRoom: () ->
        index = _.indexOf @rooms, @currentRoom
        if index >= 0
            index += 1

        showRoom index




