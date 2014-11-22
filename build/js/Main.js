(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var Player, gamestate;

Player = require("./Player").Player;

window.onload = function() {
  return window.game = new Phaser.Game(800, 600, Phaser.CANVAS, 'game-container', gamestate);
};

gamestate = {
  preload: function() {
    game.load.image('phaser', 'assets/img/phaser.png');
    return game.load.image('player', 'assets/img/obj/player.png');
  },
  create: function() {
    var pp;
    pp = new Player(game);
    return game.add.existing(pp);
  }
};



},{"./Player":2}],2:[function(require,module,exports){
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

exports.Player = (function(_super) {
  __extends(Player, _super);

  function Player(game) {
    var x, y;
    this.game = game;
    x = this.game.world.centerX;
    y = this.game.world.centerY;
    Player.__super__.constructor.call(this, this.game, x, y, 'player', 1);
    this.anchor.setTo(0.5, 0.5);
    return this;
  }

  return Player;

})(Phaser.Sprite);



},{}]},{},[1])
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi9ob21lL3RjcWwvQ29kZS9tYXNzaXZlLW9jdG8taGFwcGluZXNzL25vZGVfbW9kdWxlcy9ndWxwLWJyb3dzZXJpZnkvbm9kZV9tb2R1bGVzL2Jyb3dzZXJpZnkvbm9kZV9tb2R1bGVzL2Jyb3dzZXItcGFjay9fcHJlbHVkZS5qcyIsIi9ob21lL3RjcWwvQ29kZS9tYXNzaXZlLW9jdG8taGFwcGluZXNzL3NyYy9zY3JpcHRzL01haW4uY29mZmVlIiwiL2hvbWUvdGNxbC9Db2RlL21hc3NpdmUtb2N0by1oYXBwaW5lc3Mvc3JjL3NjcmlwdHMvUGxheWVyLmNvZmZlZSJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUFBQTtBQ0FBLElBQUEsaUJBQUE7O0FBQUEsTUFBQSxHQUFTLE9BQUEsQ0FBUSxVQUFSLENBQW1CLENBQUMsTUFBN0IsQ0FBQTs7QUFBQSxNQUdNLENBQUMsTUFBUCxHQUFnQixTQUFBLEdBQUE7U0FDWixNQUFNLENBQUMsSUFBUCxHQUFrQixJQUFBLE1BQU0sQ0FBQyxJQUFQLENBQVksR0FBWixFQUFpQixHQUFqQixFQUFzQixNQUFNLENBQUMsTUFBN0IsRUFBcUMsZ0JBQXJDLEVBQXVELFNBQXZELEVBRE47QUFBQSxDQUhoQixDQUFBOztBQUFBLFNBT0EsR0FDSTtBQUFBLEVBQUEsT0FBQSxFQUFTLFNBQUEsR0FBQTtBQUVMLElBQUEsSUFBSSxDQUFDLElBQUksQ0FBQyxLQUFWLENBQWdCLFFBQWhCLEVBQTBCLHVCQUExQixDQUFBLENBQUE7V0FDQSxJQUFJLENBQUMsSUFBSSxDQUFDLEtBQVYsQ0FBZ0IsUUFBaEIsRUFBMEIsMkJBQTFCLEVBSEs7RUFBQSxDQUFUO0FBQUEsRUFLQSxNQUFBLEVBQVEsU0FBQSxHQUFBO0FBRUosUUFBQSxFQUFBO0FBQUEsSUFBQSxFQUFBLEdBQVMsSUFBQSxNQUFBLENBQU8sSUFBUCxDQUFULENBQUE7V0FDQSxJQUFJLENBQUMsR0FBRyxDQUFDLFFBQVQsQ0FBa0IsRUFBbEIsRUFISTtFQUFBLENBTFI7Q0FSSixDQUFBOzs7OztBQ0VBLElBQUE7aVNBQUE7O0FBQUEsT0FBYSxDQUFDO0FBQ1YsMkJBQUEsQ0FBQTs7QUFBYSxFQUFBLGdCQUFFLElBQUYsR0FBQTtBQUNULFFBQUEsSUFBQTtBQUFBLElBRFUsSUFBQyxDQUFBLE9BQUEsSUFDWCxDQUFBO0FBQUEsSUFBQSxDQUFBLEdBQUksSUFBQyxDQUFBLElBQUksQ0FBQyxLQUFLLENBQUMsT0FBaEIsQ0FBQTtBQUFBLElBQ0EsQ0FBQSxHQUFJLElBQUMsQ0FBQSxJQUFJLENBQUMsS0FBSyxDQUFDLE9BRGhCLENBQUE7QUFBQSxJQUVBLHdDQUFNLElBQUMsQ0FBQSxJQUFQLEVBQWEsQ0FBYixFQUFnQixDQUFoQixFQUFtQixRQUFuQixFQUE2QixDQUE3QixDQUZBLENBQUE7QUFBQSxJQUdBLElBQUMsQ0FBQSxNQUFNLENBQUMsS0FBUixDQUFjLEdBQWQsRUFBbUIsR0FBbkIsQ0FIQSxDQUFBO0FBS0EsV0FBTyxJQUFQLENBTlM7RUFBQSxDQUFiOztnQkFBQTs7R0FEeUIsTUFBTSxDQUFDLE9BQXBDLENBQUEiLCJmaWxlIjoiZ2VuZXJhdGVkLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXNDb250ZW50IjpbIihmdW5jdGlvbiBlKHQsbixyKXtmdW5jdGlvbiBzKG8sdSl7aWYoIW5bb10pe2lmKCF0W29dKXt2YXIgYT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2lmKCF1JiZhKXJldHVybiBhKG8sITApO2lmKGkpcmV0dXJuIGkobywhMCk7dGhyb3cgbmV3IEVycm9yKFwiQ2Fubm90IGZpbmQgbW9kdWxlICdcIitvK1wiJ1wiKX12YXIgZj1uW29dPXtleHBvcnRzOnt9fTt0W29dWzBdLmNhbGwoZi5leHBvcnRzLGZ1bmN0aW9uKGUpe3ZhciBuPXRbb11bMV1bZV07cmV0dXJuIHMobj9uOmUpfSxmLGYuZXhwb3J0cyxlLHQsbixyKX1yZXR1cm4gbltvXS5leHBvcnRzfXZhciBpPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7Zm9yKHZhciBvPTA7bzxyLmxlbmd0aDtvKyspcyhyW29dKTtyZXR1cm4gc30pIiwiUGxheWVyID0gcmVxdWlyZShcIi4vUGxheWVyXCIpLlBsYXllclxuXG5cbndpbmRvdy5vbmxvYWQgPSAoKS0+XG4gICAgd2luZG93LmdhbWUgPSBuZXcgUGhhc2VyLkdhbWUoODAwLCA2MDAsIFBoYXNlci5DQU5WQVMsICdnYW1lLWNvbnRhaW5lcicsIGdhbWVzdGF0ZSk7XG5cblxuZ2FtZXN0YXRlID1cbiAgICBwcmVsb2FkOiAoKS0+XG4gICAgICAgICNnYW1lLmxvYWQuc3ByaXRlc2hlZXQoJ3BsYXllcicsICdhc3NldHMvaW1nL2R1ZGUucG5nJywgMzIsIDQ4KTtcbiAgICAgICAgZ2FtZS5sb2FkLmltYWdlKCdwaGFzZXInLCAnYXNzZXRzL2ltZy9waGFzZXIucG5nJyk7XG4gICAgICAgIGdhbWUubG9hZC5pbWFnZSgncGxheWVyJywgJ2Fzc2V0cy9pbWcvb2JqL3BsYXllci5wbmcnKTtcblxuICAgIGNyZWF0ZTogKCktPlxuICAgICAgICAjZ2FtZS5hZGQuc3ByaXRlKDAsIDAsICdwaGFzZXInKTtcbiAgICAgICAgcHAgPSBuZXcgUGxheWVyKGdhbWUpXG4gICAgICAgIGdhbWUuYWRkLmV4aXN0aW5nKHBwKVxuXG4iLCJcblxuY2xhc3MgZXhwb3J0cy5QbGF5ZXIgZXh0ZW5kcyBQaGFzZXIuU3ByaXRlXG4gICAgY29uc3RydWN0b3I6IChAZ2FtZSktPlxuICAgICAgICB4ID0gQGdhbWUud29ybGQuY2VudGVyWFxuICAgICAgICB5ID0gQGdhbWUud29ybGQuY2VudGVyWVxuICAgICAgICBzdXBlcihAZ2FtZSwgeCwgeSwgJ3BsYXllcicsIDEpXG4gICAgICAgIEBhbmNob3Iuc2V0VG8oMC41LCAwLjUpXG5cbiAgICAgICAgcmV0dXJuIEBcblxuIl19
