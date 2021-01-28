<?php

//Fonction qui sélectionne les 10 derniers articles dans la base et les affiche
function lastBlogPosts($db) {
    $posts = $db->query('SELECT posts.id, title, text, nickname
FROM posts INNER JOIN authors
                      ON posts.authors_id = authors.id
ORDER BY publication_date_start DESC
    LIMIT 10');
    $posts = $posts->fetchAll(PDO:: FETCH_ASSOC);
    return $posts;
}

function blogPostById($db, $post_id) {
    $post_unique = $db->query('SELECT posts.id, title, text, nickname
FROM posts INNER JOIN authors
                      ON posts.authors_id = authors.id
WHERE posts.id ="'.$post_id.'"');
    $post_unique = $post_unique->fetchALL(PDO::FETCH_ASSOC);
    return $post_unique;
}

function commentsByBlogPost($db, $post_id) {
    $comments_on_post = $db->query('SELECT posts_id, authors_id, text, nickname
FROM comments INNER JOIN authors
ON comments.authors_id = authors.id
WHERE posts_id="'.$post_id.'"');
    $comments_on_post = $comments_on_post->fetchALL(PDO::FETCH_ASSOC);
    return $comments_on_post;
}

function blogPostCreate ($db, $title, $text, $importance, $startdate, $enddate ) {
    $db->exec('INSERT INTO posts (title, text, importance, publication_date_start, publication_date_end)
VALUES ("'.$title.'", "'.$text.'", "'.$importance.'", "'.$startdate.'", "'.$enddate.'")');
echo "Votre article a bien été publié";
}