# Evidencia 4: Demostración de un paradigma de programación 
**Frida Xcaret Vargas Trejo - A01707168**

## Paradigmas
Un paradigma también puede definirse como un método para resolver un problema o realizar una tarea. En particular, un paradigma de programación es un enfoque o estilo que guía la forma en que se estructura y desarrolla el código en un lenguaje de programación especifico.

Para el objetivo del proyecto, en esta ocasión estaré implementando el paradigma de programación logica.
La programación lógica se basa en declarar una base de conocimientos, hechos y reglas que ya se conocen y que describen una parte del mundo real. Junto con esta base, se formula una consulta o pregunta y el sistema lógico se encarga de inferir respuestas válidas basadas en la logica formal.

En la programación logica se describe el problema y el sistema busca automaticamente las soluciones posibles, usando técnicas como unificacion y resolución logica. Prolog es un lenguaje declarativo, lo que implica que en lugar de calcular cómo encontrar una solución, un programa se compone de datos basados ​​en hechos y reglas. Ademas emplea backtracking y unificación para encontrar soluciones a problemas a partir de la base de conocimiento.

## Descripción 
Implementare un chatbot que brinde al usuario sugerencias sobre musica en base a sus gustos y prefencias. Implementare esta solución usando el paradigma de programación logico y prolog, ademas hare uso de backtracking.  Mi solución pertenece al paradigma logico debido a que se basa en hechos, reglas y consultas, declara un conocimiento (los datos de las canciones) y usa reglas logicas para inferir respuestas. Se esta implementando el backtracking ya que si una combinación cuenta con varias coincidencias el programa encuentra la primera y regresa para intentar encontrar una solución diferente, esto continua hasta que ya no encuentre coincidencias. ≈

## Modelo

## Implementacion 
- Primero estableci la base del conocimiento, que incluye los datos (que se usaran para encontrar un match) de las canciones. 
```cancion('A Thousand Years', romantica, calmado, ingles, 10, 'Christina Perri').```

- Establece una regla que trata de relacionar los gustos del usuario con una canción existente en la base de conocimiento
  ```recomendar(GustoGenero, GustoEstado, GustoIdioma, GustoDecada, Cancion, Autor) :-
    cancion(Cancion, GustoGenero, GustoEstado, GustoIdioma, GustoDecada, Autor).```

- Se veridica que el dato ingresado para cada una de las categorias sea valido
  ```generoValido(G) :-
 member(G, [rock, pop, romantica, clasica, reggaeton]).```

- Manda llamar las funciones de validar cada uno de los datos y después llama la función de recomendar para ebncontrar canciones
  ```sugerencia(G, E, I, D, Cancion, Autor) :-
    generoValido(G),
    estadoValido(E),
    idiomaValido(I),
    decadaValido(D),
    recomendar(G, E, I, D, Cancion, Autor).```


## Pruebas 
Para probar mi programa abre el descarga el documento swish.pl y deberas ingresar la siguiente información conforme al orden de las preguntas. Asegurese de escribir de manera correcta si no marcara error y finalizara el programa.  Si no se encuentran resultados se envia mensaje indicandolo. 

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

La complejidad de tiempo para mi programa es de O(N) ya que se itera sobre todas las opciones (los datos de canciones disponibles) para encontrar coincidencias, esto significa que en el peor de los casos se deben recorer todas las opciones disponibles por lo que que la complejidad seria O(N) (N siendo el numero de canciones existentes). Como actualmente cuento con pocas canciones etso no representa un problema, pero si quisiera escalarlo a mayor cantidad esta complejidad seria una limitante, ya que con un mayor numero de datos la complejidad aumentaria haciendo el programa ineficiente. Por otro lado la complejidad de espacio seria O(M) (M es las canciones que tubieron coincidencia), el espacio consumido es principalmente[almente de la lista que guarda los resultados. 

**Limitantes**

La principal limitante que encuentro actualmenet a mi programa es que no cuento con una base de conocimiento extensa por lo que al ingresar conbinaciones de datos que si son validas no se genera una coincidencia. Aunque mi solución es efectiva concidero que a a mayor escala tendria dificultades debido a la complejidad de tiempo que supone. 

**Soluciones con otros paradigmas**


## Referencias 
- GeeksforGeeks. (2018, October 12). Introduction of Programming Paradigms. GeeksforGeeks. https://www-geeksforgeeks-org.translate.goog/introduction-of-programming-paradigms/?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=tc
