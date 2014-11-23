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

        # generation:

        # - start with 'tetris piece' path
        #     - start to finish
        #     - minimum distance < level size
        #     - random stepped

        # - 'throw' rooms in from the sides until room count reached
        #     - pick a side
        #     - step forward until hit room

        # width = level depth, so the number of rooms desired should be
        # a minimum of depth, and a maximum of the filled level
        minRooms = width * 2
        maxRooms = width * height
        desiredRooms = game.rnd.between minRooms, maxRooms

        @buildPath(desiredRooms)
        @buildExtra(desiredRooms)


    # random-steps a path from start to finish
    buildPath: (maxRooms) ->
        # place a starting location
        startX = Math.floor(Math.random() * @layout.width)
        startY = Math.floor(Math.random() * @layout.height)
        @layout.putTile 2, startX, startY ;
        placedRoom = new Room @game, @, startX, startY
        @rooms.push placedRoom

        repeats = 0
        while @rooms.length <= maxRooms and repeats < 10
            repeats += 1
            if placedRoom
                repeats = 0
                lastRoom = placedRoom
            placedRoom = @buildPathStep lastRoom.mapX, lastRoom.mapY

        # if repeats >= 10
        #     console.log "could not place room - too many iterations"



        # replace the last room with a finish room
        @layout.putTile 3, lastRoom.mapX, lastRoom.mapY

    # builds divergent rooms
    buildExtra: (maxRooms) ->
        repeats = 0
        while @rooms.length <= maxRooms and repeats < 10
            repeats += 1
            if placedRoom
                repeats = 0
            placedRoom = @buildThrow()

        # if repeats >= 10
        #     console.log "could not place room - too many iterations"


    # builds a room by 'throwing' it in from a side
    buildThrow: () ->
        dir = @game.rnd.pick @dirs
        if dir == @north
            # start at bottom
            x = @game.rnd.between(0, @layout.width)
            y = @layout.height
            # console.log 'throwing ' + dir.name + ' at ' + x + ',' + y
        else if dir == @south
            # start at top
            x = @game.rnd.between(0, @layout.width)
            y = 0
            # console.log 'throwing ' + dir.name + ' at ' + x + ',' + y
        else if dir == @west
            # start at right
            x = @layout.width
            y = @game.rnd.between(0, @layout.height)
            # console.log 'throwing ' + dir.name + ' at ' + x + ',' + y
        else if dir == @east
            # start at left
            x = 0
            y = @game.rnd.between(0, @layout.height)
            # console.log 'throwing ' + dir.name + ' at ' + x + ',' + y

        # if our start is no good, just fail out
        if !@canPlaceRoom x, y
            # console.log 'aborting throw - bad start'
            return null

        # step in direction until we can't place room
        while @canPlaceRoom x, y
            x += dir.dX
            y += dir.dY
            # console.log 'checking ' + x + ',' + y
        # if we're off the map now, also fail out
        if !@isOnMap x, y
            # console.log 'aborting throw - did not hit anything'
            return null

        # now take one step backwards
        x -= dir.dX
        y -= dir.dY

        # if if this is no good, we f'd something up, just fail out
        if !@canPlaceRoom x, y
            # console.log 'aborting throw - wtf happened?'
            return null

        # ok, place it
        # console.log 'placed at ' + x + ',' + y
        return @placeRoom x, y, 1



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


    isOnMap: (x, y) ->
        # is the space on the map?
        if x < 0 or y < 0 or x >= @layout.width or y >= @layout.height
            return false

        return true

    canPlaceRoom: (x, y) ->
        # is the space on the map?
        if !@isOnMap x, y
            return false

        # is the space itself occupied?
        if @layout.getTile x, y
            return false

        # is any adjacent tile occupied?
        # - yea leeeets not do this one

        # eveything is clear; return true
        return true

    # place a room and return it
    placeRoom: (x, y, value = 1) ->
        @layout.putTile value, x, y;
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
            # console.log 'room found; travelling ' + direction
            # console.log  newRoom
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




