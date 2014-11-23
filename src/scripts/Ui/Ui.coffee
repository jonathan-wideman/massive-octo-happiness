
# For list of available webfont names, look at build/index.html, 
# Under the style block describing font-families. 
class exports.Ui
    constructor: (@game, @player)->

        @group = @game.add.group()
        @map = null

        @youAreHere = @game.make.image 0, 0, 'youAreHere'

        style = { font: "29px blackboardregular", fill: "#ff0044", align: "center" }
        @sanity = @game.make.text(
            @game.world.centerX,
            @game.world.centerY,
            "Player Sanity: #{@player.sanity}"
            style
        )
        @sanity.anchor.setTo(0.5, 0.5)
        @group.add @sanity

        @sanity.update = () =>
            @sanity.text = "
            Current Room:
            index: #{window.level.currentRoom.getIndex()} in length #{window.level.rooms.length}\n
            mapX: #{window.level.currentRoom.mapX} mapY: #{window.level.currentRoom.mapY}\n
            =======\n
            Sanity: #{@player.sanity}\n
            Secrets: #{@player.secrets.length;}\n
            Ammo: #{@player.ammo}\n
            Loaded: #{@player.gun.loaded_bullets}\n
            "

        @youAreHere.update = () =>
            @positionYouAreHere()


    addMap: (layer) ->
        # console.log 'adding map to ui'
        if layer
            @group.add layer
            @map = layer
            # position and add you are here indicator
            @positionYouAreHere
            @group.add @youAreHere
            # console.log 'map added successfully'
        else
            console.log 'failed to add map to ui: map layer is falsey'

    positionYouAreHere: () ->
        @youAreHere.x = window.level.currentRoom.mapX * 32
        @youAreHere.y = window.level.currentRoom.mapY * 32

    removeMap: () ->
        if @map
            @group.remove @map

    toggleMap: () ->
        if @map
            @map.visible = !@map.visible
