Room = require("./Room").Room

# Each level is made up of many rooms. To progress past a
# level, you must traverse rooms and find the exit
class exports.Level extends Phaser.Group

    constructor: (@game)->
        @group = @game.add.group()

        @rooms = []
        @currentRoom = null

        # layout is the 'map' of how all the rooms are arranges; represented as a tilemap
        @layout = null

        @build()
        # console.log @

    build: () ->
        # @buildRooms 10
        # build a layout of the rooms, width by height
        @buildLayout 5, 5

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
        for x in [0...width] by 1
            for y in [0...height] by 1
                if Math.random() > 0.6
                    @layout.putTile(1, x, y);
                    @rooms.push(new Room @game, @, x, y)


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




