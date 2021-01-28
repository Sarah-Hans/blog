<?php

include 'app/persistences/blogPostData.php';
if(filter_has_var(INPUT_GET,'id')) {
    $id_post = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
    $the_post = blogPostById($db, $id_post);
    $comments_on_post = commentsByBlogPost($db, $id_post);
}
else {
    echo "Il n'y a pas d'article ici.";
}
include 'ressources/views/blogPost.tpl.php';
