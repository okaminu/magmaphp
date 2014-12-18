<?php
class Registry
{
  static private $store=array();



  static public function add($object, $name)
  {
    //$name=(is_null($name)) ?: get_class($object);
    //$name=strtolower($name);
     if(is_null($name))
         throw new Exception("Regsitry name is not given");
      if(is_null($object))
          throw new Exception("Regsitry object is not given");



    if(isset(self::$store[$name]))
    {
        throw new Exception("Object with given name already exists");
    }
      else
      {
       self::$store[$name]=$object;

      }

  }

    static public function contains($name)
    {
      if(!isset(self::$store[$name]))
      {
          return false;
      }
      else
      {   return true;


      }




    }
    static public function get($name)
    {
      if(!isset(self::$store[$name]))
      {
          throw new Exception("Object with given name doesn't exist");

      }
        else
        {
         return self::$store[$name];


        }

    }
        static public function remove($name)
    {
        if(!isset(self::$store[$name]))
        {
            throw new Exception("Object with given name doesn't exist");

        }
        else
        {
            unset(self::$store[$name]);


        }


    }

}
