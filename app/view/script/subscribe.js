/**
 * Permet d'afficher le formulaire d'inscription
 */
function displaySubscribeForm() {

    location.hash = '#subscribe';

    jQuery.ajax({
        url: 'controller/Controller.php',
        type: 'post',
        data: {a: 'subscribe', type: 'display'},
        success: function (data) {
            $('#main-content').html(data);
        }
    });
}

/**
 * Vérifie les champs du formulaire d'inscription
 * Si les champs sont corrects alors on appelle la fonction du controleur permettant l'inscription
 */
function subscribe() {
    
    //on récupère les valeurs dans les champs
    var username = $('#subscribe-username').val();
    var password = $('#subscribe-password').val();
    var password_conf = $('#subscribe-password-confirm').val();
    var email = $('#subscribe-email').val();
    
    if (username.length < 6) {
        //Affichage d'une erreur si le nom d'utilisateur est de taille trop petite
        showError($('#subscribe-username').parent().parent(), $('#error-username'));
    }
    else {
        //on cache les messages d'erreur précédents
        hideError($('#subscribe-username').parent().parent(), $('#error-username'));

        //Expression régulière pour vérifier l'adresse mail renseignée
        var reg = new RegExp('^[a-z0-9]+([_|\.|-]{1}[a-z0-9]+)*@[a-z0-9]+([_|\.|-]{1}[a-z0-9]+)*[\.]{1}[a-z]{2,6}$', 'i');

        if (!reg.test(email)) {
            //si elle n'est pas conforme on affiche un message d'erreur
            showError($('#subscribe-email').parent().parent(), $('#error-email'));
        }
        else {
            //on masque les messages d'erreur précédents
            hideError($('#subscribe-email').parent().parent(), $('#error-email'));
            
            if (password.length < 8) {
                //si le mot de passe fait moins de 8 caratères on affiche un message d'erreur
                showError($('#subscribe-password').parent().parent(), $('#error-pass'));
            }
            else {
                //on masque les messages d'erreur précédents
                hideError($('#subscribe-password').parent().parent(), $('#error-pass'));

                if (password !== password_conf) {
                    //si le mot de passe et sa confirmation ne correspondent pas on affiche un message d'erreur
                    $('#subscribe-password').parent().parent().addClass('has-error');
                    showError($('#subscribe-password-confirm').parent().parent(), $('#error-pass-conf'));
                }
                else {
                    //on masque les messages d'erreur précédents
                    hideError($('.form-group'), $('.error-subscribe'));
                    
                    //si le formulaire est correctement rempli on procède à l'inscription
                    jQuery.ajax({
                        url: 'controller/Controller.php',
                        type: 'post',
                        data: {a: 'subscribe', type: 'insert', username: username, password: password, email: email},
                        success: function(){
                            $('#subsribe-success').show(200);
                            location.hash = '';
                        }
                    });
                }
            }
        }

    }
}

/**
 * Permet d'afficher un message d'erreur particulier (label)
 * Et de mettre le champ correspondant (element) en surbrillance rouge 
 * @param {DOM} element
 * @param {DOM} label
 */
function showError(element, label) {
    //pour chaque élément renseigné on le met en surbrillance
    element.each(function () {
        $(this).addClass('has-error');
    });
    //pour chaque message renseigné on l'affiche
    label.each(function () {
        $(this).show();
    });
}

/**
 * Permet de masquer un message d'erreur (label)
 * Et de supprimer la surbrillance rouge du champ (element)
 * @param {DOM} element
 * @param {DOM} label
 * @returns {undefined}
 */
function hideError(element, label) {
    //suppression de la surbrillance pour chaque element
    element.each(function () {
        $(this).removeClass('has-error');
    });
    
    //on masque chaque message renseigné
    label.each(function () {
        $(this).hide();
    });
}