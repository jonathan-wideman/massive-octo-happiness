
class exports.Ui
    constructor: (@game, @player)->

        @group = @game.add.group()
        @map = null

        style = { font: "14px Arial", fill: "#ff0044", align: "center" }
        @sanity = @game.make.text(
            @game.world.centerX,
            @game.world.centerY,
            "Player Sanity: #{@player.sanity}"
            style
        )
        @group.add @sanity

        @sanity.update = ()=>
            @sanity.text = "Player Sanity: #{@player.sanity}\n
            Secrets: #{@player.secrets.length;}\n
            Ammo: #{@player.ammo}\n
            Loaded: #{@player.gun.loaded_bullets}"

    addMap: (layer) ->
        # console.log 'adding map to ui'
        if layer
            @group.add layer
            @map = layer
            # console.log 'map added successfully'
        else
            console.log 'failed to add map to ui: map layer is falsey'

    removeMap: () ->
        if @map
            @group.remove @map

    toggleMap: () ->
        if @map
            @map.visible = !@map.visible
