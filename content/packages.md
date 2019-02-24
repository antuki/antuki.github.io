---
disable_comments: false
nodateline: true
title: Packages R
---

<center><a href="https://antuki.github.io/COGugaison/"><img src="https://antuki.github.io/img/COGugaison.png" width="200"></a></center>

COGugaison est un package R permettant de manipuler des données communales produites à différents millésimes et les agréger à des niveaux supra-communaux. 

Le découpage des territoires français, en particulier les communes, n’est pas un phénomène immuable. Chaque année certaines communes changent de codes, ou bien de nom, fusionnent ou encore se divisent. Certains périmètres supra-communaux changent également, comme celui des cantons qui a été récemment redéfini. C’est à l’Insee que revient le suivi de ces changements afin d’établir chaque année le code officiel géographique (COG).

Ce package R a alors pour objectif global de manipuler des données communales produites à différents millésimes et de les agréger à différents niveaux supra-communaux. 

<center><a href="https://github.com/antuki/CARTElette"><img src="https://antuki.github.io/img/CARTElette.png" width="200"></a></center>

Le répertoire CARTElette vient en complément du package COGugaison. Il s'agit ici de créer des couches cartographiques (communales et supra-communales) qui correspondent à la situation du découpage des territoires français (communes et niveaux supra-communaux, France et Outre-mer) au 01 janvier de chaque année (date de référence du code officiel géographique).

Un package R est aussi adossé à ce repository. Il permet à ce stade de charger la couche cartographique adaptée à vos données en indiquant l'année du code officiel géographique (COG) ainsi que le niveau géographique (communal ou supra-communal) souhaités.