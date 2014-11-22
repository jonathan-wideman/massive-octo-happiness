Room = require("./Room").Room

# Each level is made up of many rooms. To progress past a
# level, you must traverse rooms and find the exit
class exports.Level extends Phaser.Group

    constructor: (@game)->
        @group = @game.add.group()

        @north =
            name: 'north'
            dX: 0
            dY: -1
        @south =
            name: 'south'
            dX: 0
            dY: 1
        @west =
            name: 'west'
            dX: -1
            dY: 0
        @east =
            name: 'east'
            dX: 1
            dY: 0
        @dirs = [@north, @south, @west, @east]

        @rooms = []
        @currentRoom = null

        # layout is the 'map' of how all the rooms are arranges; represented as a tilemap
        @layout = null

        @build()
        # console.log @

    build: () ->
        # @buildRooms 10
        # build a layout of the rooms, width by height
        @buildLayout 10, 10

    buildRooms: (count) ->
        @rooms = []
        for i in [0...count] by 1
            @rooms.push(new Room @game, @, 0, 0)


    buildLayout: (width, height) ->
        # Creates a blank tilemap
        @layout = @game.add.tilemap();

        # Add a Tileset image to the map
        @layout.addTilesetImage('map', 'map_tiles');

        # Creates a new blank layer and sets the map dimensions.
        # In this case the map is width by height tiles in size and the tiles are 32x32 pixels in size.
        @layoutLayer = @layout.create('level1', width, height, 32, 32);
        @layoutLayer.parent.remove @layoutLayer

        # populate random squares on the layer
        # for x in [0...width] by 1
        #     for y in [0...height] by 1
        #         if Math.random() > 0.6
        #             @layout.putTile 1, x, y;
        #             @rooms.push(new Room @game, @, x, y)

        # width = level depth, so the number of rooms desired should be
        # a minimum of depth, and a maximum of the filled level
        minRooms = width * 2
        maxRooms = width * height
        desiredRooms = game.rnd.between minRooms, maxRooms

        @buildPath(desiredRooms)


    # random-steps a path from start to finish
    buildPath: (count) ->
        # place a starting location
        startX = Math.floor(Math.random() * @layout.width)
        startY = Math.floor(Math.random() * @layout.height)
        @layout.putTile 2, startX, startY ;
        placedRoom = new Room @game, @, startX, startY
        @rooms.push placedRoom

        # finishX = Math.floor(Math.random() * @layout.width)
        # while finishX == startX
        #     finishX = Math.floor(Math.random() * @layout.width)
        # finishY = Math.floor(Math.random() * @layout.height)
        # while finishY == startY
        #     finishY = Math.floor(Math.random() * @layout.height)
        # @layout.putTile(3, finishX, finishY);
        # @rooms.push(new Room @game, @, finishX, finishY)

        repeats = 0
        while @rooms.length <= count and repeats < 10
            if placedRoom
                repeats = 0
                lastRoom = placedRoom
            repeats += 1
            placedRoom = @buildPathStep lastRoom.mapX, lastRoom.mapY


        # replace the last room with a finish room
        @layout.putTile 3, lastRoom.mapX, lastRoom.mapY



    # place a room in a random direction from a point
    # returns room
    buildPathStep: (x, y) ->
        # step in a random direction
        dirs = _.clone(@dirs)

        success = false
        while !success and dirs.length > 0
            dir = @game.rnd.pick dirs
            _.pull dirs, dir
            nX = x + dir.dX
            nY = y + dir.dY
            # console.log 'trying to place room to the ' + dir.name
            if @canPlaceRoom nX, nY
                newRoom = @placeRoom nX, nY
                success = true
                # console.log 'placed room'
        if !success
            # console.log 'failed to place room - no space'
            return null
        # step complete
        return newRoom


    canPlaceRoom: (x, y) ->
        # is the space on the map?
        if x < 0 or y < 0 or x >= @layout.width or y >= @layout.height
            return false
        # is the space itself occupied?
        if @layout.getTile x, y
            return false

        # is any adjacent tile occupied?
        # - yea leeeets not do this one

        # eveything is clear; return true
        return true

    # place a room and return it
    placeRoom: (x, y) ->
        @layout.putTile 1, x, y;
        newRoom = new Room @game, @, x, y
        @rooms.push newRoom
        return newRoom

    # switch rooms in a given direction
    travel: (direction) ->
        dX = 0
        dY = 0
        if direction is 'north'
            dY = -1
        else if direction is 'south'
            dY = +1
        else if direction is 'west'
            dX = -1
        else if direction is 'east'
            dX = +1
        else
            console.log 'cannot travel - invalid direction: ' + direction
            return

        dX = @currentRoom.mapX + dX
        dY = @currentRoom.mapY + dY
        newRoom = _.find @rooms, { mapX: dX, mapY: dY }

        if newRoom
            console.log 'room found; travelling ' + direction
            console.log  newRoom
            @showRoom newRoom.getIndex()
            return

        console.log 'cannot travel - no rooms to the ' + direction
        return


    # find the index of a room object in rooms array
    getRoomIndex: (room) ->
        return _.indexOf @rooms, room

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




