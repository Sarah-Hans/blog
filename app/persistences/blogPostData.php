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

//Fonction qui affiche un article en fonction de son id
function blogPostById($db, $post_id) {
    $post_unique = $db->query('SELECT posts.id, title, text, importance, publication_date_start, publication_date_end, nickname
FROM posts INNER JOIN authors
                      ON posts.authors_id = authors.id
WHERE posts.id ="'.$post_id.'"');
    $post_unique = $post_unique->fetchALL(PDO::FETCH_ASSOC);
    return $post_unique;
}

//Fonction qui affiche les commentaires sur l'article
function commentsByBlogPost($db, $post_id) {
    $comments_on_post = $db->query('SELECT posts_id, authors_id, text, nickname
FROM comments INNER JOIN authors
ON comments.authors_id = authors.id
WHERE posts_id="'.$post_id.'"');
    $comments_on_post = $comments_on_post->fetchALL(PDO::FETCH_ASSOC);
    return $comments_on_post;
}

//Fonction qui permet d'envoyer les données de création de l'article dans la base de données
function blogPostCreate ($db, $title, $text, $importance, $startdate, $enddate, $authorid ) {
    $sql = 'INSERT INTO posts (title, text, importance, publication_date_start, publication_date_end, authors_id)
VALUES ("'.$title.'", "'.$text.'", "'.$importance.'", "'.$startdate.'", "'.$enddate.'", "'.$authorid.'")';
    $count = $db->exec($sql);
    $db = null; // Disconnect

    if ($count !== false) {
        echo 'Publié ! Nombre de ligne(s) ajoutée(s) : ' . $count;
    }
}

//Fonction qui permet de modifier un article existant en fonction de son id
function blogPostUpdate ($db, $post_id, $title, $text, $importance, $startdate, $enddate, $authorid) {
    $sql = 'UPDATE posts 
    SET title = "'.$title.'", text = "'.$text.'", importance = "'.$importance.'", publication_date_start = "'.$startdate.'", publication_date_end = "'.$enddate.'", authors_id = "'.$authorid.'"
    WHERE id = "'.$post_id.'"';
    $update_post = $db->exec($sql);
    $db = null;
    if ($update_post !== false) {
        echo 'Votre article a été mis à jours !';
    }
}