(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
console.log("hi");

window.onload = function() {
  var create, preload;
  preload = function() {
    return game.load.image('phaser', 'assets/img/phaser.png');
  };
  create = function() {
    return game.add.sprite(0, 0, 'phaser');
  };
  return window.game = new Phaser.Game(800, 600, Phaser.CANVAS, 'game-container', {
    preload: preload,
    create: create
  });
};



},{}]},{},[1])
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi9ob21lL3RjcWwvQ29kZS9tYXNzaXZlLW9jdG8taGFwcGluZXNzL25vZGVfbW9kdWxlcy9ndWxwLWJyb3dzZXJpZnkvbm9kZV9tb2R1bGVzL2Jyb3dzZXJpZnkvbm9kZV9tb2R1bGVzL2Jyb3dzZXItcGFjay9fcHJlbHVkZS5qcyIsIi9ob21lL3RjcWwvQ29kZS9tYXNzaXZlLW9jdG8taGFwcGluZXNzL3NyYy9zY3JpcHRzL01haW4uY29mZmVlIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0FDQUEsT0FBTyxDQUFDLEdBQVIsQ0FBWSxJQUFaLENBQUEsQ0FBQTs7QUFBQSxNQUdNLENBQUMsTUFBUCxHQUFnQixTQUFBLEdBQUE7QUFFWixNQUFBLGVBQUE7QUFBQSxFQUFBLE9BQUEsR0FBVSxTQUFBLEdBQUE7V0FDTixJQUFJLENBQUMsSUFBSSxDQUFDLEtBQVYsQ0FBZ0IsUUFBaEIsRUFBMEIsdUJBQTFCLEVBRE07RUFBQSxDQUFWLENBQUE7QUFBQSxFQUdBLE1BQUEsR0FBUyxTQUFBLEdBQUE7V0FDTCxJQUFJLENBQUMsR0FBRyxDQUFDLE1BQVQsQ0FBZ0IsQ0FBaEIsRUFBbUIsQ0FBbkIsRUFBc0IsUUFBdEIsRUFESztFQUFBLENBSFQsQ0FBQTtTQU1BLE1BQU0sQ0FBQyxJQUFQLEdBQWtCLElBQUEsTUFBTSxDQUFDLElBQVAsQ0FBWSxHQUFaLEVBQWlCLEdBQWpCLEVBQXNCLE1BQU0sQ0FBQyxNQUE3QixFQUFxQyxnQkFBckMsRUFBdUQ7QUFBQSxJQUFFLE9BQUEsRUFBUyxPQUFYO0FBQUEsSUFBb0IsTUFBQSxFQUFRLE1BQTVCO0dBQXZELEVBUk47QUFBQSxDQUhoQixDQUFBIiwiZmlsZSI6ImdlbmVyYXRlZC5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzQ29udGVudCI6WyIoZnVuY3Rpb24gZSh0LG4scil7ZnVuY3Rpb24gcyhvLHUpe2lmKCFuW29dKXtpZighdFtvXSl7dmFyIGE9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtpZighdSYmYSlyZXR1cm4gYShvLCEwKTtpZihpKXJldHVybiBpKG8sITApO3Rocm93IG5ldyBFcnJvcihcIkNhbm5vdCBmaW5kIG1vZHVsZSAnXCIrbytcIidcIil9dmFyIGY9bltvXT17ZXhwb3J0czp7fX07dFtvXVswXS5jYWxsKGYuZXhwb3J0cyxmdW5jdGlvbihlKXt2YXIgbj10W29dWzFdW2VdO3JldHVybiBzKG4/bjplKX0sZixmLmV4cG9ydHMsZSx0LG4scil9cmV0dXJuIG5bb10uZXhwb3J0c312YXIgaT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2Zvcih2YXIgbz0wO288ci5sZW5ndGg7bysrKXMocltvXSk7cmV0dXJuIHN9KSIsImNvbnNvbGUubG9nIFwiaGlcIlxuXG5cbndpbmRvdy5vbmxvYWQgPSAoKS0+XG5cbiAgICBwcmVsb2FkID0gKCktPlxuICAgICAgICBnYW1lLmxvYWQuaW1hZ2UoJ3BoYXNlcicsICdhc3NldHMvaW1nL3BoYXNlci5wbmcnKTtcblxuICAgIGNyZWF0ZSA9ICgpLT5cbiAgICAgICAgZ2FtZS5hZGQuc3ByaXRlKDAsIDAsICdwaGFzZXInKTtcblxuICAgIHdpbmRvdy5nYW1lID0gbmV3IFBoYXNlci5HYW1lKDgwMCwgNjAwLCBQaGFzZXIuQ0FOVkFTLCAnZ2FtZS1jb250YWluZXInLCB7IHByZWxvYWQ6IHByZWxvYWQsIGNyZWF0ZTogY3JlYXRlIH0pO1xuIl19
