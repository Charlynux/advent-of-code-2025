is_empty_string(S) :-
    S == "".

split_input(Lines, Pairs, Values) :-
    append(Pairs , ["" | Values], Lines).

parse_pair(Pair, Line) :-
    split_string(Line, "-", "", Elements),
    maplist(number_string, Pair, Elements).

parse_input(Input, Pairs, Values) :-
    split_string(Input, "\n", "", Lines),
    split_input(Lines, StrPairs, StrValues),
    maplist(parse_pair, Pairs, StrPairs),
    % Juste pour la dernière ligne........
    exclude(is_empty_string, StrValues, NumberValues),
    maplist(number_string, Values, NumberValues).

read_input(Filename, Pairs, Values) :-
    read_file_to_string(Filename, String, []),
    parse_input(String, Pairs, Values).

inranges(Pairs, S) :-
    member([A, B], Pairs),
    between(A, B, S).

part1(Pairs, Numbers, N) :-
    include(inranges(Pairs), Numbers, Filtered),
    length(Filtered, N).

solve_part1(Input, N) :-
    parse_input(Input, Pairs, Numbers),
    part1(Pairs, Numbers, N).

% -? read_file_to_string("input", String, []), solve_part1(String, N).

part2(Pairs, N) :-
    setof(V, inranges(Pairs, V), Results),
    length(Results, N).

solve_part2(Input, N) :-
    parse_input(Input, Pairs, _),
    part2(Pairs, N).

% -? read_file_to_string("input", String, []), solve_part2(String, N).
