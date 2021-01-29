<main>
    <h1>Publiez votre article :</h1>
    <form action="index.php?action=create" method ="POST">
        <div>
            <label for="titre">Titre de l'article :</label><br>
            <input type="text" name="titre">
        </div>
        <div>
            <label for="contenu">Contenu de l'article :</label><br>
            <textarea id="contenu" name="texte" rows="20" cols="80">Rédigez ici votre article...</textarea>
        </div>
        <div>
            <label for="importance">Importance :</label><br>
            <input type="text" name="importance">
        </div>
        <div>
            <label for="date_debut">Date de début de publication</label><br>
            <input type="date" name="date_debut">
        </div>
        <div>
            <label for="date_fin">Date de fin de publication</label><br>
            <input type="date" name="date_fin">
        </div>
        <div>
            <label for="author">Publier l'article en tant que :</label><br>
            <select name="author">
                <option value="">--Sélectionnez un auteur--</option>
                <option value="1">Matéo</option>
                <option value="2">Valentine</option>
                <option value="3">Jdupont</option>
                <option value="4">JJGoldman</option>
                <option value="5">SHans</option>
            </select>
        </div>
        <div class="bouton">
            <button type="submit" name="bouton">Publier</button>
        </div>
    </form>
</main>