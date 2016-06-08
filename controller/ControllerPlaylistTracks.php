<?php

include_once "../model/PlaylistTracks.php";
include_once "../model/Track.php";

class ControllerPlaylistTracks {

    /**
     * Recherche une playlist par son ID
     * Génère l'affichage de la playlist OU génère le JSON de la playlist
     * @param int $id
     * @param String $type
     */
    public static function searchByPlaylistId($id, $type) {
        //on cherche une playlist par son id
        $r = PlaylistTracks::findById($id);
        
        //si on recherche pour un affichage
        if ($type == 'display') {
            //pour chaque chanson on va récupérer ses informations
            $artist_id = 0;
            $artist = NULL;

            $output = '';
            foreach ($r as $plt) {
                //on récuère les infos sur la chanson
                $r2 = Track::findById($plt['track_id']);

                //on récupère les infos sur l'artiste 
                //si le même artiste arrive deux fois de suite on ne fait pas une requète à la base
                if ($r2['artist_id'] != $artist_id) {
                    $artist_id = $r2['artist_id'];
                    $artist = Artist::findById($artist_id);
                }
                //on affiche
                $output .= '
                    <span class="badge playlist-badge" id="playlist-'. $plt['playlist_id'] .'-track-'. $plt['track_id'] .'">' . $plt['position'] . '</span> '
                        . $r2['title'] . '
                            <a class="close" href="#" onclick="deleteTrackFromPlaylist('. $plt['playlist_id'] .','. $plt['track_id']  .')">
                                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                            </a><br>
                    <span class="playlist-tracks-artist-name">
                        <i>' . $artist['name'] . '</i>
                    </span>
                    <br><br>';
            }
            echo $output;
            
        } else {
            //si on recherche pour traiter ultérieurement
            echo json_encode($r);
        }
    }
    
    /**
     * Supprime une playlistTrack donnée de la BDD
     * @param int $playlist_id
     * @param int $track_id
     */
    public static function deleteTrackFromPlaylist($playlist_id, $track_id){
        //Creation de l'objet
        $plt = new PlaylistTracks();
        //attribution des valeurs
        $plt->playlist_id = $playlist_id;
        $plt->track_id = $track_id;
        //suppression
        $plt->delete();
    }
    
    /**
     * Génère les boutons d'ajout d'une chanson à une playlist 
     * Ils sont utilisés dans la fenêtre s'ouvrant quand on clique sur "ajout à une playlist"
     * @param int $track_id
     */
    public static function insertTrackInPlaylistDisplay($track_id){
        
        echo '<button onclick="addToPlaylist('. $track_id .')" class="btn no-radius btn-success pull-left" id="btn-submit-add-playlist" data-dismiss="modal" disabled>
                    <span class="glyphicon glyphicon-ok"></span>
                </button>
                <button type="button" class="btn btn-danger no-radius pull-right" data-dismiss="modal">
                    <span class="glyphicon glyphicon-remove"></span>
                </button>';
    }
    
    /**
     * Insère une chanson donnée dans une playlist donnée
     * @param int $playlist_id
     * @param int $track_id
     */
    public static function newPlatlistTrack($playlist_id, $track_id){
        
        $plt = new PlaylistTracks();
        
        $plt->playlist_id = $playlist_id;
        $plt->track_id = $track_id;
        
        $plt->insert();
    }

}
