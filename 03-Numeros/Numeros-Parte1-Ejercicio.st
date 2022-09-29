!classDefinition: #NumeroTest category: 'Numeros-Parte1-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'OO 9/27/2022 21:14:21'!
test01isZeroReturnsTrueWhenAskToZero
	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 15:15:53'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:09:55'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:04'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:00:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:00:32'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'OO 9/28/2022 21:18:48'!
test07FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |
	sevenTenths := Numero with: (Numero with: 7) over: (Numero with: 10).
	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'OO 9/28/2022 21:18:26'!
test08FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es: 
	(a/b) * (c/d) = (a.c) / (b.d)
"
	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'OO 9/28/2022 21:18:00'!
test09AparentFraccionesAreEqual
	self assert: oneHalf equals: (Numero with: two over: four)! !

!NumeroTest methodsFor: 'tests' stamp: 'OO 9/28/2022 21:17:56'!
test10AddingFraccionesCanReturnAnEntero
	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'OO 9/28/2022 21:17:51'!
test11MultiplyingFraccionesCanReturnAnEntero
	self assert: one equals: (twoFifth) * (fiveHalfs) ! !

!NumeroTest methodsFor: 'tests' stamp: 'OO 9/28/2022 20:12:10'!
test12AFraccionCanNotBeZero
	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'OO 9/28/2022 21:17:45'!
test13AFraccionCanNotBeOne
	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'OO 9/28/2022 21:17:39'!
test14NegationOfEnteroIsCorrect
	self assert: negativeTwo equals: two negated! !

!NumeroTest methodsFor: 'tests' stamp: 'OO 9/28/2022 21:17:34'!
test15NegationOfFraccionIsCorrect
	self assert: (Numero with: negativeOne over: two) equals: oneHalf negated! !

