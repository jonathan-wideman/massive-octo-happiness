(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
console.log("hi");

window.onload = function() {
  var create, preload;
  preload = function() {
    return game.load.image('phaser', 'phaser.png');
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
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi9ob21lL3RjcWwvQ29kZS9tYXNzaXZlLW9jdG8taGFwcGluZXNzL25vZGVfbW9kdWxlcy9ndWxwLWJyb3dzZXJpZnkvbm9kZV9tb2R1bGVzL2Jyb3dzZXJpZnkvbm9kZV9tb2R1bGVzL2Jyb3dzZXItcGFjay9fcHJlbHVkZS5qcyIsIi9ob21lL3RjcWwvQ29kZS9tYXNzaXZlLW9jdG8taGFwcGluZXNzL3NjcmlwdHMvTWFpbi5jb2ZmZWUiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7QUNBQSxPQUFPLENBQUMsR0FBUixDQUFZLElBQVosQ0FBQSxDQUFBOztBQUFBLE1BR00sQ0FBQyxNQUFQLEdBQWdCLFNBQUEsR0FBQTtBQUVaLE1BQUEsZUFBQTtBQUFBLEVBQUEsT0FBQSxHQUFVLFNBQUEsR0FBQTtXQUNOLElBQUksQ0FBQyxJQUFJLENBQUMsS0FBVixDQUFnQixRQUFoQixFQUEwQixZQUExQixFQURNO0VBQUEsQ0FBVixDQUFBO0FBQUEsRUFHQSxNQUFBLEdBQVMsU0FBQSxHQUFBO1dBQ0wsSUFBSSxDQUFDLEdBQUcsQ0FBQyxNQUFULENBQWdCLENBQWhCLEVBQW1CLENBQW5CLEVBQXNCLFFBQXRCLEVBREs7RUFBQSxDQUhULENBQUE7U0FNQSxNQUFNLENBQUMsSUFBUCxHQUFrQixJQUFBLE1BQU0sQ0FBQyxJQUFQLENBQVksR0FBWixFQUFpQixHQUFqQixFQUFzQixNQUFNLENBQUMsTUFBN0IsRUFBcUMsZ0JBQXJDLEVBQXVEO0FBQUEsSUFBRSxPQUFBLEVBQVMsT0FBWDtBQUFBLElBQW9CLE1BQUEsRUFBUSxNQUE1QjtHQUF2RCxFQVJOO0FBQUEsQ0FIaEIsQ0FBQSIsImZpbGUiOiJnZW5lcmF0ZWQuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlc0NvbnRlbnQiOlsiKGZ1bmN0aW9uIGUodCxuLHIpe2Z1bmN0aW9uIHMobyx1KXtpZighbltvXSl7aWYoIXRbb10pe3ZhciBhPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7aWYoIXUmJmEpcmV0dXJuIGEobywhMCk7aWYoaSlyZXR1cm4gaShvLCEwKTt0aHJvdyBuZXcgRXJyb3IoXCJDYW5ub3QgZmluZCBtb2R1bGUgJ1wiK28rXCInXCIpfXZhciBmPW5bb109e2V4cG9ydHM6e319O3Rbb11bMF0uY2FsbChmLmV4cG9ydHMsZnVuY3Rpb24oZSl7dmFyIG49dFtvXVsxXVtlXTtyZXR1cm4gcyhuP246ZSl9LGYsZi5leHBvcnRzLGUsdCxuLHIpfXJldHVybiBuW29dLmV4cG9ydHN9dmFyIGk9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtmb3IodmFyIG89MDtvPHIubGVuZ3RoO28rKylzKHJbb10pO3JldHVybiBzfSkiLCJjb25zb2xlLmxvZyBcImhpXCJcblxuXG53aW5kb3cub25sb2FkID0gKCktPlxuXG4gICAgcHJlbG9hZCA9ICgpLT5cbiAgICAgICAgZ2FtZS5sb2FkLmltYWdlKCdwaGFzZXInLCAncGhhc2VyLnBuZycpO1xuXG4gICAgY3JlYXRlID0gKCktPlxuICAgICAgICBnYW1lLmFkZC5zcHJpdGUoMCwgMCwgJ3BoYXNlcicpO1xuXG4gICAgd2luZG93LmdhbWUgPSBuZXcgUGhhc2VyLkdhbWUoODAwLCA2MDAsIFBoYXNlci5DQU5WQVMsICdnYW1lLWNvbnRhaW5lcicsIHsgcHJlbG9hZDogcHJlbG9hZCwgY3JlYXRlOiBjcmVhdGUgfSk7XG4iXX0=
