<main>
    <?php if (isset($id_post)): ?>
        <h1>Modifiez votre article :</h1>
        <?php foreach ($the_post as $row): ?>
            <form action="index.php?action=blogPostModify&id=<?=$id_post ?>" method ="POST">
                <div>
                    <label for="titre">Titre de l'article :</label><br>
                    <input type="text" name="titre" value="<?=$row['title']; ?>">
                </div>
                <div>
                    <label for="contenu">Contenu de l'article :</label><br>
                    <textarea id="contenu" name="texte" rows="20" cols="80"><?=$row['text']; ?></textarea>
                </div>
                <div>
                    <label for="importance">Importance :</label><br>
                    <input type="text" name="importance" value="<?=$row['importance']; ?>">
                </div>
                <div>
                    <label for="date_debut">Date de début de publication</label><br>
                    <input type="date" name="date_debut" value="<?=$row['publication_date_start']; ?>">
                </div>
                <div>
                    <label for="date_fin">Date de fin de publication</label><br>
                    <input type="date" name="date_fin" value="<?=$row['publication_date_end']; ?>">
                </div>
                <div>
                    <label for="author">Publier l'article en tant que :</label><br>
                    <select name="author">
                        <option value="<?=$row['authors_id']; ?>"><?=$row['publication_date_end']; ?></option>
                    </select>
                </div>
                <div class="bouton">
                    <button type="submit" name="bouton">Publier</button>
                </div>
            </form>
        <?php endforeach; ?>
    <?php endif; ?>
</main>