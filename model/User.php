<?php

include_once '..\Base.php';

/**
 * Représente les utilisateurs du site
 */
class User {

    private $user_id;
    private $username;
    private $password;
    private $email;

    /**
     * Constructeur
     */
    public function __construct() {
        
    }

    /**
     * Fonction d'accès aux attributs d'un objet
     * @param $name le nom de l'attribut
     * @return la valeur de l'attribut
     */
    public function __get($name) {
        //si l'attribut existe on retourne sa valeur
        if (property_exists(__CLASS__, $name)) {
            return $this->$name;
        }
    }

    /**
     * Fonction de modification des attributs d'un objet
     * @param $name le nom de l'attribut à modifier
     * @param $value la valeur de l'attribut à modifier
     */
    public function __set($name, $value) {
        //si l'attribut existe on modifie sa valeur
        if (property_exists(__CLASS__, $name)) {
            $this->$name = $value;
        }
    }

    /**
     * Mise a jour de l'objet courant dans la BDD
     * 
     * Met à jour l'objet courant dans la base s'il existe
     * @return le nombre de lignes mises à jour
     * @throws Exception
     */
    public function update() {
        //si l'user n'a pas d'id on a une erreur
        if (!isset($this->user_id)) {
            throw new Exception(__CLASS__ . ": Primary Key undefined : cannot update");
        }
        //la requète SQL à soumettre à la BDD
        $query = "update users set username=?, password=?, email=? where user_id=?";
        try {
            //connexion à la BDD
            $db = Base::getConnection();

            $pp = $db->prepare($query);
            //définition des paramètres de la requète
            //les chiffres 1,2,3,4 correspondent au premier ?, deuxième ? ...)
            $pp->bindParam(1, $this->username, PDO::PARAM_STR);
            $pp->bindParam(2, $this->password, PDO::PARAM_STR);
            $pp->bindParam(3, $this->email, PDO::PARAM_STR);
            $pp->bindParam(4, $this->user_id, PDO::PARAM_STR);

            //execution de la requète qui renvoit le nombre de lignes modifiées
            $n = $pp->execute();
        } catch (PDOException $e) {
            echo $query . "<br>";
            throw new Exception($e->getMessage());
        }
        return $n;
    }

    /**
     * Suppression dans la base de données
     *  
     * Supprime la ligne de la table correspondant à l'objet courant
     * @throws Exception 
     */
    public function delete() {
        $query = "delete from users where user_id=?";
        try {
            $db = Base::getConnection();

            $pp = $db->prepare($query);

            $pp->bindParam(1, $this->user_id, PDO::PARAM_INT);
            $pp->execute();
        } catch (PDOException $ex) {
            echo $query . "<br>";
            throw new Exception($e->getMessage());
        }
    }

    /**
     * Insertion dans la BDD
     * 
     * Insère l'objet courant dans le BDD
     * @throws Exception
     */
    public function insert() {
        $query = "insert into users (username, password, email) values (?,?,?)";
        try {
            $db = Base::getConnection();

            $pp = $db->prepare($query);

            $pp->bindParam(1, $this->username, PDO::PARAM_STR);
            $pp->bindParam(2, $this->password, PDO::PARAM_STR);
            $pp->bindParam(3, $this->email, PDO::PARAM_STR);

            $pp->execute();
            $this->user_id = $db->LastInsertId();
        } catch (PDOException $e) {
            echo $query . "<br>";
            throw new Exception($e->getMessage());
        }
    }

    /**
     * Trouver un user par son ID
     * 
     * Retourne la ligne de la table correspondant à l'ID passé en paramètre
     * @param $id l'identifiant à chercher
     * @return l'user correspondant
     */
    public static function findById($id) {
        $query = "select * from users where user_id=?";
        try {
            $db = Base::getConnection();

            $pp = $db->prepare($query);

            $pp->bindParam(1, $id, PDO::PARAM_INT);
            $pp->execute();

            /* retourne un tableau indexé par les noms de colonnes 
             * et aussi par les numéros de colonnes, 
             * commençant à l'index 0
             */
            $rep = $pp->fetch(PDO::FETCH_BOTH);

            //creation d'un nouvel utilisateur
            $user = new User();
            //utilisation des setter pour définir les valeurs
            $user->user_id = $rep[0];
            $user->username = $rep[1];
            $user->password = $rep[2];
            $user->email = $rep[3];
        } catch (PDOException $e) {
            echo $query . "<br>";
            throw new Exception($e->getMessage());
        }
        return $user;
    }

    /**
     * Retourne tous les User contenus dans le BDD
     * 
     * @return un tableau de User
     * @throws Exception
     */
    public static function findAll() {
        $query = "select * from users ";
        try {
            $db = Base::getConnection();

            $pp = $db->prepare($query);
            $pp->execute();

            //creation d'un tableau d'objets user
            $rep = $pp->fetchAll(PDO::FETCH_OBJ);
            $usersList = array();

            //pour chaque user renvoyé par la requète on va l'ajouter dans un tableau
            foreach ($rep as $row) {
                $user = new User();
                $user->user_id = $row->user_id;
                $user->username = $row->username;
                $user->password = $row->password;
                $user->email = $row->email;
                $usersList[] = $user;
            }
        } catch (PDOException $e) {
            echo $query . "<br>";
            throw new Exception($e->getMessage());
        }

        return $usersList;
    }

    /**
     * Recherche un user grâce à son username
     * 
     * @param type $username
     * @return \User
     * @throws Exception
     */
    public static function findByUsername($username) {
        $query = "select * from users where username=?";
        try {
            $db = Base::getConnection();

            $pp = $db->prepare($query);

            $pp->bindParam(1, $username, PDO::PARAM_STR);
            $pp->execute();

            /* retourne un tableau indexé par les noms de colonnes 
             * et aussi par les numéros de colonnes, 
             * commençant à l'index 0
             */
            $rep = $pp->fetch(PDO::FETCH_ASSOC);

           
        } catch (PDOException $e) {
            echo $query . "<br>";
            throw new Exception($e->getMessage());
        }
        return $rep;
    }

}
