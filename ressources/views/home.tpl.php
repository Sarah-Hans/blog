<?php require 'header.tpl.php'; ?>
<?php
$theposts = lastBlogPosts($db);
if(!isset($theposts)) {
    echo "Il n'y a aucun article publié";
} else {
    foreach ($theposts as $row) {
        echo "<li>".$row['title']." - ".$row['text']." - ".$row['nickname'];
    }
}
?>

<?php require 'footer.tpl.php'; ?>

