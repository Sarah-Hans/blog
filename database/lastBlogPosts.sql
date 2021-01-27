SELECT title, text, nickname
FROM posts INNER JOIN authors
                      ON posts.authors_id = authors.id
ORDER BY publication_date_start DESC
    LIMIT 10