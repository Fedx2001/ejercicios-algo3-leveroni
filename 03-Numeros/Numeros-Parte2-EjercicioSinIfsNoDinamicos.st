!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:58'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 22:06:52'!
* aMultiplier 
	
	^aMultiplier multiplyToEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 22:03:34'!
+ anAdder

	^anAdder addToEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 22:06:57'!
- aSubtrahend 
	
	^aSubtrahend substractToEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 22:07:02'!
/ aDivisor 
	
	^aDivisor divideToEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'OO 10/1/2022 16:10:57'!
fibonacci
	^self subclassResponsibility.
		! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JS 5/5/2022 03:55:37'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'OO 10/1/2022 16:34:04'!
// aDivisor 
	
	^Entero with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'OO 10/1/2022 16:26:34'!
greatestCommonDivisorWith: anEntero 
	
	^Entero with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'arithmetic operations - dd' stamp: 'OO 10/1/2022 16:35:01'!
addToEntero: anEntero
	
	^Entero with: value + anEntero integerValue.
	! !

!Entero methodsFor: 'arithmetic operations - dd' stamp: 'FG 9/30/2022 22:05:37'!
addToFraccion: aFraccion

	^Fraccion with: ((self * aFraccion denominator) + aFraccion numerator) over: (aFraccion denominator).
	! !

!Entero methodsFor: 'arithmetic operations - dd' stamp: 'FG 9/30/2022 22:05:49'!
divideToEntero: anEntero
	
	^Fraccion with: anEntero over: self.! !

!Entero methodsFor: 'arithmetic operations - dd' stamp: 'FG 9/30/2022 22:05:55'!
divideToFraccion: aFraccion
	
	^Fraccion with: (aFraccion numerator) over: (self * aFraccion denominator).! !

!Entero methodsFor: 'arithmetic operations - dd' stamp: 'OO 10/1/2022 16:35:13'!
multiplyToEntero: anEntero
	
	^Entero with: anEntero integerValue * self integerValue.! !

!Entero methodsFor: 'arithmetic operations - dd' stamp: 'FG 9/30/2022 22:06:05'!
multiplyToFraccion: aFraccion
	
	^(self * aFraccion numerator) / (aFraccion denominator).! !

!Entero methodsFor: 'arithmetic operations - dd' stamp: 'OO 10/1/2022 16:35:27'!
substractToEntero: anEntero
	
	^Entero with: anEntero integerValue - self integerValue.! !

!Entero methodsFor: 'arithmetic operations - dd' stamp: 'FG 9/30/2022 22:06:16'!
substractToFraccion: aFraccion
	
	^Fraccion with: (aFraccion numerator - (self * aFraccion denominator)) over: (aFraccion denominator).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'OO 10/1/2022 20:17:42'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^(self subclasses detect: [:subclass | subclass represents: aValue]) with: aValue.! !


!classDefinition: #EnteroNegativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroNegativo methodsFor: 'arithmetic operations' stamp: 'OO 10/1/2022 15:26:17'!
fibonacci
	^self error: Entero negativeFibonacciErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroNegativo class' category: 'Numeros-Parte2-Ejercicio'!
EnteroNegativo class
	instanceVariableNames: ''!

!EnteroNegativo class methodsFor: 'instance creation' stamp: 'OO 10/1/2022 16:23:14'!
represents: aValue
	 ^aValue negative.! !

!EnteroNegativo class methodsFor: 'instance creation' stamp: 'OO 10/1/2022 19:55:22'!
with: aValue
	^EnteroNegativo new initializeWith: aValue.
	! !


!classDefinition: #EnteroPositivo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroPositivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroPositivo methodsFor: 'arithmetic operations' stamp: 'OO 10/1/2022 19:22:56'!
fibonacci
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroPositivo class' category: 'Numeros-Parte2-Ejercicio'!
EnteroPositivo class
	instanceVariableNames: ''!

!EnteroPositivo class methodsFor: 'instance creation' stamp: 'OO 10/1/2022 20:20:39'!
represents: aValue
	 ^aValue positive.! !

