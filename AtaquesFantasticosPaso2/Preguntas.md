# Ataques Fantasticos! (Paso 2)

## Preguntas

1. ¿Qué crítica le harías al protocolo de #estaHerido y #noEstaHerido? (en vez de tener solo el mensaje #estaHerido y hacer “#estaHerido not” para saber la negación)

2. ¿Qué opinan de que para algunas funcionalidades tenemos 3 tests para el mismo comportamiento pero aplicando a cada uno de los combatientes (Arthas, Mankrik y Olgra)

3. ¿Cómo modelaron el resultado de haber desarrollado un combate? ¿qué opciones consideraron y por qué se quedaron con la que entregaron y por qué descartaron a las otras?

## Respuestas

1. Como crítica, que este protocolo resulta redundante aunque para nosotros mejora la claridad del codigo (un poco), ya que partiendo del dominio de la realidad, el combatiente deberia saber responder a la pregunta: "¿estás herido?"; y tambien a la pregunta: "¿estas bien?".

2. Que no es necesario porque todos los combatientes se comportan de la misma forma, y si definimos, por ejemplo, a Arthas como el prototipo, el resto de los combatientes tienen el mismo comportamiento por defecto. De igual manera, estos tests del mismo comportamiento son utiles en caso de que no conozcamos la implementacion desarrollada.

3. Desde un principio, entretuvimos la idea de que el resultado fuese un objeto suponiendo que tendría que saber responder la pregunta de "¿quién es el ganador?"
