/**
 * Initialise le player
 * Créé l'objet audio pouvant être lu en JS
 * Cherche le nom de l'artiste de la chanson
 * Affiche les informations
 * @param {String} mp3_url
 * @param {int} artist_ID
 * @param {String} title
 * @param {boolean} IsPlaylist
 */
var audio;

function initialize(mp3_url, artist_ID, title, IsPlaylist) {
    //on créée un audio avec l'url de la chanson
    audio = new Audio(mp3_url);
    //permet de créer un lecteur vide au premier chargement de la page
    if (artist_ID !== 0) {
        //on active le bouton play
        $('#player-play').prop('disabled', false);

        //on va cherche le nom de l'artiste de la chanson
        jQuery.ajax({
            url: 'controller/Controller.php',
            data: {a: 'search', type: 'artistID', val: artist_ID},
            type: 'get',
            dataType: 'json',
            //le fonction php renvoit l'artiste associé à cette chanson
            success: function (out) {
                //on remplit la zone dédiée avec NomArtiste - Titre
                $('#defile').html(out.name + " - " + "<i>'" + title + "'</i>");
            }
        });
        //si on lit une playlist 
        if (IsPlaylist) {
            //on ajoute la lecture automatique
            audio.addEventListener("ended", nextTrack);
            //on débloque les boutons previous & next
            $('#player-previous').prop('disabled', false);
            $('#player-next').prop('disabled', false);
        }

        else {
            //sinon on supprime la lecture auto et on bloque les boutons
            audio.removeEventListener("ended", nextTrack);
            $('#player-previous').prop('disabled', true);
            $('#player-next').prop('disabled', true);

            $('.playlist-badge').each(function () {
                $(this).removeClass('playing');
            });
        }
    }
}

/**
 * Met en pause la chanson en changeant l'icone
 */
function Pause() {
    if(audio != undefined){
        $('#player-play').html('<span class="glyphicon glyphicon-play" ></span>');
        audio.pause();
    }
    

}

/**
 * Lit la chanson en changeant l'icone
 */
function Play() {

    $('#player-play').html('<span class="glyphicon glyphicon-pause" ></span>');
    audio.play();
}

/**
 * Permet de lire un titre dans le player
 * On doit donner l'identifiant de la chanson 
 * ET si on la lit dans le cadre d'une playlist ou non
 * @param {int} trackID
 * @param {boolean} IsPlaylist
 */
function playTrack(trackID, IsPlaylist) {

    if (typeof audio != undefined) {
        //on arrête la chanson
        Pause();
    }
    //on récupre les informations de la chanson à lire
    jQuery.ajax({
        url: 'controller/Controller.php',
        type: 'get',
        data: {a: 'search', type: 'trackID', val: trackID},
        dataType: 'json',
        success: function (rep) {
            //on initialise le lecteur avec le fichier mp3, l'id de l'artiste, le titre de la chanson et le type de lecture
            initialize(rep.mp3_url, rep.artist_id, rep.title, IsPlaylist);
            //on lit la chanson
            Play();
        }
    });
}

/**
 * Lit ou met en pause la chanson en changeant l'icone du player
 */
function playPause() {
    //si la chanson est en pause
    if (audio.paused) {
        //on la joue
        Play();
    }
    else {
        //sinon on la met en pause
        Pause();
    }
}


/**
 * Permet de passer à la chanson suivante si on lit une palylist
 * @returns {undefined}
 */
function nextTrack() {
    currentIndex++;
    //si on est pas à la fin de la playlist
    if (currentIndex < playlist.length) {
        var track_id = playlist[currentIndex].track_id;
        var prev_track_id = playlist[currentIndex - 1].track_id;
        var playlist_id = playlist[currentIndex].playlist_id;
        //on lit la chanson
        playTrack(track_id, true);
        //changement de css pour matérialiser la lecture de la chanson
        $('#playlist-' + playlist_id + '-track-' + prev_track_id).removeClass('playing');
        $('#playlist-' + playlist_id + '-track-' + track_id).addClass('playing');
    } else {
        //sinon on remet l'index à la valeur maximale
        currentIndex = playlist.length - 1;
    }
}

/**
 * Permet de revenir à la chanson précédente si on est dans une playlist
 * @returns {undefined}
 */
function previousTrack() {
    currentIndex--;
    //si on est pas au début de la liste
    if (currentIndex >= 0) {
        var track_id = playlist[currentIndex].track_id;
        var prev_track_id = playlist[currentIndex + 1].track_id;
        var playlist_id = playlist[currentIndex].playlist_id;
        //on lit la chanson précédente
        playTrack(track_id, true);
        //changements de css
        $('#playlist-' + playlist_id + '-track-' + prev_track_id).removeClass('playing');
        $('#playlist-' + playlist_id + '-track-' + track_id).addClass('playing');
    } else {
        //sinon on remet l'index au début
        currentIndex = 0;
    }
}


/*
 * Fonction permettant de faire défiler du texte
 * source : http://forum.phpfrance.com/vos-contributions/texte-defilant-javascript-css-compatible-xhtml-stritct-t11093.html 
 */
var defile;// l'element a deplacer
var psinit = 300; // position horizontale de depart
var pscrnt = psinit;

function texteDefile() {
    if (!defile)
        defile = document.getElementById('defile');
    if (defile) {
        if (pscrnt < (-defile.offsetWidth)) {
            pscrnt = psinit;
        } else {
            pscrnt += -1; // pixel par deplacement
        }
        defile.style.left = pscrnt + "px";
    }
}
setInterval("texteDefile()", 20); // delai de deplacement

