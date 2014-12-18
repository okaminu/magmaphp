<?php
 function uri($dalis)
 {
     $adresas_dalys= explode("/", $_SERVER["REQUEST_URI"]);

     return $adresas_dalys[$dalis+1];

 }

function __autoload($class)
{
 $adresasC="Controller/".$class.".php";
 $adresasL="Library/".$class.".php";
 $adresasM="Model/".$class.".php";

    if(file_exists($adresasC))
require_once($adresasC);
     elseif(file_exists($adresasL))
require_once($adresasL);
    elseif(file_exists($adresasM))
        require_once($adresasM);
     else {
         echo "Adresas neegzistuoja";
        exit;
     }


}

function bazinisURL()
{


 return $_SERVER["SERVER_NAME"];



}

function view($views, $obj,$layout=true, $type="php")
{
  //Unpacking Arrays into Objects and Variables
if(is_array($obj))
{
foreach($obj as $key => $value)
{
$$key = $value;
}
}

//-----Generating View (w/ Layout)---------
if($layout)
include("View/Layout/Header.php");

include("View/".$views.".".$type);

if($layout)
include("View/Layout/Footer.php");

}

function controller($control)
{
 $segment=explode("/", $control);
 $controller=$segment[0];
 $action=$segment[1];
 $controlOBJ=new $controller();

    if(method_exists($controlOBJ, $action ))
    {
      $controlOBJ->$action();

    }
    else
    {
        echo "Adresas Nerastas";


    }

}