!EnteroPositivo class methodsFor: 'instance creation' stamp: 'OO 10/1/2022 19:59:27'!
with: aValue
	^(self subclasses detect: [:subclass | subclass represents: aValue]) new initializeWith: aValue.! !


!classDefinition: #EnteroPositivoCero category: 'Numeros-Parte2-Ejercicio'!
EnteroPositivo subclass: #EnteroPositivoCero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroPositivoCero methodsFor: 'arithmetic operations' stamp: 'OO 10/1/2022 19:24:07'!
fibonacci
	^Entero with: 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroPositivoCero class' category: 'Numeros-Parte2-Ejercicio'!
EnteroPositivoCero class
	instanceVariableNames: ''!

!EnteroPositivoCero class methodsFor: 'instance creation' stamp: 'OO 10/1/2022 19:57:20'!
represents: aValue
	 ^aValue = 0.! !


!classDefinition: #EnteroPositivoMayorAUno category: 'Numeros-Parte2-Ejercicio'!
EnteroPositivo subclass: #EnteroPositivoMayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroPositivoMayorAUno methodsFor: 'arithmetic operations' stamp: 'OO 10/1/2022 20:03:48'!
fibonacci
	|one two|
	one:= Entero with: 1.
	two:= Entero with: 2.
	^(self - one) fibonacci + (self - two) fibonacci.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroPositivoMayorAUno class' category: 'Numeros-Parte2-Ejercicio'!
EnteroPositivoMayorAUno class
	instanceVariableNames: ''!

!EnteroPositivoMayorAUno class methodsFor: 'instance creation' stamp: 'OO 10/1/2022 19:57:38'!
represents: aValue
	 ^aValue > 1.! !


!classDefinition: #EnteroPositivoUno category: 'Numeros-Parte2-Ejercicio'!
EnteroPositivo subclass: #EnteroPositivoUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroPositivoUno methodsFor: 'arithmetic operations' stamp: 'OO 10/1/2022 19:24:07'!
fibonacci
	^Entero with: 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroPositivoUno class' category: 'Numeros-Parte2-Ejercicio'!
EnteroPositivoUno class
	instanceVariableNames: ''!

!EnteroPositivoUno class methodsFor: 'instance creation' stamp: 'OO 10/1/2022 19:57:51'!
represents: aValue
	 ^aValue = 1.! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 22:06:37'!
* aMultiplier 
	
	^aMultiplier multiplyToFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 22:03:43'!
+ anAdder 
	
	^anAdder addToFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 19:12:31'!
- aSubtrahend 
	
	^aSubtrahend substractToFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 22:06:43'!
/ aDivisor 
	
	^aDivisor divideToFraccion: self.! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'arithmetic operations - dd' stamp: 'FG 9/30/2022 22:05:16'!
addToEntero: anEntero

	^Fraccion with: ((anEntero * self denominator) + self numerator) over: (self denominator).! !

!Fraccion methodsFor: 'arithmetic operations - dd' stamp: 'FG 9/30/2022 22:05:11'!
addToFraccion: aFraccion

	^Fraccion with: ((aFraccion numerator * self denominator) + (aFraccion denominator * self numerator)) 
			 over: (aFraccion denominator * self denominator).! !

!Fraccion methodsFor: 'arithmetic operations - dd' stamp: 'FG 9/30/2022 22:03:59'!
divideToEntero: anEntero
	
	^Fraccion with: (anEntero * self denominator) over: self numerator.! !

!Fraccion methodsFor: 'arithmetic operations - dd' stamp: 'FG 9/30/2022 22:04:08'!
divideToFraccion: aFraccion
	
	^(aFraccion numerator * self denominator) / (aFraccion denominator * self numerator).! !

!Fraccion methodsFor: 'arithmetic operations - dd' stamp: 'FG 9/30/2022 22:04:58'!
multiplyToEntero: aEntero
	
	^Fraccion with: (aEntero * self numerator) over: (self denominator)! !

