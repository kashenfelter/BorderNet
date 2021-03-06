<!doctype html>
<html>
<head>
<title>SockJS Test</title>
<script src="http://cdn.sockjs.org/sockjs-0.2.1.min.js"></script>
</head>
<body>

	<script>
		var sock = new SockJS('http://localhost:8585/events');
		sock.onopen = function() {
			console.log('open');
		};
		sock.onmessage = function(e) {
			console.log('message', e.data);
			alert('received message echoed from server: ' + e.data);
		};
		sock.onclose = function() {
			console.log('close');
		};

		function send(message) {

			if (sock.readyState == WebSocket.OPEN) {
				console.log("sending message")
				sock.send(message);
			} else {
				console.log("The socket is not open.");
			}
		}
	</script>
	<form onsubmit="return false;">
		<input type="text" name="message" value="Hello, World!" /> <input
			type="button" value="Send SockJS data"
			onclick="send(this.form.message.value)" />
	</form>
</body>
</html>