App.conversation = App.cable.subscriptions.create("NotificationChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    alert(data["message"]);
  },
  speak: function(message) {}
});
