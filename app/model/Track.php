<?php

include_once '../Base.php';

/**
 * Représente les chansons
 */
class Track {

    private $track_id;
    private $artist_id;
    private $title;
    private $mp3_url;

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
     * Trouver un titre par son ID
     * 
     * Retourne la ligne de la table correspondant à l'ID passé en paramètre
     * @param $id l'identifiant à chercher
     * @return l'user correspondant
     */
    public static function findById($id) {
        $query = "select * from tracks where track_id=?";
        try {
            $db = Base::getConnection();

            $pp = $db->prepare($query);

            $pp->bindParam(1, $id, PDO::PARAM_INT);
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
     * Retourne tous les titres contenus dans le BDD
     * 
     * @return array[][]
     * @throws Exception
     */
    public static function findAll() {
        $query = "select * from tracks";
        try {
            $db = Base::getConnection();

            $pp = $db->prepare($query);
            $pp->execute();

            //creation d'un tableau d'objets Track
            $rep = $pp->fetchAll(PDO::FETCH_OBJ);
            //la liste des Track sera représentée par un tableau
            $tracklist = array();

            //pour chaque objet Track renvoyé par la requète
            foreach ($rep as $row) {
                //une Track sera représentée par un tableau
                $track = array(
                    'track_id' => $row->track_id,
                    'artist_id' => $row->artist_id,
                    'title' => $row->title,
                    'mp3_url' => $row->mp3_url
                );
                //on ajoute la Track a la liste
                $tracklist[] = $track;
            }
        } catch (PDOException $e) {
            echo $query . "<br>";
            throw new Exception($e->getMessage());
        }

        return $tracklist;
    }

    /**
     * Recherche une chanson avec son titre
     * 
     * @param type $title
     * @return array
     * @throws Exception
     */
    public static function findByTitle($title) {
        $title = "%$title%";
        $query = "select * from tracks where title like ?";
        try {
            $db = Base::getConnection();

            $pp = $db->prepare($query);

            $pp->bindParam(1, $title, PDO::PARAM_STR);
            $pp->execute();

            //retourne un tableau indexé par les noms de colonnes 
            $rep = $pp->fetchAll(PDO::FETCH_OBJ);
            
            $tracklist = array();

            //pour chaque objet Track renvoyé par la requète
            foreach ($rep as $row) {
                //une Track sera représentée par un tableau
                $track = array(
                    'track_id' => $row->track_id,
                    'artist_id' => $row->artist_id,
                    'title' => $row->title,
                    'mp3_url' => $row->mp3_url
                );
                //on ajoute la Track a la liste
                $tracklist[] = $track;
            }
        } catch (PDOException $e) {
            echo $query . "<br>";
            throw new Exception($e->getMessage());
        }
        return $tracklist;
    }

    /**
     * Recherche les chansons d'un artiste donné
     * @param int $artist_id
     * @return array[][]
     * @throws Exception
     */
    public static function findByArtist($artist_id) {
        $query = "select * from tracks where artist_id=?";
        try {
            $db = Base::getConnection();

            $pp = $db->prepare($query);

            $pp->bindParam(1, $artist_id, PDO::PARAM_INT);
            $pp->execute();
            
            //retourne un tableau d'objets Track
            $rep = $pp->fetchAll(PDO::FETCH_OBJ);
            //initialiation de la liste de chansons
            $tracklist = array();

            //pour chaque track renvoyée par la requète on va l'ajouter dans un tableau
            foreach ($rep as $row) {
                //une chanson est représentée par un tableau
                $track = array(
                    'track_id' => $row->track_id,
                    'artist_id' => $row->artist_id,
                    'title' => $row->title,
                    'mp3_url' => $row->mp3_url
                );
                //ajoute la chanson dans la liste
                $tracklist[] = $track;
            }
        } catch (PDOException $e) {
            echo $query . "<br>";
            throw new Exception($e->getMessage());
        }
        return $tracklist;
    }

}
