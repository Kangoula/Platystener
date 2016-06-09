<?php

include_once '../Base.php';

/**
 * Représente les Playlists par utilisateur du site
 */
class Playlist {

    private $user_id;
    private $playlist_id;
    private $playlist_name;

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
     * Suppression dans la base de données
     *  
     * Supprime la ligne de la table correspondant à l'objet courant
     * @throws Exception 
     */
    public function delete() {
        $query = "delete from playlists where playlist_id=?";
        try {
            $db = Base::getConnection();

            $pp = $db->prepare($query);

            $pp->bindParam(1, $this->playlist_id, PDO::PARAM_INT);
            $pp->execute();
        } catch (PDOException $e) {
            echo $query . "<br>";
            throw new Exception($e->getMessage());
        }
    }

    /**
     * Insertion dans la BDD
     * 
     * Insère l'objet courant dans le BDD
     * @throws Exception
     */
    public function insert() {
        $query = "insert into playlists (user_id,playlist_name) values (?,?)";
        try {
            $db = Base::getConnection();

            $pp = $db->prepare($query);

            $pp->bindParam(1, $this->user_id, PDO::PARAM_INT);
            $pp->bindParam(2, $this->playlist_name, PDO::PARAM_STR);

            $pp->execute();
            $this->playlist_id = $db->LastInsertId();
        } catch (PDOException $e) {
            echo $query . "<br>";
            throw new Exception($e->getMessage());
        }
    }

    /**
     * Trouver une playlist par son ID
     * 
     * Retourne la ligne de la table correspondant à l'ID passé en paramètre
     * @param $id l'identifiant à chercher
     * @return l'user correspondant
     */
    public static function findById($id) {
        $query = "select * from playlists where playlist_id=?";
        try {
            $db = Base::getConnection();

            $pp = $db->prepare($query);

            $pp->bindParam(1, $id, PDO::PARAM_INT);
            $pp->execute();

            /* retourne un tableau indexé par les noms de colonnes 
             * et aussi par les numéros de colonnes, 
             * commençant à l'index 0
             */
            $rep = $pp->fetch(PDO::FETCH_ASSOC);
            
        } catch (PDOException $e) {
            echo $query . "<br>";
            throw new Exception($e->getMessage());
        }
        return $rep;
    }

    /**
     * Retourne toutes les playlists contenues dans la BDD
     * 
     * @return Un tableau de playlists
     * @throws Exception
     */
    public static function findAll() {
        $query = "select * from playlists ";
        try {
            $db = Base::getConnection();

            $pp = $db->prepare($query);
            $pp->execute();

            //creation d'un tableau d'objets user
            $rep = $pp->fetchAll(PDO::FETCH_OBJ);
            $playlists = array();

            //pour chaque user renvoyé par la requète on va l'ajouter dans un tableau
            foreach ($rep as $row) {
                $pl = array(
                    'user_id' => $row->user_id,
                    'playlist_id' => $row->playlist_id,
                    'playlist_name' => $row->playlist_name
                );
                $playlists[] = $pl;
            }
        } catch (PDOException $e) {
            echo $query . "<br>";
            throw new Exception($e->getMessage());
        }

        return $playlists;
    }

    /**
     * Recherche une playlist en fonction du nom d'utilisateur
     * 
     * @param type $user_id
     * @return \Playlist
     * @throws Exception
     */
    public static function findByUser($user_id) {
        //l'utilisateur par défaut est l'utilisateur 1
        $query = "select * from playlists where user_id=? or user_id=1";
        try {
            $db = Base::getConnection();

            $pp = $db->prepare($query);

            $pp->bindParam(1, $user_id, PDO::PARAM_INT);
                        
            $pp->execute();

            //creation d'un tableau d'objets user
            $rep = $pp->fetchAll(PDO::FETCH_OBJ);
            $playlists = array();

            //pour chaque user renvoyé par la requète on va l'ajouter dans un tableau
            foreach ($rep as $row) {
                $pl = array(
                    'user_id' => $row->user_id,
                    'playlist_id' => $row->playlist_id,
                    'playlist_name' => $row->playlist_name
                );
                $playlists[] = $pl;
            }
        } catch (PDOException $e) {
            echo $query . "<br>";
            throw new Exception($e->getMessage());
        }
        return $playlists;
    }

}