!Fraccion methodsFor: 'arithmetic operations - dd' stamp: 'FG 9/30/2022 22:04:38'!
multiplyToFraccion: aFraccion
	
	^(self numerator * aFraccion numerator) / (self denominator * aFraccion denominator).! !

!Fraccion methodsFor: 'arithmetic operations - dd' stamp: 'FG 9/30/2022 22:04:44'!
substractToEntero: anEntero
	
	^Fraccion with: (anEntero * self denominator - self numerator) over: (self denominator).! !

!Fraccion methodsFor: 'arithmetic operations - dd' stamp: 'FG 9/30/2022 22:04:49'!
substractToFraccion: aFraccion
	
	^Fraccion with: ((aFraccion numerator * self denominator) - (self numerator * aFraccion denominator)) 
			 over: (self denominator * aFraccion denominator).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'OO 10/2/2022 10:45:53'!
crearFraccionCon: aDividend y: aDivisor
	self subclassResponsibility.
! !

!Fraccion class methodsFor: 'intance creation' stamp: 'OO 10/2/2022 10:54:21'!
representsTheFraccion: aDividend over: aDivisor
	self subclassResponsibility.! !

!Fraccion class methodsFor: 'intance creation' stamp: 'OO 10/2/2022 12:13:19'!
with: aDividend over: aDivisor

		^(self allSubclasses detect: [:subclass |subclass representsTheFraccion: aDividend over: aDivisor ]) 
						  crearFraccionCon: aDividend y: aDivisor.! !


!classDefinition: #FraccionInvalida category: 'Numeros-Parte2-Ejercicio'!
Fraccion subclass: #FraccionInvalida
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FraccionInvalida class' category: 'Numeros-Parte2-Ejercicio'!
FraccionInvalida class
	instanceVariableNames: ''!

!FraccionInvalida class methodsFor: 'as yet unclassified' stamp: 'OO 10/2/2022 11:54:18'!
crearFraccionCon: aDividend y: aDivisor
	self error: Entero canNotDivideByZeroErrorDescription.
! !

!FraccionInvalida class methodsFor: 'as yet unclassified' stamp: 'OO 10/2/2022 10:54:45'!
representsTheFraccion: aDividend over: aDivisor
	^aDivisor isZero.! !


!classDefinition: #FraccionValida category: 'Numeros-Parte2-Ejercicio'!
Fraccion subclass: #FraccionValida
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FraccionValida class' category: 'Numeros-Parte2-Ejercicio'!
FraccionValida class
	instanceVariableNames: ''!

!FraccionValida class methodsFor: 'as yet unclassified' stamp: 'OO 10/2/2022 12:13:51'!
crearFraccionCon: aDividend y: aDivisor
	self subclassResponsibility.! !

!FraccionValida class methodsFor: 'as yet unclassified' stamp: 'OO 10/2/2022 12:14:08'!
representsTheFraccion: aDividend over: aDivisor
	^false.! !


!classDefinition: #FraccionCero category: 'Numeros-Parte2-Ejercicio'!
FraccionValida subclass: #FraccionCero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FraccionCero class' category: 'Numeros-Parte2-Ejercicio'!
FraccionCero class
	instanceVariableNames: ''!

!FraccionCero class methodsFor: 'as yet unclassified' stamp: 'OO 10/2/2022 11:09:42'!
crearFraccionCon: aDividend y: aDivisor
	^aDividend.! !

!FraccionCero class methodsFor: 'as yet unclassified' stamp: 'OO 10/2/2022 11:58:57'!
representsTheFraccion: aDividend over: aDivisor
	^aDividend isZero.! !


!classDefinition: #FraccionDenominadorNegativo category: 'Numeros-Parte2-Ejercicio'!
FraccionValida subclass: #FraccionDenominadorNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FraccionDenominadorNegativo class' category: 'Numeros-Parte2-Ejercicio'!
FraccionDenominadorNegativo class
	instanceVariableNames: ''!

