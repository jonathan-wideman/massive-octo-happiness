EnemyHorror = require("./Enemy/EnemyHorror").EnemyHorror
EnemyGroup = require("./Enemy/EnemyGroup").EnemyGroup
ItemGroup = require("./Items/ItemGroup").ItemGroup

class exports.Room

    constructor: (@game, @level, @mapX, @mapY)->
        @backImgName = 'blah.png'
        @backImg = null
        @tiles = null

        @build()
        # console.log @

    add: () ->
        # console.log "ADDINGS"
        @level.group.add @backImg
        @level.group.add @itemGroup
        @level.group.add @enemyGroup

    remove: () ->
        @level.group.remove @backImg
        @level.group.remove @itemGroup
        @level.group.remove @enemyGroup

    getIndex: () ->
        return @level.getRoomIndex @

    getRandom: () ->
        return Math.floor Math.random() * 100

    build: () ->
        @buildDummy()
        @itemGroup = new ItemGroup @game, null

        Pills = require("./Items/Pills").Pills
        SanityPotion = require("./Items/SanityPotion").SanityPotion
        Ammo = require("./Items/Ammo").Ammo
        Secret = require("./Items/Secrets/Secret").Secret

        pills = new Pills @game
        pills.add @itemGroup
        potion = new SanityPotion @game
        potion.add @itemGroup
        ammo = new Ammo @game
        ammo.add @itemGroup
        secret = new Secret @game
        secret.add @itemGroup

        @enemyGroup = new EnemyGroup @game, null
        enemy = new EnemyHorror @game
        enemy.x = @game.rnd.between(0, @game.width - enemy.width)
        enemy.y = @game.rnd.between(0, @game.height - enemy.height)
        @enemyGroup.add enemy

    buildDummy: () ->
        backTexture = @game.make.bitmapData 800, 600, 'backTexture', true
        backTexture.fill @game.rnd.between(25, 50), @game.rnd.between(50, 75), @game.rnd.between(25, 50), 1
        @backImg = @game.make.image 0, 0
        @backImg.loadTexture backTexture


