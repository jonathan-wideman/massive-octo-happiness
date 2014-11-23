

class exports.ScreenFlash
	constructor: (@game)->
		@bmp = @game.make.bitmapData 800, 600
		@setColor 0, 255, 0, .5

		@img = @game.make.image 0, 0
		@img.loadTexture @bmp
		@img.alpha = 0


	add: ()->
		@game.add.existing @img


	setColor: (r, g, b, a = 1)=>
		@bmp.fill r, g, b, a


	flash: (time, r, g, b, a)->
		@setColor r, g, b, a
		@img.alpha = 1

		tween = @game.add.tween(@img).to {alpha: 0}, time, Phaser.Easing.Cubic.Out
		tween.start()