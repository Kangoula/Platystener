<?php

include_once '../model/Track.php';

/**
 * Controller d'une chanson
 * Appelle les fonctions liées aux chansons
 */
class ControllerTrack {

    /**
     * Recherche une chanson par son titre
     * @param string $title
     */
    public static function searchByTitle($title) {
        //recherche de la chanson
        $r = Track::findByTitle($title);

        $output = '<div class="row">';
        //si la fonction renvoit un résultat
        if (isset($r[0])) {
            //pour chaque chanson renvoyée on crée un thumbnail
            foreach ($r as $row) {
                $output .= '
                <div class="col-md-4 col-xs-6 track-thumbnail">
                    
                        <div class="thumbnail">
                            <div class="caption">
                                <h3>' . $row['title'] . '</h3>
                                <input type="hidden" class="hidden-track-artistID" value="' . $row['artist_id'] . '" />
                                <a class="all-tracks-artist-' . $row['artist_id'] . '" href="#" role="button" data-toggle="modal" data-target="#modalArtist" onclick="fillModal(' . $row['artist_id'] . ')">
                                    ' . $row['artist_id'] . '
                                </a>
                                <br>
                                <br>
                                <div>
                                    <button id="track-' . $row['track_id'] . '-play" type="button" class="btn btn-success no-radius" onclick="playTrack(' . $row['track_id'] . ',false)">
                                        <span class="glyphicon glyphicon-play" ></span>
                                    </button>
                                    <button class="btn btn-default no-radius pull-right" href="#" role="button" data-toggle="modal" data-target="#modalAdd-track-playlit">
                                        <span class="glyphicon glyphicon-plus"></span> Ajouter
                                    </button>
                                </div>
                            </div>
                        </div>
                </div>';
            }
        } else {
            $output.= "<center><h1>Oups...<br>Il me semble que le recherche n'a pas été fructueuse :(</h1></center>";
        }
        $output .= '</div>';

        echo $output;
    }

    /**
     * Recherche une chanson par son ID
     * @param int $id
     */
    public static function searchById($id) {
        echo json_encode(Track::findById($id));
    }

    /**
     * Recherche toutes les chansons
     * Renvoit un tableau contenant toutes les chansons
     * Pour chaque chanson on affiche son titre, son artiste et on ajoute la possiblité de la lire
     * Lors d'un clic sur le nom de l'artiste on ouvre un modal contenant les infos de l'artiste
     */
    public static function searchAll() {
        //recherce de tous les titres
        $r = Track::findAll();
        
        $output = '<div class="row">';
        //si la fonction renvoit un résultat
        if (isset($r[0])) {
            //pour chaque chanson renvoyée on créé un affichage
            foreach ($r as $row) {
                $output .= '
                <div class="col-md-4 col-xs-12 track-thumbnail">
                    
                        <div class="thumbnail">
                            <div class="caption">
                                <h3>' . $row['title'] . '</h3>
                                <input type="hidden" class="hidden-track-artistID" value="' . $row['artist_id'] . '" />
                                <a class="all-tracks-artist-' . $row['artist_id'] . '" href="#" role="button" data-toggle="modal" data-target="#modalArtist" onclick="fillModal(' . $row['artist_id'] . ')">
                                    ' . $row['artist_id'] . '
                                </a>
                                <br>
                                <br>
                                <div>
                                    <button id="track-' . $row['track_id'] . '-play" type="button" class="btn btn-success no-radius" onclick="playTrack(' . $row['track_id'] . ',false)">
                                        <span class="glyphicon glyphicon-play" ></span>
                                    </button>
                                    <button class="btn btn-default no-radius pull-right" href="#" role="button" data-toggle="modal" data-target="#modalAdd-track-playlit" onclick="fillModalAddToPlaylist('. $row['track_id'] .')">
                                        <span class="glyphicon glyphicon-plus"></span> Ajouter
                                    </button>
                                </div>
                            </div>
                        </div>
                </div>';
            }
        } else {
            //si on a pas trouvé de chanson on affiche un message
            $output.= "<center><h1>Oups...<br>Il me semble que le recherche n'a pas été fructueuse :(</h1></center>";
        }
        $output .= '</div>';

        echo $output;
    }

    /**
     * Recherche des chansons d'un artiste donné
     * Renvoit un tableau de chansons avec le titre de la chanson et un bouton play
     * @param int $artist_id
     */
    public static function searchByArtist($artist_id) {
        //recherche des chanson de cet artiste
        $r = Track::findByArtist($artist_id);

        //initialisation du tableau
        $output = '<table class="table table-hover table-info-artist">'
                . '<tbody>';
        //pour chaque chanson on créé une ligne
        foreach ($r as $row) {
            $output.= '
                <tr>
                    <td>' . $row['title'] . '</td>
                    <td>
                        <button class="btn btn-default no-radius" href="#" role="button" data-toggle="modal" data-target="#modalAdd-track-playlit" onclick="fillModalAddToPlaylist('. $row['track_id'] .')">
                            <span class="glyphicon glyphicon-plus"></span> Ajouter
                        </button>
                        <input type="hidden" id="track-' . $row['track_id'] . '-hidden" value="' . $row['mp3_url'] . '"/>
                        <button id="track-' . $row['track_id'] . '-play" type="button" class="btn btn-default no-radius pull-right " onclick="playTrack(' . $row['track_id'] . ')">
                            <span class="glyphicon glyphicon-play" ></span>
                        </button>
                    </td>
                </tr>';
        }
        //fermeture du tableau
        $output.='</tbody>'
                . '</table>';
        echo $output;
    }

}
