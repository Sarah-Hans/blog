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

function blogPostById($db, $post_id) {
    $post_unique = $db->query("SELECT title, text, nickname
FROM posts INNER JOIN authors
                      ON posts.authors_id = authors.id
WHERE id=$post_id");
    $post_unique = $post_unique->fetchALL(PDO::FETCH_ASSOC);
    return $post_unique;
}