<?php

include 'app/persistences/blogPostData.php';
$id_post = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
$the_post = blogPostById($db, $id_post);
include 'ressources/views/blogPost.tpl.php';