!NumeroTest methodsFor: 'tests' stamp: 'OO 9/28/2022 21:17:30'!
test16SignIsCorrectlyAssignedToFractionWithTwoNegatives
	self assert: oneHalf equals: (Numero with: negativeOne over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'OO 9/28/2022 21:17:22'!
test17SignIsCorrectlyAssignedToFractionWithNegativeDivisor
	self assert: oneHalf negated equals: (Numero with: one over: negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'OO 9/28/2022 20:13:02'!
setUp
	zero := Numero with: 0.
	one := Numero with: 1.
	two := Numero with: 2.
	three:= Numero with: 3.
	four := Numero with: 4.
	five := Numero with: 5.
	eight := Numero with: 8.
	negativeOne := Numero with: -1.
	negativeTwo := Numero with: -2.
	
	oneHalf := Numero with: one over: two.
	oneFifth := Numero with: one over: five.
	twoFifth := Numero with: two over: five.
	twoTwentyfifth := Numero with: two over: (Numero with: 25).
	fiveHalfs := Numero with: five over: two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte1-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: 'type value numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'OO 9/28/2022 21:15:06'!
* aMultiplier 
	self subclassResponsibility.
	
	
	! !

!Numero methodsFor: 'arithmetic operations' stamp: 'OO 9/28/2022 21:14:11'!
+ anAdder 
	self subclassResponsibility.
	! !

!Numero methodsFor: 'arithmetic operations' stamp: 'OO 9/27/2022 21:31:24'!
negated
	self subclassResponsibility.! !


!Numero methodsFor: 'testing' stamp: 'OO 9/27/2022 21:10:34'!
isNegative
	self subclassResponsibility.
		
		
	! !

!Numero methodsFor: 'testing' stamp: 'OO 9/27/2022 21:26:08'!
isOne
	self subclassResponsibility.! !

!Numero methodsFor: 'testing' stamp: 'OO 9/27/2022 21:28:27'!
isZero
	self subclassResponsibility.! !


!Numero methodsFor: 'initialization' stamp: 'OO 9/28/2022 20:08:11'!
initializeWith: aValue
	
	type := #Entero.
	value := aValue! !

!Numero methodsFor: 'initialization' stamp: 'OO 9/28/2022 20:08:48'!
initializeWith: aNumerator over: aDenominator
	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	type := #Fraccion.
	numerator := aNumerator.
	denominator := aDenominator ! !


!Numero methodsFor: 'accessing' stamp: 'OO 9/28/2022 20:36:51'!
denominator
	^denominator! !

!Numero methodsFor: 'accessing' stamp: 'OO 9/28/2022 20:37:06'!
integerValue
	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	^value! !

!Numero methodsFor: 'accessing' stamp: 'OO 9/28/2022 20:37:10'!
numerator
	^numerator! !

!Numero methodsFor: 'accessing' stamp: 'OO 9/28/2022 20:37:14'!
type
	^type! !


!Numero methodsFor: 'printing' stamp: 'OO 9/28/2022 20:43:30'!
printOn: aStream
	self subclassResponsibility.! !


!Numero methodsFor: 'comparing' stamp: 'OO 9/28/2022 20:44:36'!
= anObject
	^(anObject isKindOf: self class) and: [ type = anObject type and: 
		[ type = #Entero ifTrue: [ value = anObject integerValue] 
		ifFalse: [ type = #Fraccion ifTrue:
			[ (numerator * anObject denominator) = (denominator * anObject numerator) ]]]]! !

!Numero methodsFor: 'comparing' stamp: 'OO 9/28/2022 20:50:32'!
hash
	^self subclassResponsibility.! !


!Numero methodsFor: 'arithmetic operations - private' stamp: 'OO 9/28/2022 20:34:18'!
// aDivisor 
		self subclassResponsibility.
	! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'OO 9/28/2022 20:53:45'!
greatestCommonDivisorWith: anEntero 
	^self subclassResponsibility.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte1-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'OO 9/27/2022 21:42:09'!
canNotDivideByZeroErrorDescription
	^'No se puede dividir por cero'! !


!Numero class methodsFor: 'instance creation' stamp: 'OO 9/27/2022 21:35:46'!
with: aValue 
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	^Entero new initializeWith: aValue! !

!Numero class methodsFor: 'instance creation' stamp: 'OO 9/28/2022 20:24:46'!
with: aDividend over: aDivisor
	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].	
	aDivisor isNegative ifTrue: [ ^self with: aDividend negated over: aDivisor negated].
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	denominator isOne ifTrue: [ ^numerator ].
	^Fraccion new initializeWith: numerator over: denominator! !


!classDefinition: #Entero category: 'Numeros-Parte1-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Entero methodsFor: 'as yet unclassified' stamp: 'OO 9/28/2022 21:07:33'!
* aMultiplier
	(aMultiplier isKindOf: Entero) ifTrue:	
		[ ^self class with: value * aMultiplier integerValue ].
		
		self error: 'Tipo de número no soportado'.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'OO 9/28/2022 21:14:44'!
+ anAdder
		(anAdder isKindOf: Entero) ifTrue:
		[ ^self class with: value + anAdder integerValue ].! !

!Entero methodsFor: 'as yet unclassified' stamp: 'OO 9/28/2022 20:31:45'!
// aDivisor
	^self class with: value // aDivisor integerValue.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'OO 9/28/2022 20:53:12'!
greatestCommonDivisorWith: anEntero
	^self class with: (value gcd: anEntero integerValue).! !

!Entero methodsFor: 'as yet unclassified' stamp: 'OO 9/28/2022 20:49:58'!
hash
	 ^value hash ! !

!Entero methodsFor: 'as yet unclassified' stamp: 'OO 9/27/2022 21:11:32'!
isNegative
	^value < 0! !

!Entero methodsFor: 'as yet unclassified' stamp: 'OO 9/27/2022 21:24:52'!
isOne
	 ^value = 1 ! !

!Entero methodsFor: 'as yet unclassified' stamp: 'OO 9/27/2022 21:27:16'!
isZero
	^value = 0.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'OO 9/27/2022 21:32:54'!
negated
	^self * (self class with: -1)! !

!Entero methodsFor: 'as yet unclassified' stamp: 'OO 9/28/2022 20:42:55'!
printOn: aStream

	aStream print: value.! !


!classDefinition: #Fraccion category: 'Numeros-Parte1-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Fraccion methodsFor: 'as yet unclassified' stamp: 'OO 9/28/2022 21:07:33'!
* aMultiplier
	
		( aMultiplier isKindOf: Fraccion) ifTrue:
		[ ^self class with: (numerator * aMultiplier numerator) over: (denominator * aMultiplier denominator) ].
		
		self error: 'Tipo de número no soportado'.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'OO 9/28/2022 21:14:44'!
+ anAdder

	(anAdder isKindOf: Fraccion) ifTrue:
			[ | newNumerator newDenominator |
			newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
			newDenominator := denominator * anAdder denominator.
			^ self class with: newNumerator over: newDenominator ].
		
		self error: 'Tipo de número no soportado'! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'OO 9/28/2022 20:32:35'!
// aDivisor
	self error: 'Tipo de número no soportado'.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'OO 9/28/2022 20:53:12'!
greatestCommonDivisorWith: anEntero
	self error: 'Tipo de número no soportado'.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'OO 9/28/2022 20:49:59'!
hash
	^(numerator hash / denominator hash) hash.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'OO 9/27/2022 21:25:18'!
isNegative 
	
	^denominator< 0.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'OO 9/27/2022 21:25:51'!
isOne 
	 ^false.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'OO 9/27/2022 21:28:10'!
isZero
	^false.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'OO 9/27/2022 21:32:55'!
negated

	 ^self class with: numerator * (self class with: -1) over: denominator.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'OO 9/28/2022 20:42:55'!
printOn: aStream 
	 aStream 
			print: numerator;
			nextPut: $/;
			print: denominator ! !
