(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var Player, gamestate;

Player = require("./Player").Player;

window.onload = function() {
  return window.game = new Phaser.Game(800, 600, Phaser.CANVAS, 'game-container', gamestate);
};

gamestate = {
  preload: function() {
    console.log(new Player);
    return game.load.image('phaser', 'assets/img/phaser.png');
  },
  create: function() {
    return game.add.sprite(0, 0, 'phaser');
  }
};



},{"./Player":2}],2:[function(require,module,exports){
exports.Player = (function() {
  function Player() {
    console.log("HI");
  }

  return Player;

})();



},{}]},{},[1])
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi9ob21lL3RjcWwvQ29kZS9tYXNzaXZlLW9jdG8taGFwcGluZXNzL25vZGVfbW9kdWxlcy9ndWxwLWJyb3dzZXJpZnkvbm9kZV9tb2R1bGVzL2Jyb3dzZXJpZnkvbm9kZV9tb2R1bGVzL2Jyb3dzZXItcGFjay9fcHJlbHVkZS5qcyIsIi9ob21lL3RjcWwvQ29kZS9tYXNzaXZlLW9jdG8taGFwcGluZXNzL3NyYy9zY3JpcHRzL01haW4uY29mZmVlIiwiL2hvbWUvdGNxbC9Db2RlL21hc3NpdmUtb2N0by1oYXBwaW5lc3Mvc3JjL3NjcmlwdHMvUGxheWVyLmNvZmZlZSJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUFBQTtBQ0FBLElBQUEsaUJBQUE7O0FBQUEsTUFBQSxHQUFTLE9BQUEsQ0FBUSxVQUFSLENBQW1CLENBQUMsTUFBN0IsQ0FBQTs7QUFBQSxNQUdNLENBQUMsTUFBUCxHQUFnQixTQUFBLEdBQUE7U0FDWixNQUFNLENBQUMsSUFBUCxHQUFrQixJQUFBLE1BQU0sQ0FBQyxJQUFQLENBQVksR0FBWixFQUFpQixHQUFqQixFQUFzQixNQUFNLENBQUMsTUFBN0IsRUFBcUMsZ0JBQXJDLEVBQXVELFNBQXZELEVBRE47QUFBQSxDQUhoQixDQUFBOztBQUFBLFNBT0EsR0FDSTtBQUFBLEVBQUEsT0FBQSxFQUFTLFNBQUEsR0FBQTtBQUNMLElBQUEsT0FBTyxDQUFDLEdBQVIsQ0FBWSxHQUFBLENBQUEsTUFBWixDQUFBLENBQUE7V0FDQSxJQUFJLENBQUMsSUFBSSxDQUFDLEtBQVYsQ0FBZ0IsUUFBaEIsRUFBMEIsdUJBQTFCLEVBRks7RUFBQSxDQUFUO0FBQUEsRUFJQSxNQUFBLEVBQVEsU0FBQSxHQUFBO1dBQ0osSUFBSSxDQUFDLEdBQUcsQ0FBQyxNQUFULENBQWdCLENBQWhCLEVBQW1CLENBQW5CLEVBQXNCLFFBQXRCLEVBREk7RUFBQSxDQUpSO0NBUkosQ0FBQTs7Ozs7QUNFQSxPQUFhLENBQUM7QUFDRyxFQUFBLGdCQUFBLEdBQUE7QUFDVCxJQUFBLE9BQU8sQ0FBQyxHQUFSLENBQVksSUFBWixDQUFBLENBRFM7RUFBQSxDQUFiOztnQkFBQTs7SUFESixDQUFBIiwiZmlsZSI6ImdlbmVyYXRlZC5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzQ29udGVudCI6WyIoZnVuY3Rpb24gZSh0LG4scil7ZnVuY3Rpb24gcyhvLHUpe2lmKCFuW29dKXtpZighdFtvXSl7dmFyIGE9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtpZighdSYmYSlyZXR1cm4gYShvLCEwKTtpZihpKXJldHVybiBpKG8sITApO3Rocm93IG5ldyBFcnJvcihcIkNhbm5vdCBmaW5kIG1vZHVsZSAnXCIrbytcIidcIil9dmFyIGY9bltvXT17ZXhwb3J0czp7fX07dFtvXVswXS5jYWxsKGYuZXhwb3J0cyxmdW5jdGlvbihlKXt2YXIgbj10W29dWzFdW2VdO3JldHVybiBzKG4/bjplKX0sZixmLmV4cG9ydHMsZSx0LG4scil9cmV0dXJuIG5bb10uZXhwb3J0c312YXIgaT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2Zvcih2YXIgbz0wO288ci5sZW5ndGg7bysrKXMocltvXSk7cmV0dXJuIHN9KSIsIlBsYXllciA9IHJlcXVpcmUoXCIuL1BsYXllclwiKS5QbGF5ZXJcblxuXG53aW5kb3cub25sb2FkID0gKCktPlxuICAgIHdpbmRvdy5nYW1lID0gbmV3IFBoYXNlci5HYW1lKDgwMCwgNjAwLCBQaGFzZXIuQ0FOVkFTLCAnZ2FtZS1jb250YWluZXInLCBnYW1lc3RhdGUpO1xuXG5cbmdhbWVzdGF0ZSA9XG4gICAgcHJlbG9hZDogKCktPlxuICAgICAgICBjb25zb2xlLmxvZyhuZXcgUGxheWVyKVxuICAgICAgICBnYW1lLmxvYWQuaW1hZ2UoJ3BoYXNlcicsICdhc3NldHMvaW1nL3BoYXNlci5wbmcnKTtcblxuICAgIGNyZWF0ZTogKCktPlxuICAgICAgICBnYW1lLmFkZC5zcHJpdGUoMCwgMCwgJ3BoYXNlcicpO1xuXG4iLCJcblxuY2xhc3MgZXhwb3J0cy5QbGF5ZXJcbiAgICBjb25zdHJ1Y3RvcjogKCktPlxuICAgICAgICBjb25zb2xlLmxvZyBcIkhJXCJcbiJdfQ==
