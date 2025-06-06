# Evidencia 4: Demostración de un paradigma de programación 
**Frida Xcaret Vargas Trejo - A01707168**

## Paradigmas

Un paradigma también puede definirse como un método para resolver un problema o realizar una tarea. En particular, un paradigma de programación es un enfoque o estilo que guía la forma en que se estructura y desarrolla el código en un lenguaje de programación especifico.

Para el objetivo del proyecto, en esta ocasión estaré implementando el paradigma de programación logica.
La programación lógica se basa en declarar una base de conocimientos, hechos y reglas que ya se conocen y que describen una parte del mundo real. Junto con esta base, se formula una consulta o pregunta y el sistema lógico se encarga de inferir respuestas válidas basadas en la logica formal.

En la programación logica se describe el problema y el sistema busca automaticamente las soluciones posibles, usando técnicas como unificacion y resolución logica. Prolog es un lenguaje declarativo, lo que implica que en lugar de calcular cómo encontrar una solución, un programa se compone de datos basados ​​en hechos y reglas. Ademas emplea backtracking y unificación para encontrar soluciones a problemas a partir de la base de conocimiento.

Prolog es popular en la inteligencia articfial, algunas de las ventajas de implementar prolog y el paradigma logico es facil de construir una base de datos, la combinación de patrones es facil, basa sus busquedas en recursion y tiene manejo de listas incorporado. Las desventajas incluyen que la entrada y salida de datos no es sencilla y existe el lenguaje LISP [2] que maneja de mejor manera lo anterior. 

## Descripción 

Implementare un chatbot que brinde al usuario sugerencias sobre musica en base a sus gustos y prefencias. Implementare esta solución usando el paradigma de programación logico y prolog.  Mi solución pertenece al paradigma logico debido a que se basa en hechos, reglas y consultas, declara un conocimiento (los datos de las canciones) y usa reglas logicas para inferir respuestas. Se esta implementando también backtracking debido a que este lenguaje lo usa internamente al no usar while o for.  Finalmente se esta implementando la recursion ya que si una combinación cuenta con varias coincidencias el programa es capaz de imprimir como resultado todas las sugerencias.

## Modelo
<img src="/modelo.png" alt="Paradigma de programación" width="400" height="500">  

Esta imagen muestra un diagrama de flujo que muestra el funcionamiento de mi programa en el lenguaje prolog. Mi solución implementa el paradigma de programación logico debido a que:

- Incluye una base de conocimiento (reglas): cancion(Titulo, Genero, EstadoDeAnimo, Idioma, Decada, Autor).

- Utiliza la unificación: solo existe una declaración de relaciones y en base a eso, trata de unificar recomendar con cancion. 

- Valido que entradas si son logicas: member valida que la entrada si sea valida. 

- Prolog es un lenguaje naturalmente logico


## Implementacion 

- Primero estableci la base del conocimiento, que incluye los datos (que se usaran para encontrar un match) de las canciones.
  ```
  cancion('A Thousand Years', romantica, calmado, ingles, 10, 'Christina Perri').
  ````

- Establece una regla que trata de relacionar los gustos del usuario con una canción existente en la base de conocimiento
  ```
  recomendar(GustoGenero, GustoEstado, GustoIdioma, GustoDecada, Cancion, Autor) :-
  cancion(Cancion, GustoGenero, GustoEstado, GustoIdioma, GustoDecada, Autor).
   ````

- Se verifica que el dato ingresado para cada una de las categorias sea valido
  ```
  generoValido(G) :-
  member(G, [rock, pop, romantica, clasica, reggaeton]).
  ```

- Manda llamar las funciones de validar cada uno de los datos y después llama la función de recomendar para encontrar canciones

  ```
  sugerencia(G, E, I, D, Cancion, Autor) :-
  generoValido(G),
  estadoValido(E),
  idiomaValido(I),
  decadaValido(D),
  recomendar(G, E, I, D, Cancion, Autor).
  ```
En cuanto al chatbot: 

- Imprime la pregunta, recibe la repuesta manda y llamar la función que verifica que el dato sea valido. Si el dato es valido continua el programa, si es invalida muestra mensaje de error y finaliza 
  ```
  write('Qué género prefieres? (rock, pop, romantica, clasica, reggaeton)'), nl,
    read(Genero),
    (generoValido(Genero) ->
        true ;
        write('El genero no es valido, por favor intentelo de nuevo.'), nl, fail),
  ```
- Funcion busca si hay mas de una coincidencia y las guarda en una variable lista. Se verifica que esta variable no este vacia, de ser asi manda mensaje de que no se encontraron coincidencias y de lo comprario manda a llamar la función de imprimir_lista. 
  ```
  findall((Cancion, Autor), sugerencia(Genero, Estado, Idioma, Decada, Cancion, Autor), Lista),
    (
        Lista \= [] ->
            write('Canciones recomendadas:'), nl,
            imprimir_lista(Lista)
        ;
            write('No se encontraron canciones que coincidan con tus preferencias.'), nl
    ).
  ```
