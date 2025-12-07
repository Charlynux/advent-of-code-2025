NB. The Cheatsheet : https://sergeyqz.github.io/jcheatsheet/
NB. Conway's Game of Life in J : https://copy.sh/jlife/

] m =: 4 4 $ i.16
NB. m =
NB. 0 1 2
NB. 3 4 5
NB. 6 7 9
1 { 1 { m NB. Permet de récupérer la valeur à 1,1 => 4
(< 1 1) { m NB. Idem
i:1 NB. -1 0 1 Les indices des voisins qu'on veut visiter

(0 1; 1 1; 1 0) { m NB. Donne les 3 voisins de 0 0

,~<i:1 NB. 2 boxes -1 0 1 ,~y = y , y
(-1 0 1);(-1 0 1) NB. Idem
>,{(-1 0 1);(-1 0 1) NB. { = Cartesian Product | , = flatten | > = unbox
(>,{,~<i:1) NB. Positions des voisins + moi
p=:(4&{.,(_4&{.))(>,{,~<i:1) NB. On garde les 4 premiers et les 4 derniers pour retirer 0 0
]p
]m

p&|.m
NB. Produit 8 matrices qui sont des rotations (|.) de m.
NB. Si j'ai bien saisi l'idée, c'est qu'on a 1 matrice par voisin.
NB. J'ai donc une matrice pour le voisin 0,1 ou une pour le 1,0 ...
NB. Si je somme les matrices, j'ai la somme de mes voisins.
NB. MAIS on semble être dans une version "wrapping" du jeu de la vie.
NB. Les points aux extrémités sont voisins des points de l'autre extrémité.

ones =: 5 5 $ 1
+/(p&|.ones) NB. Ici, on voit bien qu'on trouve 8 voisins partout.

NB. Moi, je veux obtenir ça.
NB. 3 5 5 5 3
NB. 5 8 8 8 5
NB. 5 8 8 8 5
NB. 5 8 8 8 5
NB. 3 5 5 5 3

NB. Analyse du "rotate" (|.) avec des paires
(0, 0)&|.m NB. Identique
(0, 1)&|.m NB. Chaque ligne s'est décalée de 1 vers la gauche


1}.&> { m

x=:1 2 3
4 $!.'' x

fill =: 4&($!.'') NB. & = Bond

4&($!.'') 1&}. 1 2 3 4 NB. Donne bien '2 3 4 0'
((4&($!.''))@(1&}.)) 1 2 3 4

((4&($!.''))@(1&}.)) &> { m
NB. On obtient la matrice attendue

1 |. !.'' 1 2 3 4  NB. Vachement plus simple ! Shift
(0, 1) |. !.'' m
(0, -1) |. !.'' m
(0, 1)&(|.!.'') m

+/p&(|.!.'')ones NB. ON A BIEN LES VOISINS !!!
NB. fewer than four

+/,(4&>)+/p&(|.!.'') ones
readfile =: 1!:1
exampleinput =: readfile < './example-input'
NB. On a 110 caractères 10 + \n sur 10 lignes
10 11 $ exampleinput
NB. 10 10 après "split by lines"
$ ><;._2 exampleinput

] m =: '@'&= ><;._2 exampleinput
NB. On trouve "facilement" tous les points avec 4 ou plus de voisins.
NB. MAIS on ne doit garder que les points initiaux.
] t =: (4&>)+/p&(|.!.'') m
m * t NB. On se sert de la matrice initiale pour appliquer un masque.
+/, m * t NB. On trouve bien 13

input =: readfile < './input'
$ ><;._2 input
m1 =: '@'&= ><;._2 input
t1 =: (4&>)+/p&(|.!.'') m1
+/, m1 * t1 NB. 1505

