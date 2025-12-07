% Implémentation fonctionnelle pour l'exemple.
% Testée uniquement via un éditeur "online".

split_input(Lines, Pairs, Values) :-
    append(Pairs , ["" | Values], Lines).

parse_pair(Pair, Line) :-
    split_string(Line, "-", "", Elements),
    maplist(number_string, Pair, Elements).

parse_input(Input, Pairs, Values) :-
    split_string(Input, "\n", "", Lines),
    split_input(Lines, StrPairs, StrValues),
    maplist(parse_pair, Pairs, StrPairs),
    maplist(number_string, Values, StrValues).

read_input(Filename, Pairs, Values) :-
    read_file_to_string(Filename, String, []),
    parse_input(String, Pairs, Values).

solve_part1(Input, N) :-
    parse_input(Input, Pairs, Numbers),
    part1(Pairs, Numbers, N).

solve_part1("3-5
10-14
16-20
12-18

1
5
8
11
17
32
", N).

% A TESTER
read_file_to_string("input", String, []),
solve_part1(String, N).
