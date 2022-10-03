# Preguntas teóricas

## Aporte de los mensajes de DD
### En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

El primer llamado nos asegura cual, de todos los posibles, es el receptor de una variedad distinta de objetos que saben comunicarse con todos los primeros. Es decir que como en la operación a realizar hay dos objetos de tipo variable, con el primer envío aseguramos uno de ellos. Luego, con el segundo envío se proporciona la información del tipo de objeto que nos faltaba, ya que este es el que recibe el mensaje, y, como ya se conocen ambos tipos también se procesa la operación para la cual se usó DD.

Es decir, el primer llamado nos aporta informacion sobre el tipo del primero de los objetos (el que recibe el mensaje) y el segundo llamado nos proporciona información sobre el tipo del objeto que es utilizado como parámetro en el primer llamado, teniendo en cuenta que tanto el primer objeto como el segundo pueden variar de tipo.

## Lógica de instanciado
### Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

Nos parece mejor tener la lógica de cómo instanciar un objeto en un método de clase del mismo, ya que antes de crearlo quiero que esté definido correctamente según los criterios que se utilizan en dicha clase relacionada con el dominio de la realidad.
Si ese objeto se crea desde diferentes lugares y de diferentes formas siempre se termina utilizando un mensaje de clase, es decir, esto lo resolvemos con uno, dos, o más mensajes que determinan con que características se va a crear el objeto, siempre con métodos de clase.

## Nombres de las categorías de métodos
### Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

Estamos basándonos en el QUÉ de los métodos, es decir, en lo que hacen, y además en si estos deben ser públicos o privados, o sea, si deben utilizarse solo internamente y en colaboraciones con objetos del mismo tipo o si podrán ser enviados por otros objetos de distinto tipo.

## Subclass Responsibility
### Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

Ponemos ese mensaje solo con "self subclassResponsibility" ya que el hecho de que respondan el  mismo mensaje no significa que lo respondan de la misma manera, es decir, cada subclase define cómo responde a ese mensaje, y debido a que estamos organizando el conocimiento del dominio con el que estamos trabajando, estas clases representaran ideas distintas, que parten de un mismo concepto, pero no se comportan igual. Además al definir subclases, repartimos el dominio del concepto de lo que representa la superclase en conocimiento mas definido. Esto se debe a la necesidad de poder realizar una misma tarea de manera diferente. Entonces la superclase define un comportamiento (abstracto) el cual las sublcases deben tener definido (aunque pueda ser de diferente forma entre ellas). Por otro lado al querer definir mas precisamente nuestro modelo de la realidad estratificando en más subclases que consideremos necesarias puede ocurrir el error de olvidar definir un comportamiento que la superclase define como obligatorio, como responsabilidad de sus decendientes. Este error se aprecia fácilmente al debuggear ya que el llamado de este mensaje no estará especificado para una instancia de una subclase que presente este error en su definición.

## No rompas
### ¿Por qué está mal/qué problemas trae romper encapsulamiento?

Esta mal porque al romper encapsulamiento estamos creando un acoplamiento muy fuerte entre objetos, y además estamos haciendo que un objeto conozca como funciona internamente otro, ya que colabora directamente con los colaboradores internos del mismo. Uno de los grandes problemas de esto, ademas de que estamos haciendo que un objeto "sepa" cómo funciona otro y creando un acoplamiento fuerte, es que de este modo otros objetos podrían cambiar cómo funciona un objeto, si cambian algún colaborador interno.
