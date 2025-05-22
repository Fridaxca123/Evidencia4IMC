# Evidencia 4: Demostración de un paradigma de programación 
**Frida Xcaret Vargas Trejo - A01707168**

## Paradigmas
Un paradigma también puede definirse como un método para resolver un problema o realizar una tarea. En particular, un paradigma de programación es un enfoque o estilo que guía la forma en que se estructura y desarrolla el código en un lenguaje de programación especifico.

Para el objetivo del proyecto, en esta ocasión estaré implementando el paradigma de programación logica.
La programación lógica se basa en declarar una base de conocimientos, hechos y reglas que ya se conocen y que describen una parte del mundo real. Junto con esta base, se formula una consulta o pregunta y el sistema lógico se encarga de inferir respuestas válidas basadas en la logica formal.

En la programación logica se describe el problema y el sistema busca automaticamente las soluciones posibles, usando técnicas como unificacion y resolución logica. Prolog es un lenguaje declarativo, lo que implica que en lugar de calcular cómo encontrar una solución, un programa se compone de datos basados ​​en hechos y reglas. Ademas emplea backtracking y unificación para encontrar soluciones a problemas a partir de la base de conocimiento.

## Descripción 
Implementare un chatbot que brinde al usuario sugerencias sobre musica en base a sus gustos y prefencias. Implementare esta solución usando el paradigma de programación logico y prolog, ademas hare uso de backtracking (para encontrar la canción adecuada).  

## Modelo

## Implementacion 
- Primero estableci la base del conocimiento (aquella información que ya conocemos)
''' % canción(Titulo, Genero, EstadoDeAnimo, Idioma, Decada).
cancion('A Thousand Years', romantica, romantico, ingles, 10).'''

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

## Referencias 
- GeeksforGeeks. (2018, October 12). Introduction of Programming Paradigms. GeeksforGeeks. https://www-geeksforgeeks-org.translate.goog/introduction-of-programming-paradigms/?_x_tr_sl=en&_x_tr_tl=es&_x_tr_hl=es&_x_tr_pto=tc
