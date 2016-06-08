<?php

include_once '../model/Playlist.php';

/**
 * Controleur d'une playlist
 * Appelle les fonctions liées à Playlist
 */
class ControllerPlaylist {

    /**
     * Recherche une playlist par son ID
     * Renvoit le contenu du modal pour la suppresion de la playlist
     * @param int $id
     */
    public static function searchById($id) {
        //appel de la fonction de recherche par ID
        $r = Playlist::findById($id);
        //generation de l'affichage
        echo '<div class="modal-header bg-color-custom radius">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title">Supprimer la playlist</h4>
            </div>
            <div class="modal-body">
                Voulez-vous vraiment supprimer la playlist "<strong>' . $r['playlist_name'] . '</strong>" ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger no-radius" data-dismiss="modal">
                    <span class="glyphicon glyphicon-remove"></span>
                </button>
                <button type="button" class="btn btn-success no-radius pull-left" data-dismiss="modal" onclick="deletePlaylist(' . $r['playlist_id'] . ')">
                    <span class="glyphicon glyphicon-ok"></span>
                </button>
            </div>';
    }

    /**
     * Recherche toutes les playlist en fonction du type de recherche que l'on veut faire
     * Pour affichage OU pour sélection dans un menu déroulant
     * @param String $type
     */
    public static function searchAll($type) {
        
        $output = '';
        
        //on vérifie si on a un utilisateur de connecté
        if(isset($_SESSION['user_id'])){
            //s'il est connecté on sauvegarde son identifiant
            $user_id = $_SESSION['user_id'];
        }
        else {
            //sinon on utilise l'utilisateur par défaut 
            $user_id = 1;
        }
        
        //on recherche les playlists de cet utilisateur
        $r = Playlist::findByUser($user_id);
        
        //si on demande un affichage de la playlist
        if ($type == "display") {
            //pour chaque playlist on va créer un affichage
            foreach ($r as $playlist) {
                $output .= '
                <div class="panel panel-custom">
                <input type="hidden" class="hidden-playlist-id" value="' . $playlist['playlist_id'] . '" />
                    <div class="panel-heading" role="tab" id="heading-' . $playlist['playlist_id'] . '">
                        <h4 class="panel-title">
                            <a class="close playlist-delete-button" href="#" role="button" data-toggle="modal" data-target="#modalPlaylist-delete" onclick="fillPlaylistModalDelete(' . $playlist['playlist_id'] . ')">
                                <span class="glyphicon glyphicon-trash"></span>
                            </a>
                            <button id="playlist-' . $playlist['playlist_id'] . '-play" type="button" class="btn btn-default playlist-play-button" onclick="playPlaylist(' . $playlist['playlist_id'] . ')">
                                <span class="glyphicon glyphicon-play-circle"></span>
                            </button>
                            <a class="playlist-title" data-toggle="collapse" data-parent="#accordion" href="#collapse-' . $playlist['playlist_id'] . '" aria-expanded="true" aria-controls="collapseOne">
                                ' . $playlist['playlist_name'] . '   
                            </a>
                        </h4>
                    </div>
              <div id="collapse-' . $playlist['playlist_id'] . '" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-' . $playlist['playlist_id'] . '">
                    <div class="panel-body" id="panel-body-' . $playlist['playlist_id'] . '">
                            
                           Loading...  
                        </div> 
                    </div>
                </div>';
            }  
        } else {
            //si on demande un affichage en liste déroulante
            $output.='<option value="" selected disabled>Nom de la playlist</option>';
            //pour chaque playlist on créé une option
            foreach($r as $row){
                $output.= '<option value="'. $row['playlist_id'] .'">'. $row['playlist_name'] .'</option>';
            }
        }
        echo $output;
    }

    /**
     * Crée une nouvelle playlist avec un nom et un id_user donnée et l'insère dans la BDD
     * @param String $name
     * @param int $user_id
     */
    public static function newPlaylist($name) {
        
        //si l'utilisateur est connecté on va lier la playlist à son compte
        if(isset($_SESSION['user_id'])){
            $user_id = $_SESSION['user_id'];
        }
        else {
            $user_id = 1;
        }
        
        //création d'un nouvel OBJET playlist sans valeur pour le moment
        $p = new Playlist();
        //définition du nom, et de l'user_id
        $p->user_id = $user_id;
        $p->playlist_name = $name;
        //insertion dans la base
        $p->insert();
    }

    /**
     * Supprime une playlist d'id donnée de la BDD
     * @param int $id
     */
    public static function deletePlaylist($id) {
        //creation d'un objet playlist
        $p = new Playlist();
        //définition de l'id de la playlist à supprimer
        $p->playlist_id = $id;
        //suppresion de la base
        $p->delete();
    }

}
