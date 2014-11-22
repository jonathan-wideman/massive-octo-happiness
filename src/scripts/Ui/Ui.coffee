
class exports.Ui
    constructor: (@game, @player)->


        style = { font: "14px Arial", fill: "#ff0044", align: "center" }
        @sanity = @game.add.text(
            @game.world.centerX,
            @game.world.centerY,
            "Player Sanity: #{@player.sanity}"
            style
        )

        @sanity.update = ()=>
            @sanity.text = "Player Sanity: #{@player.sanity}\nSecrets: #{@player.secrets.length;}"
