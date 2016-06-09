<?php

include_once '../model/User.php';

/**
 * Description of ControllerUser
 *
 * @author Guillaume
 */
class ControllerUser {

    /**
     * Verifie si l'utilisateur existe et si son mot de passe correspond
     * Si c'est le cas, effectue la connexion
     * @param String $username
     * @param String $pass
     */
    public static function connect($username, $pass) {
        //recherche de l'utilisateur
        $user = User::findByUsername($username);
        
        $output = '';
        
        //si l'utilisateur existe
        if (isset($user['username'])) {
            //si le mot de passe est le bon
            if($pass == $user['password']){
                //alors on démarre la session de l'utilisateur
                $_SESSION['user_id'] = $user['user_id'];
                $_SESSION['username'] = $user['username'];
                //on génère l'affichage du bouton de déconnexion avec le nom de l'utilisateur
                $output = '<span class="glyphicon glyphicon-off pull-left"></span> '. $_SESSION['username'] ;      
            }
        }
        echo $output;
    }
    
    /**
     * Déconnecte l'utilisateur et détruit la session
     */
    public static function logout(){
        //déconnexion et destruction de la session
        session_unset();
        session_destroy();
        //remise à zero de la session (utilisateur pas défaut)
        session_start();
        $_SESSION['user_id'] = 0;
        $_SESSION['username'] = 'default';
        echo '<span class="glyphicon glyphicon-log-in pull-left"></span> Connexion';
    }
    
    /**
     * Permet d'afficher le formulaire d'inscription à partir du fichier html
     */
    public static function displayFormSubscribe(){
        $form = file_get_contents('../view/html/subscribe_form.html');
        echo $form;
    }
    
    /**
     * Permet d'insérer un nouvel utilisateur dans la BDD
     * @param String $username
     * @param String $password
     * @param String $email
     */
    public static function subscribe($username, $password, $email){
        //création du nouvel utilisateur
        $user = new User();
        $user->username = htmlspecialchars($username);
        $user->password = htmlspecialchars($password);
        $user->email = htmlspecialchars($email);
        
        //insertion
        $user->insert();
    }

}
