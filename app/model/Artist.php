<?php

include_once '../Base.php';

/**
 * Représente un artiste
 * Les attributs sont les mêmes que les colonnes de la table artiste dans la BDD
 */
class Artist {

    private $artist_id; 
    private $name;
    private $image_url; //l'url de l'image de cet artiste
    private $info; //les informations sur cet artiste

    /**
     * Constructeur
     */
    public function __construct() {
        
    }

    /**
     * Fonction d'accès aux attributs d'un objet
     * @param $name le nom de l'attribut
     * @return la valeur de l'attribut
     */
    public function __get($name) {
        //si l'attribut existe on retourne sa valeur
        if (property_exists(__CLASS__, $name)) {
            return $this->$name;
        }
    }

    /**
     * Fonction de modification des attributs d'un objet
     * @param $name le nom de l'attribut à modifier
     * @param $value la valeur de l'attribut à modifier
     */
    public function __set($name, $value) {
        //si l'attribut existe on modifie sa valeur
        if (property_exists(__CLASS__, $name)) {
            $this->$name = $value;
        }
    }

    /**
     * Trouver un artiste par son ID
     * 
     * Retourne la ligne de la table correspondant à l'ID passé en paramètre
     * @param int $id
     * @return l'artiste sous forme d'un tableau
     */
    public static function findById($id) {
        //requète
        $query = "select * from artists where artist_id=?";
        try {
            //connexion à la BDD
            $db = Base::getConnection();

            $pp = $db->prepare($query);
            
            //définition des paramètres
            $pp->bindParam(1, $id, PDO::PARAM_INT);
            //rexecution de la requète
            $pp->execute();

            //retourne un tableau indexé par les noms de colonnes 
            $rep = $pp->fetch(PDO::FETCH_ASSOC);
            
        } catch (PDOException $e) {
            echo $query . "<br>";
            throw new Exception($e->getMessage());
        }
        return $rep;
    }

    /**
     * Retourne tous les artistes contenus dans le BDD
     */
    public static function findAll() {
        $query = "select * from artists ";
        try {   
            $db = Base::getConnection();

            $pp = $db->prepare($query);
            $pp->execute();

            //retourne un tableau d'objets artiste
            $rep = $pp->fetchAll(PDO::FETCH_OBJ);
            //création du tableau de réponse
            $artistlist = array();

            //pour chaque artiste renvoyé par la requète on va l'ajouter dans un tableau
            foreach ($rep as $row) {
                //un artiste est représenté par un tableau
                $artist = array(
                    'artist_id' => $row->artist_id,
                    'name' => $row->name,
                    'image_url' => $row->image_url,
                    'info' => $row->info
                );
                //ajout de l'artiste au tableau
                $artistlist[] = $artist;
            }
        } catch (PDOException $e) {
            echo $query . "<br>";
            throw new Exception($e->getMessage());
        }

        return $artistlist;
    }

    /**
     * Renvoit l'artiste dont le nom est passé en paramètre
     * 
     * @param string $name 
     * @return \Artist
     */
    public static function findByName($name) {
        $val = "%$name%";
        $query = "select * from artists where name like ?";
        try {
            $db = Base::getConnection();

            $pp = $db->prepare($query);

            $pp->bindParam(1, $val, PDO::PARAM_STR);
            $pp->execute();
            
            // retourne un tableau indexé par les noms de colonnes et par numero
            $rep = $pp->fetchAll(PDO::FETCH_OBJ);
            //création du tableau de réponse
            $artistlist = array();

            //pour chaque artiste renvoyé par la requète on va l'ajouter dans un tableau
            foreach ($rep as $row) {
                //un artiste est représenté par un tableau
                $artist = array(
                    'artist_id' => $row->artist_id,
                    'name' => $row->name,
                    'image_url' => $row->image_url,
                    'info' => $row->info
                );
                //ajout de l'artiste au tableau
                $artistlist[] = $artist;
            }
           
        } catch (PDOException $e) {
            echo $query . "<br>";
            throw new Exception($e->getMessage());
        }
        return $artistlist;
    }
}
