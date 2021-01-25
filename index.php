<?php
//voir les erreurs
error_reporting (E_ALL);
ini_set('display_errors', true);
ini_set('html_errors', false);
ini_set('display_startup_errors',true);
ini_set('log_errors', false);
error_reporting (E_ALL);
ini_set('display_errors', true);

//appel à la base de données
require 'config/database.php';
//mise en buffer
ob_start();
$action = filter_input(INPUT_GET, 'action', FILTER_SANITIZE_URL);

//tableau de routes
$routes = [

];

//Condition qui détermine le contenu à afficher en fonction des paramètres $action demandés (ou non)
if (isset($action)) {
    if (array_key_exists($action, $routes)) {
        require $routes[$action];
    } else {
        require $routes['404'];
    }
} else {
    require $routes['accueil'];
}
//affichage de ce qui était en buffer via la variable $render
$render = ob_get_clean();
echo $render;