--TEST--
Test connection pool accepts limits
--INI--
riak.persistent.connections=20
riak.persistent.timeout=2000
--FILE--
<?php
include_once "connect.inc";

use Riak\PoolInfo;
use Riak\Connection;

$clients = array();

for ($i=0; $i<25; ++$i) {
    $clients[] = new Connection($host, $port);
}

echo 'active connection     : ' . PoolInfo::getNumActiveConnection().PHP_EOL;

foreach ($clients as $client) {
    $client->ping();
}

echo 'active connection     : ' . PoolInfo::getNumActiveConnection().PHP_EOL;
echo 'persistent connection : ' . PoolInfo::getNumActivePersistentConnection().PHP_EOL;

$clients = NULL;

echo 'active connection     : ' . PoolInfo::getNumActiveConnection().PHP_EOL;
echo 'persistent connection : ' . PoolInfo::getNumActivePersistentConnection().PHP_EOL;
echo 'reconnect             : ' . PoolInfo::getNumReconnect().PHP_EOL;
?>
--EXPECT--
active connection     : 0
active connection     : 25
persistent connection : 20
active connection     : 0
persistent connection : 0
reconnect             : 0
