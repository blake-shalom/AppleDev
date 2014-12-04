<?php

// Put your device token here (without spaces):
$deviceToken = 'b040b8d395b5ec764d9351227eb7b092018545793f9f3e396cc106a5585fd5b1';

// Put your private key's passphrase here:
$passphrase = '12#BYXsp2011';

// Put your alert message here:
$message = 'Boody doo';

////////////////////////////////////////////////////////////////////////////////

$ctx = stream_context_create();
stream_context_set_option($ctx, 'ssl', 'local_cert', 'ck.pem');
stream_context_set_option($ctx, 'ssl', 'passphrase', $passphrase);

// Open a connection to the APNS server
$fp = stream_socket_client(
	'ssl://gateway.sandbox.push.apple.com:2195', $err,
	$errstr, 60, STREAM_CLIENT_CONNECT|STREAM_CLIENT_PERSISTENT, $ctx);

if (!$fp)
	exit("Failed to connect: $err $errstr" . PHP_EOL);

echo 'Connected to APNS' . PHP_EOL;

// Create the payload body
$body['aps'] = array(
	'alert' => array(
		"body" => "Push notification Blog test",
		"action-loc-key" => "PLAY"
		),
	'sound' => 'default',
    'badge' => 0,
    'content-available' => 1
	);
$body['content-payload'] = array(
	'content-type' => 'blog'
	);

// Encode the payload as JSON
$payload = json_encode($body);

// Build the binary notification
$msg = chr(0) . pack('n', 32) . pack('H*', $deviceToken) . pack('n', strlen($payload)) . $payload;

// Send it to the server
$result = fwrite($fp, $msg, strlen($msg));

if (!$result)
	echo 'Message not delivered' . PHP_EOL;
else
	echo 'Message successfully delivered' . PHP_EOL;

// Close the connection to the server
fclose($fp);
