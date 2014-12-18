<?php
require_once("System/helpers.php");

$controller=uri(0) ? uri(0): "IndexController";
$action=uri(1) ? uri(1): "index";
$controller=htmlspecialchars($controller);
$action=htmlspecialchars($action);

$controllerOBJ= new $controller();


if(method_exists($controllerOBJ, $action))
$controllerOBJ->$action();
else
{
echo "Adresas Neegzistuoja";
 exit;
}