<?php

/**
 * Cette page php va se charge d'afficher les fichiers HTML
 * J'ai décidé de séparer les fichiers HTML afin de ne pas avoir un unique fichier plus difficile à éditer
 */
//démarrage de la session utilisateur
session_start();

//on récupère le html des différents éléments de la page
$head = file_get_contents('view/html/head.html');
$navbar = file_get_contents('view/html/navbar.html');
$playlists = file_get_contents('view/html/playlists.html');
$main_content = file_get_contents('view/html/main_content.html');
$modal_artist = file_get_contents('view/html/modal_artist.html');
$modal_playlist_create = file_get_contents('view/html/modal_playlist_create.html');
$modal_playlist_delete = file_get_contents('view/html/modal_playlist_delete.html');
$modal_add_track = file_get_contents('view/html/modal_add_track_playlist.html');
$modal_connect = file_get_contents('view/html/modal_connect.html');
$modal_logout = file_get_contents('view/html/modal_logout.html');
$footer = file_get_contents('view/html/footer.html');

//ajout du bouton de connexion
$nav_btn = '<button class="btn navbar-btn btn-success no-radius navbar-right" id="connect-btn" role="button" data-toggle="modal" data-target="#modalConnect">
                <span class="glyphicon glyphicon-log-in pull-left"></span> Connexion
            </button>';

//si un utilisateur est connecté
if (isset($_SESSION['user_id'])) {

    if ($_SESSION['user_id'] != 1) {

        //on remplace le bouton de connexion par celui de déconnexion
        $nav_btn = '<button class="btn navbar-btn btn-danger no-radius navbar-right" id="connect-btn" role="button" data-toggle="modal" data-target="#modalLogout">
                        <span class="glyphicon glyphicon-off pull-left"></span> ' . $_SESSION['username'] . '
                    </button>';
    }
}

//fermeture des balises restantes de la navbar
$navbar .= $nav_btn . '</div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>';

//on affiche les éléments de la page
echo
'<!DOCTYPE html>
    <html>' . $head .
 '<body>'

 . $navbar
 . $modal_connect
 . $modal_logout
 . $modal_artist
 . $modal_playlist_create
 . $modal_playlist_delete
 . $modal_add_track .
 '<div class="container-fluid" id="page-content">
        <div class="row">'
 . $playlists
 . $main_content .
 '</div>
        </div>'
 . $footer .
 '</body>
    </html>';
