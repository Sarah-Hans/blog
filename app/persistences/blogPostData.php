<?php

//Fonction qui sélectionne les 10 derniers articles dans la base et les affiche
function lastBlogPosts($db) {
    $posts = $db->query('SELECT title, text, nickname
FROM posts INNER JOIN authors
                      ON posts.authors_id = authors.id
ORDER BY publication_date_start DESC
    LIMIT 10');
    $posts = $posts->fetchAll(PDO:: FETCH_ASSOC);
    return $posts;
}