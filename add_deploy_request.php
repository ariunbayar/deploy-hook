<?php
/*
 * HOOK
 */
$passcode = 'pAsswOrd';
if ($_GET['code'] == $passcode) {
    $filename = dirname(__FILE__).'/deploy_requests';
    $value = date("Y-m-d H:i:s\n");
    file_put_contents($filename, $value, FILE_APPEND);
    echo "deployment requested!";
}
?>
