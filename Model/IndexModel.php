<?php
class IndexModel
{
   private $text;
   private $logo;
function  __construct()
{


}
    public  function setText($text)
    {
     $this->text=$text;


    }
    public  function setlogo($logo)
    {
        $this->logo=$logo;


    }

    public function  getText()
    {
     return $this->text;


    }

    public function  getLogo()
    {
        return $this->logo;


    }



}