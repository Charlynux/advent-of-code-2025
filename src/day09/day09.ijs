] m =: 8 2 $ 7 1 11 1 11 7 9 7 9 5 2 5 2 3 7 3

s =: {{ */ x +&1@|@- y }}"1 NB. Le "1, passe le verbe au rang 1 : Liste

9 7 s 2 5

(0 { m) s (1 { m)
(0 { ) s (0 { m) NB. Aire de 1 pour le même point
(9 7) u (2 5)

>./, s/~m

readfile =: 1!:1

parse_input =: [

exampleinput =: parse_input readfile < './example-input'
input =: parse_input readfile < './input'

<;._1 ',','7,1'
u =: ','&,
v =: ".;._1
t =: v@u@>

>./, s/~t <;._2 exampleinput

>./, s/~t <;._2 input

