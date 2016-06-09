/**
 * Récupère les playlists
 * Pour chaque playlist, on la remplit par la position, 
 * le titre et l'artiste de chaque chanson qu'elle possède
 * toOpen sert à indiquer quelle playlist doit rester ouverte dans le menu déroulant (0 = aucune)
 * @param {String} purpose
 * @param {int} toOpen
 */
function getPlaylists(purpose, toOpen) {
    
    //si le but est d'afficher
    if (purpose === "display") {
        //récupération des titres des playlists
        jQuery.ajax({
            url: 'controller/Controller.php',
            type: 'get',
            data: {a: 'all', type: 'playlist', purpose: 'display'},
            dataType: 'html',
            success: function (rep) {
                //affichage des noms des playlist dans le menu
                $('#accordion').html(rep);
                //récupération des chansons de chaque playlist pour les afficher
                $(".hidden-playlist-id").each(function () {
                    var v = $(this).val();
                    
                    jQuery.ajax({
                        url: 'controller/Controller.php',
                        type: 'get',
                        data: {a: 'search', type: 'playlistTracksDisplay', val: v},
                        success: function (out) {
                            //affichage de chaque chanson de la playlist
                            $('#panel-body-' + v).html(out);
                            //on ouvre la playlist indiquée
                            if(toOpen !== 0) $('#collapse-'+ toOpen).addClass('in');
                        }
                    });
                });
            }
        });
    } else {
        //sinon affichage des noms des playlists dans un sélecteur
        jQuery.ajax({
            url: 'controller/Controller.php',
            type: 'get',
            data: {a: 'all', type: 'playlist', purpose: 'selection'},
            success: function (rep) {
                $('#playlist-selector').html(rep);
            }
        });
    }
}


/**
 * Le but de cette fonction est d'initialiser la lecture de la playlist renvoyée en JSON
 * @param {json} data
 */
var playlistArgs = function (data) {
    //on initialise le compteur de position de la playlist
    currentIndex = 0;
    //on sauvegarde la playlist dans une variable globale
    playlist = data;

    //on enleve la couleur du titre actuellement en lecture
    $('.playlist-badge').each(function () {
        $(this).removeClass('playing');
    });

    if (typeof data[0] !== 'undefined') {
        //on joue la première chanson contenue dans le JSON
        playTrack(data[0].track_id, true);
        //on met la couleur sur le nouveau titre qu'on lit
        $('#playlist-' + data[0].playlist_id + '-track-' + data[0].track_id).addClass('playing');
    }
};

/**
 * Lit une playlist donnée
 * @param {int} playlistID
 */
function playPlaylist(playlistID) {
    //on récupère les chansons de la playlist en json
    var req = jQuery.ajax({
        url: 'controller/Controller.php',
        type: 'get',
        data: {a: 'search', type: 'playlistTracksJSON', val: playlistID},
        dataType: 'json'
    });
    //une fois que la requète executée on traite le résultat dans la fonction définie au dessus
    req.done(playlistArgs);
}

/**
 * Appelle le controleur permettant de créer une playlist
 * @param {String} nameInput
 */
function createPlaylist(nameInput) {
    
    //assignation du nom et de l'user_id de la playlist
    var name = $(nameInput).val();
    
    //appel du controleur
    jQuery.ajax({
        url: 'controller/Controller.php',
        type: 'get',
        data: {a: 'create', type: 'playlist', name: name},
        success: function () {
            //rafraichissement de l'affichage
            getPlaylists('display',0);
            getPlaylists('selection',0);
        }
    });
}

/**
 * Appelle le controleur permettant de supprimer une playlist
 * @param {int} playlist_id
 */
function deletePlaylist(playlist_id) {
    
    jQuery.ajax({
        url: 'controller/Controller.php',
        type: 'get',
        data: {a: 'delete', type: 'playlist', val: playlist_id},
        success: function () {
            //rafraichissement de l'affichage
            getPlaylists('display',0);
            getPlaylists('selection',0);
        }
    });
}

/**
 * Rempli la fenêtre de confirmation de suppresion de playlist
 * @param {int} playlist_id
 */
function fillPlaylistModalDelete(playlist_id) {
    //recuperation du titre de la playlist
    jQuery.ajax({
        url: 'controller/Controller.php',
        type: 'get',
        data: {a: 'search', type: 'playlistForDelete', val: playlist_id},
        success: function (data) {
            //on remplit le modal
            $('#modal-playlist-delete-content').html(data);
        }
    });
}

/**
 * Appelle le controleur permettant de supprimer une chanson d'une playlist
 * @param {int} playlist_id
 * @param {int} track_id
 */
function deleteTrackFromPlaylist(playlist_id, track_id) {
    //appel du controleur
    jQuery.ajax({
        url: 'controller/Controller.php',
        type: 'get',
        data: {a: 'delete', type: 'playlistTrack', playlist_id: playlist_id, track_id: track_id},
        success: function () {
            //rafraichissement de l'affichage
            getPlaylists('display',playlist_id);
        }
    });
}

/**
 * Remplit le modal permettant l'ajout d'un titre à une playlist
 * @param {int} track_id
 */
function fillModalAddToPlaylist(track_id){
   
    jQuery.ajax({
       url:'controller/Controller.php',
       type: 'get',
       data: {a:'search', type:'playlistTrackModal', val:track_id},
       success: function(data){
           $('#add-track-playlist-footer').html(data);
           $('#playlist-selector').prop('selectedIndex',0);
       }
    });
}

/**
 * Ajoute un titre donnée à la playlist sélectionnée dans le modal
 * @param {type} track_id
 */
function addToPlaylist(track_id){
    
    //on récupère la playlist sélectionnée
    var playlist_id = $('#playlist-selector').val();
    
    jQuery.ajax({
       url: 'controller/Controller.php',
       type: 'get',
       data: {a:'create', type: 'playlistTrack', playlist_id:playlist_id, track_id:track_id},
       success: function(data){
           getPlaylists('display',playlist_id);
       }
    });
}