- Esta función imprime la lista de canciones recomendadas, usa recursion para a recorrer e imprimir cada elemento de la lista. 
  ```
  imprimir_lista([]).
  imprimir_lista([(Cancion, Autor)|T]) :-
    write('- '), write(Cancion), write(' (Autor: '), write(Autor), write(')'), nl,
    imprimir_lista(T).
  ```
## Pruebas 

Para probar mi programa abre el descarga el documento swish.pl, escribir en la consola **chatbot.** y deberas ingresar la siguiente información conforme al orden de las preguntas. Asegurese de escribir de manera correcta si no marcara error y finalizara el programa.  Si no se encuentran resultados se envia mensaje indicandolo. 

**Correctas**
* romantico, calmado, ingles, 10 -> A Thousand Years (Autor: Christina Perri), Perfect (Autor: Ed Sheeran)
* clasica, calmado, instrumental, 00 -> River Flows in You (Autor: Yiruma)
* pop, energico, ingles, 20 -> Blinding Lights (Autor: The Weeknd),  Dance Monkey (Autor: Tones and I), Don’t Start Now (Autor: Dua Lipa)
* reggaeton, alegre, ingles, 00 -> Hips dont lie(Autor: Shakira)
* rock, nostalgico, ingles, 70 -> Hotel California (Autor: Eagles), Stairway to Heaven (Autor: Led Zeppelin)

**Incorrectas**
* salsa -> El genero no es valido, por favor intentelo de nuevo.
* clasica, rebelde, ingles, 70 ->No se encontraron canciones que coincidan con tus preferencias.
* pop, calmado, español -> El idioma no es valido por favor intentelo de nuevo .
* rock, triste -> El estado de animo no es valido, por favor intentelo de nuevo
* romantico, calmado, ingles, 2000 -> La decada no es valida, por favor intentelo de nuevo.
## Analisis 

**Complejidad**

La complejidad de tiempo para mi programa es de O(N) ya que se itera sobre todas las opciones (los datos de canciones disponibles) para encontrar coincidencias, esto significa que en el peor de los casos se deben recorer todas las opciones disponibles por lo que que la complejidad seria O(N) (N siendo el numero de canciones existentes). Como actualmente cuento con pocas canciones etso no representa un problema, pero si quisiera escalarlo a mayor cantidad esta complejidad seria una limitante, ya que con un mayor numero de datos la complejidad aumentaria haciendo el programa ineficiente. Por otro lado la complejidad de espacio seria O(M) (M es las canciones que tubieron coincidencia), el espacio consumido es principalmente de la lista que guarda los resultados. 

**Limitantes**

La principal limitante que encuentro actualmenet a mi programa es que no cuento con una base de conocimiento extensa por lo que al ingresar conbinaciones de datos que si son validas no se genera una coincidencia. Aunque mi solución es efectiva concidero que a a mayor escala tendria dificultades debido a la complejidad de tiempo que supone. 

**Soluciones con otros paradigmas**

Si quisiera incluir una base de datos mas grande (millones de canciones) implementar los paradigmas de programación concurrente seria una buena opcion ya que permitiria dividir la carga de trabajo en múltiples hilos, reduciendo el tiempo de respuesta.  El paradigam de programación concurrente es una forma de programación que utiliza múltiples hilos o procesos para realizar diferentes tareas al mismo tiempo. 

Considero que el multithreading podría ser una solución adecuada en caso de querer implementar el programa a mayor escala (base de datos más grande), ya que este permite que varios subprocesos coexistan y compartan elementos como memoria y contexto. Aunque técnicamente no se ejecutan todos los procesos simultáneamente (en un sistema single-core), el sistema operativo alterna entre ellos tan rápidamente que da la ilusión de paralelismo.

Como todos los hilos acceden a la misma base de datos, sería necesario implementar mecanismos de sincronización como mutex (exclusión mutua) para garantizar la consistencia de los datos. De esta manera, solo un hilo podría modificar o leer ciertas secciones críticas de la memoria en un momento dado, previniendo conflictos. (Aunque no estoy tan segura si es necesario el mutex ya que no se supone los threads modifiquen ningun dato solo los leen)

<img src="/modelo2 .png" alt="Paradigma de programación" width="600" height="500"> 

<img src="/brenchmark.png" alt="Paradigma de programación" width="400" height="500"> 

## Referencias 
- GeeksforGeeks. (2018, October 12). Introduction of Programming Paradigms. GeeksforGeeks. https://www-geeksforgeeks-org.translate.goog/introduction-of-programming-paradigms/?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=tc
- [2] GeeksforGeeks. (2018a, May 26). Prolog | An Introduction - GeeksforGeeks. GeeksforGeeks. https://www.geeksforgeeks.org/prolog-an-introduction/
- Staff, C. (2024). Logic Programming: What It Is and How to Use It. Coursera. https://www.coursera.org/articles/logic-programming-language
- Goel, A. (2024, December 28). Multithreading in Operating System. GeeksforGeeks. https://www.geeksforgeeks.org/multithreading-in-operating-system/
- Sheldon, R. (2023, May). What is mutex (mutual exclusion object)? - Definition from WhatIs.com. SearchNetworking. https://www.techtarget.com/searchnetworking/definition/mutex
