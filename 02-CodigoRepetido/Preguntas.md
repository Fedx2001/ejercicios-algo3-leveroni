# Preguntas y Respuestas

## Abstracción de los tests 01 y 02 

En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo 
nuevo. Eso es algo que estaba en la realidad y no estaba representado en 
nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de 
la realidad que crearon?

La entidad que creamos es un medidor de tiempo, o sea, un cronometro con precision de milisegundos.

## Cómo representar en Smalltalk

¿Cuáles son las formas en que podemos representar entes de la realidad en 
Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo 
usar para representar entidades de la realidad?

Creando clases, que representan conceptos que existen en la realidad, como 
los numeros enteros; e instanciandolas para generar objetos, que 
representan una entidad concreta de la realidad, por ejemplo el numero 
'2'.

## Teoría de Naur

¿Qué relación hay entre sacar código repetido (creando abstracciones) y la 
teoría del modelo/sistema (del paper de Naur)?

Al abstraer codigo, lo que hacemos es mejorar el modelo de la realidad que 
tiene el programa, representando así mejor los hechos concretos. De esta 
forma, se genera una mejor representacion de la teoria que tenemos en 
nuestra mente, y de la realidad como nosotros la percibimos.