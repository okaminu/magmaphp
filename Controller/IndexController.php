<?php
class IndexController
{
  public function __construct(){

  }
    public function index()
    {
        $welcome="Welcome to MagmaPHP, a simple PHP MVC Framework";
        $version="Developed by AurimasDGT (aurimasdgt@gmail.com)<br>MagmaPHP 0.7";
     $model=new IndexModel();
     $model->setLogo("view/images/Logo.png") ;
     $model->setText($welcome);



        view("IndexView", array("obj" => $model, "version" => $version));
    }

}