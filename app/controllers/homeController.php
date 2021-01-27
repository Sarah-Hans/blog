<?php

include 'app/persistences/blogPostData.php';

$theposts = lastBlogPosts($db);

//affiche le var_dump de la fonction lastBlogPosts
var_dump($theposts);


