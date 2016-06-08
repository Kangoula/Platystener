$(document).ready(function () {
    //on récupère les playlist
    getPlaylists("display", 0);
    getPlaylists("selection", 0);

    //tant qu'on a pas renseigné les champs du formulaire on ne peut pas rechercher
    $('#search-input').keyup(function () {

        enableButton('#search-input', '#search-nav');
    });

    $('#search-input').change(function () {

        enableButton('#search-input', '#search-nav');
    });

    //tant qu'on a pas renseigné un nom de playlist on ne peut pas valider sa création
    $('#playlist-name-input').keyup(function () {

        enableButton('#playlist-name-input', '#btn-submit-playlist');
    });

    $('#playlist-selector').change(function () {

        enableButton('#playlist-selector', '#btn-submit-add-playlist');
    });

    $('#connect-btn').click(function () {
        $('#connect-error').hide(200);
    });
    
    $('#player-previous').prop('disabled', true);
    $('#player-next').prop('disabled', true);
    $('#player-play').prop('disabled', true);

    /**
     * Permet de garder un historique des pages pour pourvoir y retourner avec les boutons précédent et suivant du navigateur
     */
    //quand le hash dans l'url change on affiche la bonne page
    $(window).on('hashchange', hashHistory);

    //on recherche la page a ajouter en fonction du hash
    hashHistory();
});

/**
 * Permet d'activer ou de désactiver un bouton si l'input est valable ou non
 * @param {htmlObject} inputToCheck
 * @param {htmlObject} button
 */
function enableButton(inputToCheck, button) {

    //si la valeur de l'input n'est pas vide
    if ($(inputToCheck).val() !== '') {
        //activation du bouton
        $(button).prop('disabled', false);
    } else {
        //sinon désactivation
        $(button).prop('disabled', true);
    }
}

/**
 * Permet de masquer/afficher le menu des playlists
 */
function togglePlaylistNav() {

    var main_panel = $('#main-panel');
    var sign = $('#sign-navbar');

    //on affiche ou masque la liste
    $('#playlists').toggle(400);

    //si on est en affichage playlist + tableau de bord
    if (main_panel.hasClass('col-md-9')) {
        //on change le chevron de la navbar
        sign.html('<span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>');
        //suppression des classes
        main_panel.removeClass('col-md-9');
        //ajout des classes pour que le tableau de bord prenne toute la page
        main_panel.addClass('col-md-12');
    }
    else {
        //on change le chevron de la navbar
        sign.html('<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>');
        //si on est en affichage tableau de bord on fait l'inverse
        main_panel.removeClass('col-md-12');
        main_panel.addClass('col-md-9');
    }
    //on adapte la taille des thumbnails
    adaptThumbnailSize(main_panel);
}

/**
 * Adapte la taille des thumbnails en fonction de la taille de la page
 * @param {DOM} main_panel
 */
function adaptThumbnailSize(main_panel) {

    //si le page est en grand taille
    if (main_panel.hasClass('col-md-12')) {

        //adaptation de la taille des thumbnails de titres
        $('.artist-all-div').each(function () {
            $(this).removeClass('col-md-3');
            $(this).addClass('col-md-2');
        });
        //adaptation de la taille des thumbnails de titres
        $('.track-thumbnail').each(function () {
            $(this).removeClass('col-md-4');
            $(this).addClass('col-md-3');
        });

    } else {
        //adaptation de la taille des thumbnails d'artistes
        $('.artist-all-div').each(function () {
            $(this).removeClass('col-md-2');
            $(this).addClass('col-md-3');
        });
        //adaptation de la taille des thumbnails de titres
        $('.track-thumbnail').each(function () {
            $(this).removeClass('col-md-3');
            $(this).addClass('col-md-4');
        });
    }
}

/**
 * Permet d'appeler les fonctions adéquations en fonction du hash de la page
 */
var hashHistory = function () {
    //on va séparer le hash en sous chaines
    var hash = location.hash.split("/");

    switch (hash[0]) {
        //si la première sous chaine est #artists
        case '#artists':
            //on regarde la deuxième sous chaine et on appelle les fonctions adéquates
            switch (hash[1]) {
                case 'all':
                    searchAllArtists();
                    break;
                case 'search':
                    searchForm('artistName', hash[2]);
                    break;
                default:
                    searchAllArtists();
                    break;
            }
            break;
            //si la première sous chaine est #tracks
        case '#tracks':
            //on regarde la seconde sous chaine et on appelle les fonctions adéquates
            switch (hash[1]) {
                case 'all':
                    searchAllTracks();
                    break;
                case 'search':
                    searchForm('trackTitle', hash[2]);
                    break;
                default:
                    searchAllTracks();
                    break;
            }
            break;
            //si le première sous chaine est #subscribe
        case '#subscribe' :
            displaySubscribeForm();
            break;
            //sinon on affiche la page d'accueil
        default:
            location.hash = '';
            var c = '<div class="jumbotron">'
                    + '<p>Bienvenue dans notre pojet développé dans cadre du cours de Programmation Web.</p>'
                    + '<p>Si vous souhaitez sauvegarder et accéder à vos playlists depuis n\'importe où, veuillez créer un compte</p>'
                    + '<p><button class="btn btn-success no-radius" onclick="displaySubscribeForm();">S\'inscrire</button></p>'
                    + '</div>';
            $("#main-content").html(c);
            break;
    }
};

