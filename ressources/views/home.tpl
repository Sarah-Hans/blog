<?php require 'header.tpl'; ?>
<main>
<?php if(!isset($theposts)) : ?>
    <p>Aucun article n'a été publié.</p>
 <?php else:
    foreach ($theposts as $row): ?>
        <article class="home_post">
            <header class="post_header">
                <a href="index.php?action=blogpost&id=<?php echo $row['id']; ?>"><h2 class="post_title"><?php echo $row['title']; ?></h2></a>
                <p class="post_author">Article écrit par <?php echo $row['nickname']; ?></p>
            </header>
            <p class="post_content"><?php echo $row['text']; ?></p>
        </article>
    <?php endforeach; ?>
<?php endif; ?>

</main>
<?php require 'footer.tpl'; ?>

