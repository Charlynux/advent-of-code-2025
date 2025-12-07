readfile =: 1!:1

exampleinput =: readfile < './example-input'
input =: readfile < './input'

m =: ><;._2 exampleinput
] p =: ". }: m
] o =: |: '+'= >;:{: m

] e =: {: |: p , o

v =: 12 13 14 15
NB. On applique l'opération cumulative, sauf sur le dernier élément
mult =: */@}:
add =: +/@}:
NB. Le dernier élément {: détermine si on utilise mult ou add
u =: mult`add@.{:
x =: 12 13 14 15 1
u x
u e

] final =: |: p , o

+/ u@> { final NB. 4277556

m =: ><;._2 input

] p =: ". }: m
] o =: |: '+'= >;:{: m
] final =: |: p , o

NB. 6957525317641
+/ u@> { final 

