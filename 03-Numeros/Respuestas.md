# Preguntas teóricas

## Aporte de los mensajes de DD
En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

El primer llamado nos aporta informacion sobre el tipo del primero de los objetos y el segundo llamado sobre el tipo del objeto que es utilizado como parámetro, el cuál puede variar en tipo.

## Lógica de instanciado
Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

Nos parece mejor tener la lógica de cómo instanciar un objeto en ..., ya que ...
Si ese objeto se crea desde diferentes lugares y de diferentes formas ... esto lo resolvemos ...

## Nombres de las categorías de métodos
Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

Estamos basándonos en el qué de los métodos, es decir, en lo que hacen, y además en si estos deben ser públicos o privados, o sea, si deben utilizarse solo internamente y en colaboraciones con objetos del mismo tipo o si podrán ser enviados por otros objetos de distinto tipo.

## Subclass Responsibility
Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

Ponemos ese mensaje solo con "self subclassResponsibility" ya que no por responder el mismo mensaje significa que lo respondan de la misma manera, es decir, cada subclase define cómo responde a ese método, y debido a que estamos organizando el conocimiento del dominio con el que estamos trabajando, estas clases representaran ideas distintas, que parten de un mismo concepto, pero no se comportan igual.

## No rompas
¿Por qué está mal/qué problemas trae romper encapsulamiento?

Esta mal porque al romper encapsulamiento estamos creando un acoplamiento muy fuerte entre objetos, y además estamos haciendo que un objeto conozca como funciona internamente otro, ya que colabora directamente con los colaboradores internos del mismo. Uno de los grandes problemas de esto, ademas de que estamos haciendo que un objeto "sepa" cómo funciona otra y creando un acoplamiento fuerte, es que de este modo otros objetos podrían cambiar cómo funciona un objeto, si cambian algún colaborador interno rompiendo encapsulamiento.