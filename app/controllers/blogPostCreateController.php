<?php
include 'app/persistences/blogPostData.php';

if (!empty($_POST["bouton"])) {
    blogPostCreate($db, $_POST["titre"], $_POST["texte"], $_POST["importance"], $_POST["date_debut"], $_POST["date_fin"]);
}

include 'ressources/views/blogPostCreate.tpl';
