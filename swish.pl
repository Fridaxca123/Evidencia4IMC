% Base de conocimiento
% cancion(Titulo, Genero, EstadoDeAnimo, Idioma, Decada, Autor).
cancion('A Thousand Years', romantica, calmado, ingles, 10, 'Christina Perri').
cancion('Amorfoda', romantica, nostalgico, espanol, 10, 'Bad Bunny').
cancion('Bad Guy', pop, energico, ingles, 10, 'Billie Eilish').
cancion('Bailando', pop, alegre, espanol, 10, 'Enrique Iglesias').
cancion('Billie Jean', pop, energico, ingles, 80, 'Michael Jackson').
cancion('Blinding Lights', pop, energico, ingles, 20, 'The Weeknd').
cancion('Canon in D', clasica, calmado, instrumental, 80, 'Pachelbel').
cancion('Color Esperanza', pop, calmado, espanol, 0, 'Diego Torres').
cancion('Dance Monkey', pop, energico, ingles, 20, 'Tones and I').
cancion('De Música Ligera', rock, energico, espanol, 90, 'Soda Stereo').
cancion('Don’t Start Now', pop, energico, ingles, 20, 'Dua Lipa').
cancion('Eres', romantica, calmado, espanol, 0, 'Café Tacvba').
cancion('Halo', pop, calmado, ingles, 0, 'Beyoncé').
cancion('Hips Dont Lie', reggaeton, alegre, ingles, 0, 'Shakira').
cancion('Hotel California', rock, nostalgico, ingles, 70, 'Eagles').
cancion('La Bicicleta', pop, alegre, espanol, 10, 'Carlos Vives y Shakira').
cancion('Livin la Vida Loca', pop, alegre, espanol, 90, 'Ricky Martin').
cancion('Numb', rock, nostalgico, ingles, 0, 'Linkin Park').
cancion('O Fortuna', clasica, energico, instrumental, 80, 'Carl Orff').
cancion('Perfect', romantica, calmado, ingles, 10, 'Ed Sheeran').
cancion('River Flows in You', clasica, calmado, instrumental, 0, 'Yiruma').
cancion('Shallow', pop, calmado, ingles, 10, 'Lady Gaga y Bradley Cooper').
cancion('Stairway to Heaven', rock, nostalgico, ingles, 70, 'Led Zeppelin').
cancion('Tacones Rojos', pop, alegre, espanol, 20, 'Sebastián Yatra').
cancion('Take On Me', pop, alegre, ingles, 80, 'a-ha').
cancion('Te Boté', reggaeton, nostalgico, espanol, 10, 'Nio García, Casper Mágico, Bad Bunny').
cancion('Tusa', reggaeton, nostalgico, espanol, 20, 'Karol G y Nicki Minaj').
cancion('Viva La Vida', pop, alegre, ingles, 0, 'Coldplay').
cancion('Zombie', rock, rebelde, ingles, 90, 'The Cranberries').

% Regla logica que permite recomendar si lo ingresado coincide con las reglas
recomendar(GustoGenero, GustoEstado, GustoIdioma, GustoDecada, Cancion, Autor) :-
    cancion(Cancion, GustoGenero, GustoEstado, GustoIdioma, GustoDecada, Autor).

% Checa que el dato ingresado sea valido
generoValido(G) :-
    member(G, [rock, pop, romantica, clasica, reggaeton]).

estadoValido(E) :-
    member(E, [alegre, calmado, energico, rebelde, nostalgico]).

idiomaValido(I) :-
    member(I, [espanol, ingles]).

decadaValido(D) :-
    member(D, [70, 80, 90, 00, 10, 20]).

% Verificar que el dato sea valido e intenta encontrar la canción que coincida
sugerencia(G, E, I, D, Cancion, Autor) :-
    generoValido(G),
    estadoValido(E),
    idiomaValido(I),
    decadaValido(D),
    recomendar(G, E, I, D, Cancion, Autor).

chatbot :-
    % Imprime texto
    write('Hola, bienvenido a Find Your Song .'), nl,
    write('Qué género prefieres? (rock, pop, romantica, clasica, reggaeton)'), nl,
    % Recibe el texto
    read(Genero),
    % Verifica que el dato sea valido
    (generoValido(Genero) ->
    % Si es valido continua
        true ;
    % Si no es valido envia mensaje de error y finaliza el proceso
        write('El genero no es valido, por favor intentelo de nuevo.'), nl, fail),

    write('Cuál es tu estado de ánimo? (alegre, calmado, energico, rebelde, nostalgico)'), nl,
    read(Estado),
    (estadoValido(Estado) ->
        true ;
        write('El estado de animo no es valido, por favor intentelo de nuevo'), nl, fail),

    write('En qué idioma prefieres la canción? (espanol, ingles, instrumental)'), nl,
    read(Idioma),
    (idiomaValido(Idioma) ->
        true ;
        write('El idioma no es valido por favor intentelo de nuevo .'), nl, fail),
    
    write('De que decada prefieres tu musica? (70, 80, 90, 00, 10, 20)'), nl,
    read(Decada),
    (decadaValido(Decada) ->
        true ;
        write('La decada no es valida, por favor intentelo de nuevo.'), nl, fail),


    (sugerencia(Genero, Estado, Idioma, Decada, Cancion, Autor) ->
        write('En base a tus preferencias te recomiendo: '), nl,
        write('Canción: '), write(Cancion), nl,
        write('Autor: '), write(Autor), nl
    ;
        write('Lo siento no hemos encontrado una cancion para ti :(.'), nl
    ).

