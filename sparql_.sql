-- Créer la base de données sparql_queries
CREATE DATABASE IF NOT EXISTS sparql_queries;

-- Utiliser la base de données sparql_queries
USE sparql_queries;

-- Créer la table pour stocker les requêtes SPARQL
CREATE TABLE IF NOT EXISTS queries (
    id INT AUTO_INCREMENT PRIMARY KEY,          -- Identifiant unique pour chaque requête
    query_name VARCHAR(255) NOT NULL UNIQUE,    -- Nom de la requête (unique)
    query_text TEXT NOT NULL                    -- Texte de la requête SPARQL
);

INSERT INTO queries (query_name, query_text) VALUES
('Java programming language', 'PREFIX dbo: <http://dbpedia.org/ontology/> PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> SELECT ?label ?abstract WHERE { <http://dbpedia.org/resource/Java_(programming_language)> rdfs:label ?label ; dbo:abstract ?abstract . FILTER (lang(?label) = ''en'' && lang(?abstract) = ''en'') } LIMIT 10'),
('Python programming language', 'PREFIX dbo: <http://dbpedia.org/ontology/> PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> SELECT ?label ?abstract WHERE { <http://dbpedia.org/resource/Python_(programming_language)> rdfs:label ?label ; dbo:abstract ?abstract . FILTER (lang(?label) = ''en'' && lang(?abstract) = ''en'') } LIMIT 10'),
('Countries and capitals', 'PREFIX dbo: <http://dbpedia.org/ontology/> PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> SELECT ?country ?capital WHERE { ?country a dbo:Country ; dbo:capital ?capital . ?country rdfs:label ?countryLabel . ?capital rdfs:label ?capitalLabel . FILTER (lang(?countryLabel) = ''en'' && lang(?capitalLabel) = ''en'') } LIMIT 10');