!FraccionDenominadorNegativo class methodsFor: 'as yet unclassified' stamp: 'OO 10/2/2022 11:10:48'!
crearFraccionCon: aDividend y: aDivisor
	^aDividend negated / aDivisor negated.! !

!FraccionDenominadorNegativo class methodsFor: 'as yet unclassified' stamp: 'OO 10/2/2022 11:59:31'!
representsTheFraccion: aDividend over: aDivisor
	^aDivisor isNegative.! !


!classDefinition: #FraccionNumeradorPositivoONegativo category: 'Numeros-Parte2-Ejercicio'!
FraccionValida subclass: #FraccionNumeradorPositivoONegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FraccionNumeradorPositivoONegativo class' category: 'Numeros-Parte2-Ejercicio'!
FraccionNumeradorPositivoONegativo class
	instanceVariableNames: ''!

!FraccionNumeradorPositivoONegativo class methodsFor: 'as yet unclassified' stamp: 'OO 10/2/2022 12:39:17'!
crearFraccionCon: aDividend y: aDivisor
	self subclassResponsibility.! !

!FraccionNumeradorPositivoONegativo class methodsFor: 'as yet unclassified' stamp: 'OO 10/2/2022 12:39:10'!
representsTheFraccion: aDividend over: aDivisor
	^false.! !

!FraccionNumeradorPositivoONegativo class methodsFor: 'as yet unclassified' stamp: 'OO 10/2/2022 13:01:46'!
simplifiedFraccionDenominatorof: aDividend over: aDivisor

	|denominator|
	denominator := aDivisor // (aDividend greatestCommonDivisorWith: aDivisor).
	
	^denominator! !

!FraccionNumeradorPositivoONegativo class methodsFor: 'as yet unclassified' stamp: 'OO 10/2/2022 13:04:36'!
simplifiedFraccionNumeratorof: aDividend over: aDivisor

	| numerator |
	numerator := aDividend // (aDividend greatestCommonDivisorWith: aDivisor).
	
	^numerator! !


!classDefinition: #FraccionDenominadorDiferenteDeUno category: 'Numeros-Parte2-Ejercicio'!
FraccionNumeradorPositivoONegativo subclass: #FraccionDenominadorDiferenteDeUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FraccionDenominadorDiferenteDeUno class' category: 'Numeros-Parte2-Ejercicio'!
FraccionDenominadorDiferenteDeUno class
	instanceVariableNames: ''!

!FraccionDenominadorDiferenteDeUno class methodsFor: 'as yet unclassified' stamp: 'OO 10/2/2022 13:05:56'!
crearFraccionCon: aDividend y: aDivisor
	^self new initializeWith: (self simplifiedFraccionNumeratorof: aDividend over:aDivisor )
			  over: (self simplifiedFraccionDenominatorof: aDividend over: aDivisor )! !

!FraccionDenominadorDiferenteDeUno class methodsFor: 'as yet unclassified' stamp: 'OO 10/2/2022 13:03:13'!
representsTheFraccion: aDividend over: aDivisor
	^(self simplifiedFraccionDenominatorof: aDividend  over: aDivisor) isOne not.! !


!classDefinition: #FraccionDenominadorUno category: 'Numeros-Parte2-Ejercicio'!
FraccionNumeradorPositivoONegativo subclass: #FraccionDenominadorUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FraccionDenominadorUno class' category: 'Numeros-Parte2-Ejercicio'!
FraccionDenominadorUno class
	instanceVariableNames: ''!

!FraccionDenominadorUno class methodsFor: 'as yet unclassified' stamp: 'OO 10/2/2022 13:04:59'!
crearFraccionCon: aDividend y: aDivisor
	^self simplifiedFraccionNumeratorof: aDividend over: aDivisor! !

!FraccionDenominadorUno class methodsFor: 'as yet unclassified' stamp: 'OO 10/2/2022 13:03:37'!
representsTheFraccion: aDividend over: aDivisor
	^(self simplifiedFraccionDenominatorof: aDividend  over: aDivisor) isOne! !
