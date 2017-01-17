<?php

include_once '../model/Artist.php';

/*
 * Controlleur d'un artiste
 * Appelle les fonctions liées à un Artiste
 */

class ControllerArtist {

    /**
     * Recherche un artiste par son ID
     * Renvoit un contenu en JSON
     * @param int $id
     */
    public static function searchById($id) {
        $r = Artist::findById($id);
        echo json_encode($r);
    }

    /**
     * Recherche un artiste par son nom
     * Renvoit un panel html avec les informations de l'artiste
     * @param string $name
     */
    public static function searchByName($name) {
        //on cherche l'artiste par son nom
        $r = Artist::findByName($name);
        $output = '<div class="row">';

        if (isset($r[0])) {
            //pour chaque artiste renvoyé on crée un affichage
            foreach ($r as $row) {
                $output .= '
                <div class="col-md-3 col-xs-12 artist-all-div">
                    <a class="artist-all" href="#" role="button" data-toggle="modal" data-target="#modalArtist" onclick="fillModal(' . $row['artist_id'] . ')">
                        <div class="thumbnail artist-all-thumbnail">
                            <p><img class="img-rounded" data-src="holder.js/300x200"  src="' . $row['image_url'] . '" alt="' . $row['name'] . '"></p>
                            <div class="caption">
                                <h3>' . $row['name'] . '</h3>
                            </div>
                        </div>
                    </a>
                </div>';
            }
        } 
        else {
            //sinon on affiche un message d'erreur
            $output.= "<center><h1>Oups...<br>Il me semble que le recherche n'a pas été fructueuse :(</h1></center>";
        }
        $output .= '</div>';

        echo $output;
    }

    /**
     * Recherche tous les artistes
     * Renvoit des thumbnails avec les le nom et image de l'artiste
     * En cliquant sur ces thumbnails on affiche un modal avec les informations détaillées de lartiste
     */
    public static function searchAll() {
        //on recherche tous les articles
        $r = Artist::findAll();
        $output = '<div class="row">';
        //pour chaque artiste renvoyé on crée un thumbnail
        foreach ($r as $row) {
            $output .= '
                <div class="col-md-3 col-xs-12 artist-all-div">
                    <a class="artist-all" href="#" role="button" data-toggle="modal" data-target="#modalArtist" onclick="fillModal(' . $row['artist_id'] . ')">
                        <div class="thumbnail artist-all-thumbnail">
                            <p>
                                <img class="img-rounded" src="' . $row['image_url'] . '" alt="' . $row['name'] . '">
                            </p>
                            <div class="caption">
                                <h3>' . $row['name'] . '</h3>
                            </div>
                        </div>
                    </a>
                </div>';
        }
        $output .= '</div>';

        echo $output;
    }

}
