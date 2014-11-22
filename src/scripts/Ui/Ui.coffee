
class exports.Ui
    constructor: (@game, @player)->

        @group = @game.add.group()

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
