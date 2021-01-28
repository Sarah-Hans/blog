<?php

include 'app/persistences/blogPostData.php';
$theposts = lastBlogPosts($db);
include 'ressources/views/home.tpl';


