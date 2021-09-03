// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

$(function() {
  var height=$("#header").height();
  $("body").css("margin-top", height + 10);//10pxだけ余裕をもたせる
});