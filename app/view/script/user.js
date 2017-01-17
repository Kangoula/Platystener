/**
 * Envoit la requète de connexion de l'utilisateur au seveur
 */
function connect() {
    
    //Récupération des valeurs entrées dans les champs
    var user = $('#username-input').val();
    var pass = $('#password-input').val();

    //envoit de la requète au serveur
    jQuery.ajax({
        url: 'controller/Controller.php',
        type: 'post',
        data: {a: 'connect', user: user, pass: pass},
        success: function (data) {
            //si le serveur indique que la connexion s'est effectuée
            if (data !== '') {
                location.hash = 'artists/all';
                
                $('#connect-success-text').html('Connexion effectuée, Bienvenue <strong>'+user+'</strong>');
                $('#connect-success').show(200);
                $('#subsribe-success').hide(200);
                //on change le bouton 
                $('#connect-btn').html(data);
                $('#connect-btn').removeClass('btn-success');
                $('#connect-btn').addClass('btn-danger');
                $('#connect-btn').attr('data-target', '#modalLogout');
                //on récupère les playlists
                getPlaylists('display', 0);
                getPlaylists('selection', 0);
            }
            else {
                //s'il y a eu un problème d'authentification on affiche le message d'erreur
                $('#connect-error').show(200);
            }
        }
    });
}

/**
 * Déconnecte l'utilisateur
 */
function logout() {
    
    //envoit de la requète au serveur
    jQuery.ajax({
        url: 'controller/Controller.php',
        type: 'post',
        data: {a: 'logout'},
        success: function (data) {
            location.hash = '';
            $('#connect-success').hide(200);
            //changement sur le bouton
            $('#connect-btn').html(data);
            $('#connect-btn').removeClass('btn-danger');
            $('#connect-btn').addClass('btn-success');
            $('#connect-btn').attr('data-target', '#modalConnect');
            //récupération des playlists
            getPlaylists('display', 0);
            getPlaylists('selection', 0);
        }
    });
}