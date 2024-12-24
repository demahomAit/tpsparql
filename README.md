# README

## Description du projet

Cette application est un exécuteur de requêtes SPARQL avec une interface graphique conviviale développée en Python. Elle permet d'exécuter, d'ajouter et de gérer des requêtes SPARQL stockées dans une base de données MySQL. Elle utilise les bibliothèques suivantes :

- `SPARQLWrapper`: Pour interagir avec des endpoints SPARQL, comme celui de DBpedia.
- `ttkbootstrap`: Pour une interface utilisateur moderne et stylée.
- `mysql.connector`: Pour la connexion à une base de données MySQL.
- `tkinter`: Pour la gestion de l'interface utilisateur.

## Concepts SPARQL

### SPARQL
SPARQL (SPARQL Protocol and RDF Query Language) est un langage de requête utilisé pour extraire et manipuler des données stockées dans un format RDF (Resource Description Framework). Il est souvent utilisé pour interagir avec des bases de données RDF, telles que DBpedia, Wikidata, ou d'autres endpoints de Linked Data.

### Structure d'une requête SPARQL
1. **PREFIX**: Définit les espaces de noms pour simplifier les URIs.
2. **SELECT**: Spécifie les variables à récupérer.
3. **WHERE**: Définit les conditions pour filtrer les données RDF.
4. **OPTIONAL**: Permet de récupérer des données facultatives.
5. **FILTER**: Ajoute des conditions pour limiter les résultats.

Exemple de requête :
```sparql
PREFIX dbo: <http://dbpedia.org/ontology/>
SELECT ?name ?birthPlace
WHERE {
    ?person dbo:birthPlace ?birthPlace ;
           foaf:name ?name .
    FILTER(lang(?name) = "en")
}
```

### Endpoint SPARQL
Un endpoint SPARQL est une interface HTTP qui permet de soumettre des requêtes SPARQL et de récupérer les résultats. Par exemple, l'endpoint de DBpedia est disponible à `https://dbpedia.org/sparql`.

## Fonctionnalités principales

1. **Connexion à MySQL**
   - La configuration de la base de données est définie dans un dictionnaire `DB_CONFIG`. Cela inclut les paramètres de connexion tels que l'hôte, le nom d'utilisateur, le mot de passe et la base de données.

2. **Gestion des requêtes**
   - Ajout de nouvelles requêtes à la base de données.
   - Chargement des requêtes existantes depuis la base de données.
   - Suppression des requêtes stockées.

3. **Exécution des requêtes SPARQL**
   - Test de la connectivité HTTPS avec l'endpoint SPARQL.
   - Exécution des requêtes sélectionnées et affichage des résultats dans une zone de texte défilante.

4. **Interface utilisateur**
   - Création d'une interface graphique avec `ttkbootstrap` pour une expérience utilisateur améliorée.
   - Sélection des requêtes via un menu déroulant.
   - Boutons pour exécuter, ajouter et supprimer des requêtes.

## Structure du code

### Modules principaux
- **`connect_to_db`**: Gère la connexion à la base de données MySQL.
- **`test_https`**: Vérifie la connectivité HTTPS à l'endpoint SPARQL.
- **`query_dbpedia`**: Exécute une requête SPARQL contre un endpoint donné.
- **`process_results`**: Traite et formate les résultats de la requête SPARQL pour affichage.
- **`on_execute_query`**: Gère l'exécution d'une requête sélectionnée et l'affichage des résultats.
- **`load_queries_from_db`**: Charge les noms des requêtes depuis la base de données dans le menu déroulant.
- **`on_add_query`**: Permet d'ajouter une nouvelle requête à la base de données.
- **`on_delete_query`**: Supprime une requête de la base de données et met à jour le menu déroulant.
- **`create_gui`**: Crée l'interface utilisateur avec tous les composants nécessaires.

## Instructions d'utilisation

### Pré-requis
- Python 3.7 ou version ultérieure.
- MySQL installé localement ou accessible à distance.
- Bibliothèques Python : `SPARQLWrapper`, `ttkbootstrap`, `mysql-connector-python`.

### Installation
1. Clonez ce dépôt :
   ```bash
   git clone <url-du-dépôt>
   cd <nom-du-dépôt>
   ```
2. Installez les dépendances Python :
   ```bash
   pip install SPARQLWrapper ttkbootstrap mysql-connector-python
   ```
3. Configurez la base de données MySQL :
   - Créez une base de données appelée `sparql_queries`.
   - Ajoutez une table `queries` avec les colonnes suivantes :
     ```sql
     CREATE TABLE queries (
         id INT AUTO_INCREMENT PRIMARY KEY,
         query_name VARCHAR(255) NOT NULL,
         query_text TEXT NOT NULL
     );
     ```

### Exécution
Exécutez le script principal pour lancer l'application :
```bash
python <nom-du-script>.py
```

### Utilisation de l'application
- **Ajouter une requête** : Fournissez un nom et le texte de la requête, puis cliquez sur "Add Query".
- **Exécuter une requête** : Sélectionnez une requête dans le menu déroulant et cliquez sur "Execute Query".
- **Supprimer une requête** : Sélectionnez une requête et cliquez sur "Delete Query".

## Vidéo de démonstration

[![Regarder la vidéo](https://drive.google.com/uc?id=1kVH5UG6s5LDEp5FzUliw8LDcGEsxOo_j)](https://drive.google.com/file/d/1kVH5UG6s5LDEp5FzUliw8LDcGEsxOo_j/view?usp=sharing)


## Journalisation
L'application génère des journaux pour suivre les erreurs et les succès dans un format lisible dans la console.

## Auteurs
Mohamed Ait Louhou

---
N'hésitez pas à améliorer cette application ou à signaler des problèmes via les issues du dépôt.

