<?php

include_once '../Base.php';

/**
 * Représente les Playlists du site
 */
class PlaylistTracks {

    private $playlist_id;
    private $position;
    private $track_id;

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
        $query = "delete from playlists_tracks where playlist_id=? and track_id=?";
        try {
            $db = Base::getConnection();

            $pp = $db->prepare($query);

            $pp->bindParam(1, $this->playlist_id, PDO::PARAM_INT);
            $pp->bindParam(2, $this->track_id, PDO::PARAM_INT);
            $pp->execute();
        } catch (PDOException $ex) {
            echo $query . "<br>";
            throw new Exception($ex->getMessage());
        }
    }

    /**
     * Insertion dans la BDD
     * 
     * Insère l'objet courant dans le BDD
     * @throws Exception
     */
    public function insert() {
        $query = "insert into playlists_tracks (track_id, playlist_id, position) values (?,?,?)";
        $q2 = "select MAX(position) from playlists_tracks where playlist_id=?";
        try {
            $db = Base::getConnection();
            
            //on récupère la position du dernier titre de cette playlist
            $ppq2 = $db->prepare($q2);
            $ppq2->bindParam(1, $this->playlist_id, PDO::PARAM_INT);
            
            $ppq2->execute();
            
            $r1 = $ppq2->fetch(PDO::FETCH_ASSOC);
            $this->position = $r1['MAX(position)']+1;
            
            echo $this->position;
            
            $pp = $db->prepare($query);

            $pp->bindParam(1, $this->track_id, PDO::PARAM_INT);
            $pp->bindParam(2, $this->playlist_id, PDO::PARAM_INT);
            $pp->bindParam(3, $this->position, PDO::PARAM_INT);
            
            $pp->execute();
            
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
     * @return array
     */
    public static function findById($id) {
        //on récupère les playlistTracks d'une playlist donnée ordonnées par leur position
         $query = "select * from playlists_tracks where playlist_id=? order by position";
        try {
            $db = Base::getConnection();

            $pp = $db->prepare($query);
            
            $pp->bindParam(1, $id, PDO::PARAM_INT);
            $pp->execute();

            //creation d'un tableau d'objets playlistTracks
            $rep = $pp->fetchAll(PDO::FETCH_OBJ);
            $playlists = array();

            //pour chaque entitée renvoyée par la requète on va l'ajouter dans un tableau
            foreach ($rep as $row) {
                $pl = array(
                    'playlist_id' => $row->playlist_id,
                    'track_id' => $row->track_id,
                    'position' => $row->position
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
     * Retourne toutes les playlists contenues dans la BDD
     * 
     * @return array
     * @throws Exception
     */
    public static function findAll() {
        $query = "select * from playlists_tracks";
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
                    'playlist_id' => $row->playlist_id,
                    'track_id' => $row->track_id,
                    'position' => $row->position
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
     * Recherche une chanson donnée dans une playlist donnée
     * @param int $playlist_id
     * @param int $track_id
     * @return array
     * @throws Exception
     */
    public static function findByPlaylistAndTrackId($playlist_id, $track_id) {
        //on récupère la PlaylistTrack
         $query = "select * from playlists_tracks where playlist_id=? and track_id=?";
        try {
            $db = Base::getConnection();

            $pp = $db->prepare($query);
            
            $pp->bindParam(1, $playlist_id, PDO::PARAM_INT);
            $pp->bindParam(2, $track_id, PDO::PARAM_INT);
            $pp->execute();

            //creation d'un tableau contenant les informations renvoyées par la BDD
            $rep = $pp->fetch(PDO::FETCH_ASSOC);

        } catch (PDOException $e) {
            echo $query . "<br>";
            throw new Exception($e->getMessage());
        }

        return $rep;
    }

}
