/**
 * Fonction appelée lors de la recherche d'un artiste ou d'un titre en particulier
 * @param {string} type
 * @param {string} val
 */
function searchForm(type, val) {

    if (val === '') {
        //on enregistre les données du formulaire
        var v = jQuery('#search-input').val();
    } else {
        var v = val;
    }
    //changements de css
    $('#all-track').parent().removeClass('active-custom');
    $('#all-artist').parent().removeClass('active-custom');

    //on envoit une requète ajax au serveur
    jQuery.ajax({
        url: 'controller/Controller.php',
        data: {a: 'search', type: type, val: v},
        type: 'get',
        //on remplace le contenu de la div par le résultat renvoyé par le serveur
        success: function (resp) {

            //affichage du resultat
            $('#main-content').html(resp);
            
            //adaptation de la taille des éléments
            adaptThumbnailSize($('#main-panel'));

            //si on a recherché une/des chanson(s) 
            if (type === 'trackTitle') {

                location.hash = '#tracks/search/' + v;
                //on va trouver le nom de l'artiste de la chanson
                $('.hidden-track-artistID').each(function () {
                    var id = $(this).val();
                    jQuery.ajax({
                        url: 'controller/Controller.php',
                        data: {a: 'search', type: 'artistID', val: id},
                        type: 'get',
                        dataType: 'json',
                        success: function (out) {
                            //on affiche le nom de l'artiste
                            $('.all-tracks-artist-' + id).html(out.name);
                        }
                    });
                });
            }

            if (type === 'artistName') {
                location.hash = '#artists/search/' + v;
            }
        }
    });
}

/**
 * Recherche tous les artistes
 * Fonction appelée lors du clic sur le bouton correspondant
 */
function searchAllArtists() {

    //changements de css
    $('#all-track').parent().removeClass('active-custom');
    $('#all-artist').parent().addClass('active-custom');

    //envoi de requète ajax au serveur
    jQuery.ajax({
        url: 'controller/Controller.php',
        data: {a: 'all', type: 'artist'},
        type: 'get',
        //on remplit le contenu de la div par le résultat obtenu
        success: function (resp) {
            $('#main-content').html(resp);

           adaptThumbnailSize($('#main-panel'));
        }
    });
}

/**
 * Recherche tous les titres
 * Fonction appelée lors du clic sur le bouton correspondant
 */
function searchAllTracks() {

    //changements de css
    $('#all-artist').parent().removeClass('active-custom');
    $('#all-track').parent().addClass('active-custom');

    //envoi de requète ajax au serveur
    jQuery.ajax({
        url: 'controller/Controller.php',
        data: {a: 'all', type: 'track'},
        type: 'get',
        //dataType: 'json',
        //on remplit le contenu de la div par le résultat obtenu
        success: function (resp) {

            $('#main-content').html(resp);
            adaptThumbnailSize($('#main-panel'));
            
            //on parcours tous les titres
            var artistID = 0;

            $('.hidden-track-artistID').each(function () {
                //si l'id de l'artiste change 
                if ($(this).val() !== artistID) {
                    artistID = $(this).val();

                    //on cherche le nom de l'artiste
                    jQuery.ajax({
                        url: 'controller/Controller.php',
                        data: {a: 'search', type: 'artistID', val: artistID},
                        type: 'get',
                        dataType: 'json',
                        success: function (out) {
                            //on ajoute le nom de l'artiste dans les champs correspondant
                            $('.all-tracks-artist-' + out.artist_id).each(function () {
                                $(this).html(out.name);
                            });
                        }
                    });
                }
            });
        }
    });
}

