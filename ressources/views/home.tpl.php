<?php require 'header.tpl.php'; ?>
<main>
<?php if(!isset($theposts)) : ?>
    <p>Aucun article n'a été publié.</p>
 <?php else:
    foreach ($theposts as $row): ?>
        <article class="home_post">
            <header class="post_header">
                <h2 class="post_title"><?php echo $row['title']?></h2>
                <p class="post_author">Articlé écrit par <?php echo $row['nickname']?></p>
            </header>
            <p class="post_content"><?php echo $row['text']?></p>
        </article>
    <?php endforeach; ?>
<?php endif; ?>

</main>
<?php require 'footer.tpl.php'; ?>

