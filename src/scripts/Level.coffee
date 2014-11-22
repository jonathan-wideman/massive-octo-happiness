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
        for i in [0...count] by 1
            # build a new room
            @rooms.push(new Room @game)

    showRoom: (index) ->
        # get rid of current room if necessary
        if @currentRoom
            @currentRoom.remove()

        # also temporarily remove the player
        player = window.player
        if player
            playerParent = player.parent
            playerParent.remove player
            # and his gun
            playerParent.remove player.gun
            playerParent.remove player.gun.pool

        @currentRoom = @rooms[index]
        @currentRoom.add()

        # re-add the player
        if player
            playerParent.add player
            # and his gun
            playerParent.add player.gun
            playerParent.add player.gun.pool

    nextRoom: () ->
        index = _.indexOf @rooms, @currentRoom

        if index < 0
            return

        index += 1

        if index >= @rooms.length
            index = 0

        @showRoom index
        console.log 'showing room ' + index + '/' + @rooms.length




