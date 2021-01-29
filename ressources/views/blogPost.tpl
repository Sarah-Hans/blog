<?php require 'header.tpl';?>
<main>
    <?php if (isset($id_post)): ?>
        <?php foreach ($the_post as $row): ?>
            <article class="onepost">
                <header class="post_header">
                    <h1 class="post_title"><?php echo $row['title']; ?></h1>
                    <p class="post_author">Article écrit par <?php echo $row['nickname']; ?></p>
                </header>
                <p class="post_content"><?php echo $row['text']; ?></p>
            </article>
            <?php if(isset($comments_on_post)): ?>
            <h2 class="comment_title">Commentaires</h2>
                <?php foreach($comments_on_post as $row): ?>
                    <p><?php echo $row['nickname']; ?></p>
                    <p><?php echo $row['text']; ?></p>
                <?php endforeach; ?>
            <?php else: ?>
                <p>Il n'y a pas encore de commentaire sur cet article.</p>
            <?php endif; ?>
        <?php endforeach; ?>
    <?php endif; ?>

</main>
<?php require 'footer.tpl'; ?>