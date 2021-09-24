<?php 
$ipFilename = "hazel_ip.txt";
$port = "58306";

if (strcasecmp($_SERVER['REQUEST_METHOD'], 'POST') != 0){
$ipfile = fopen($ipFilename, "r") or die("Unable to open file!");
$ip = trim(fread($ipfile, 15));
fclose($ipfile);

header('Location: //' . $ip . ':' . $port);
exit();
}
else {
$ipaddress = $_POST['ipaddress'];

$ipfile = fopen($ipFilename, "w") or die("Unable to open file!");
fwrite($ipfile, $ipaddress);
fclose($ipfile);
}
?>
