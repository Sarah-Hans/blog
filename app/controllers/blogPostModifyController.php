<?php
include 'app/persistences/blogPostData.php';

if(filter_has_var(INPUT_GET,'id')) {
    $id_post = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
    $the_post = blogPostById($db, $id_post);
    if (isset($_POST['bouton'])) {
        blogPostUpdate($db, $id_post, $_POST["titre"], $_POST["texte"], $_POST["importance"], $_POST["date_debut"], $_POST["date_fin"], $_POST["author"]);
    }
}
else {
    echo "Il n'y a pas d'article à modifier ici.";
}

include 'ressources/views/blogPostUpdate.tpl';