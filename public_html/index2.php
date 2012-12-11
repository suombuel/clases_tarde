<?php
try {
$client = new SoapClient('http://api.google.com/GoogleSearch.wsdl');
$results = $client->doGoogleSearch($key, $query, 0, 10, FALSE, '',
FALSE, '', '', '');
foreach ($results->resultElements as $result) {
echo '<a href="' . htmlentities($result->URL) . '">';
echo htmlentities($result->title, ENT_COMPAT, 'UTF-8');
echo '</a><br/>';
}
}
catch (SoapFault $e) {
echo $e->getMessage();
}

