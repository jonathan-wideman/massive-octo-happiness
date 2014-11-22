Room = require("./Room").Room

class exports.Level

    constructor: (game)->
        @game = game

        @rooms = []
        @currentRoom = null

        # layout is the 'map' of how all the rooms are arranges; represented as a tilemap
        @layout = null

        @build()
        # console.log @

    build: () ->
        @buildRooms 10
        # build a layout of the rooms, width by height
        @buildLayout 5, 5

    buildRooms: (count) ->
        @rooms = []
        for i in [0...count] by 1
            # build a new room
            @rooms.push(new Room @game)

    buildLayout: (width, height) ->
        # Creates a blank tilemap
        @layout = @game.add.tilemap();

        # Add a Tileset image to the map
        @layout.addTilesetImage('map', 'map_tiles');

        # Creates a new blank layer and sets the map dimensions.
        # In this case the map is width by height tiles in size and the tiles are 32x32 pixels in size.
        @layoutLayer = @layout.create('level1', width, height, 32, 32);

        # populate random squares on the layer
        for x in [0...width] by 1
            for y in [0...height] by 1
                if Math.random() > 0.6
                    @layout.putTile(1, x, y);


    toggleMap: () ->
        @layoutLayer.visible = !@layoutLayer.visible

    addMap: () ->
        if @layout and !@layout.parent
            @game.add.existing @layout

    removeMap: () ->
        if @layout
            @layout.parent.remove @layout

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
        # @currentRoom.add()

        # re-add the player
        if player
            playerParent.add player
            # and his gun
            playerParent.add player.gun
            playerParent.add player.gun.pool

        # @addMap()

    nextRoom: () ->
        index = _.indexOf @rooms, @currentRoom

        if index < 0
            return

        index += 1

        if index >= @rooms.length
            index = 0

        @showRoom index
        console.log 'showing room ' + index + '/' + @rooms.length




