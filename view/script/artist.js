/**
 * Trouve les chansons d'un artiste et modifie la balise passé en paramètre
 * @param {int} artistID
 * @param {String} divToUpdate
 */
function findTrack(artistID, divToUpdate) {
    //requète ajax au serveur
    jQuery.ajax({
        url: 'controller/Controller.php',
        data: {a: 'search', type: 'trackArtist', val: artistID},
        type: 'get',
        success: function (resp2) {
            //on modifie le contenu de la balise passée en paramètre
            $(divToUpdate).html(resp2);
        }
    });
}

/**
 * Rempli le modal de l'artiste dont l'id a été renseigné
 * @param {int} artistID
 */
function fillModal(artistID) {

    //envoi d'une requète ajax au serveur
    jQuery.ajax({
        url: 'controller/Controller.php',
        type: 'get',
        data: {a: 'search', type: 'artistID', val: artistID}, //on recherche l'artiste dont l'id a été renseigné
        dataType: 'json', //on attent du contenu en JSON en sortie 
        //on remplace le contenu de la div par le résultat renvoyé par le serveur
        success: function (resp) {
            if (resp === false) {
                $('#modalArtist').html("Non trouvé");
            }
            //on met le nom de l'artiste dans le titre du modal
            $('#modalArtist-title').html(resp.name);
            //on met l'image de l'artiste dans le modal
            $('#modalArtist-img').attr('src', resp.image_url);
            //on met les infos de l'artiste dans le modal
            $('#modalArtist-info').html(resp.info);
            //on recherche les chansons de cet artiste et on les affiche dans le modal
            findTrack(resp.artist_id, '#modalArtist-tracklist');
        }
    });
}
