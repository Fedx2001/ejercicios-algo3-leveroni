!classDefinition: #Top category: 'Stack-Exercise'!
Link subclass: #Top
	instanceVariableNames: 'element'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Top methodsFor: 'private' stamp: 'FG 10/11/2022 21:25:00'!
initializeWith: anElement andNextElement: nextElement
	element := anElement.
	self nextLink: nextElement.! !


!Top methodsFor: 'getter' stamp: 'FG 10/11/2022 20:48:40'!
element
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Top class' category: 'Stack-Exercise'!
Top class
	instanceVariableNames: ''!

!Top class methodsFor: 'instance creation' stamp: 'FG 10/11/2022 21:23:32'!
newWith: element andNextElement: nextElement
	^self new initializeWith: element andNextElement: nextElement.! !


!classDefinition: #Base category: 'Stack-Exercise'!
Top subclass: #Base
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Base methodsFor: 'getter' stamp: 'FG 10/11/2022 20:50:22'!
element
	self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #Element category: 'Stack-Exercise'!
Top subclass: #Element
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Element methodsFor: 'getter' stamp: 'FG 10/11/2022 20:49:22'!
element
	^element.! !


!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:26'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'finderConStackVacio stackConOraciones finderConStackConOracionesYPrefijoWinter finderConStackNoVacioYPrefijowin finderConStackNoVacioYPrefijoBoca finderConPrefijoGamConMinuscula finderConPrefijoGamConMayuscula sentences finderConStackNoVacioYPrefijoIs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FG 10/13/2022 20:42:13'!
test01CannotCreateSentenceFinderWithNilStackAsParameter

	self should: [SentenceFinderByPrefix withStack: nil andPrefix: 'Winter']
	      raise: Error
	      withExceptionDo: [:anError | self assertErrorDescriptionIsStackCannotBeNil: anError]
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FG 10/13/2022 20:42:29'!
test02CannotCreateSentenceFinderWithEmptyPrefix
	
	self should: [SentenceFinderByPrefix withStack: stackConOraciones andPrefix: '']
	      raise: Error
	      withExceptionDo: [:anError | self assertErrorDescriptionIsPrefisCannotBeEmpty: anError]! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FG 10/13/2022 20:37:18'!
test03CannotCreateSenteceFinderWithAPrefixWithSpaces

	self should: [SentenceFinderByPrefix withStack: stackConOraciones andPrefix: 'win  ter']
	      raise: Error
	      withExceptionDo: [:anError | self assertErrorDescriptionIsPrefixCannotHaveEmptySpaces: anError].
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FG 10/13/2022 20:37:18'!
test04CannotCreateSentenceFinderWithNilPrefix

	self should: [SentenceFinderByPrefix withStack: stackConOraciones andPrefix: nil]
	      raise: Error
	      withExceptionDo: [:anError | self assertErrorDescriptionIsPrefixCannotBeNil: anError].
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FG 10/13/2022 20:37:13'!
test05SentenceFinderWithEmptyStackAsParameterReturnsEmptyCollection
	
	self assert: (finderConStackVacio find isEmpty).

	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FG 10/13/2022 20:37:33'!
test06FindWithStackNotEmptyAndWinterPrefixReturnsOnlyOneMatch
	
	|resultsCollection|
	resultsCollection := finderConStackConOracionesYPrefijoWinter find.
	self assertThereIsOnlyOneElementAndItsWinterIsHereForTheCollection: resultsCollection.
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'OO 10/13/2022 17:35:54'!
test07FindWithStackNotEmptyAndwinPrefixReturnsThreeExpectedMatches
	
	|resultsCollection|
	resultsCollection := finderConStackNoVacioYPrefijowin find.
	self assertThereAreThreeElementsInTheExpectedOrderForTheCollection: resultsCollection.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'OO 10/13/2022 17:37:23'!
test08FindWithStackNotEmptyAndBocaPrefixReturnsNoMatches
	
	self assertFindingResultsWithBocaPrefixAreEmpty.

	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'OO 10/13/2022 17:39:17'!
test09FindIsCaseSensitive
	
	self assertFinderIsCaseSensitive.
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FG 10/13/2022 20:37:33'!
test10FindDoesNotChangeTheOrderOrSizeOfTheStack
	
	finderConStackConOracionesYPrefijoWinter find.
	self assertStackUsedInFinderRemainsSameSizeAndWithElementsInExpectedOrder.
	
	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'FG 10/13/2022 20:37:18'!
test11CannotCreateSentenceFinderWithASpaceAsPrefix
	
	self should: [SentenceFinderByPrefix withStack: stackConOraciones andPrefix: ' ']
	      raise: Error
	      withExceptionDo: [:anError | self assertErrorDescriptionIsPrefixCannotHaveEmptySpaces: anError].
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'OO 10/13/2022 14:48:23'!
test12FindWithMiddleOfSentenceWordReturnsEmptyCollection
	
	self assert: (finderConStackNoVacioYPrefijoIs find isEmpty).

	
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'FG 10/13/2022 20:37:33'!
setUp

	finderConStackVacio := SentenceFinderByPrefix withStack: OOStack new andPrefix: 'Winter'. 
	
	sentences := {'winter is coming'. 'winning is everything'. 'The winds of Winter'. 'Winter is here'. 'winter is cold'.	 'Game of Thrones'.	}.
	stackConOraciones := self createOOstackWithSentences: sentences.
	
	finderConStackConOracionesYPrefijoWinter := SentenceFinderByPrefix withStack: stackConOraciones andPrefix: 'Winter'.
	finderConStackNoVacioYPrefijowin := SentenceFinderByPrefix withStack: stackConOraciones andPrefix: 'win'.
	finderConStackNoVacioYPrefijoBoca := SentenceFinderByPrefix withStack: stackConOraciones andPrefix: 'Boca'.
	finderConStackNoVacioYPrefijoIs := SentenceFinderByPrefix withStack: stackConOraciones andPrefix: 'is'.
	finderConPrefijoGamConMinuscula := SentenceFinderByPrefix withStack: stackConOraciones andPrefix: 'gam'.
	finderConPrefijoGamConMayuscula := SentenceFinderByPrefix withStack: stackConOraciones andPrefix: 'Gam'.	
	! !


!SentenceFinderByPrefixTest methodsFor: 'auxiliar operations' stamp: 'OO 10/13/2022 17:09:30'!
createOOstackWithSentences: aCollectionOfSentences
	|tempStack|
	tempStack := OOStack new.
	sentences do: [:sentence | tempStack push: sentence].
	
	^tempStack.! !


!SentenceFinderByPrefixTest methodsFor: 'asserts' stamp: 'FG 10/13/2022 20:38:30'!
assertErrorDescriptionIsPrefisCannotBeEmpty: anError

	^ self assert: SentenceFinderByPrefix prefixCannotBeEmptyErrorDescription 
		 equals: anError messageText! !

!SentenceFinderByPrefixTest methodsFor: 'asserts' stamp: 'FG 10/13/2022 20:38:04'!
assertErrorDescriptionIsPrefixCannotBeNil: anError

	^ self assert: SentenceFinderByPrefix prefixMustBeAStringErrorDescription 
		 equals: anError messageText! !

!SentenceFinderByPrefixTest methodsFor: 'asserts' stamp: 'FG 10/13/2022 20:38:20'!
assertErrorDescriptionIsPrefixCannotHaveEmptySpaces: anError

	^ self assert: SentenceFinderByPrefix prefixCannotHaveEmptySpacesDescription 
		 equals: anError messageText! !

!SentenceFinderByPrefixTest methodsFor: 'asserts' stamp: 'FG 10/13/2022 20:38:48'!
assertErrorDescriptionIsStackCannotBeNil: anError

	^ self assert: SentenceFinderByPrefix stackMustBeAnOOStackErrorDescription 
		 equals: anError messageText! !

!SentenceFinderByPrefixTest methodsFor: 'asserts' stamp: 'OO 10/13/2022 17:39:17'!
assertFinderIsCaseSensitive

	self assert: finderConPrefijoGamConMinuscula find isEmpty.
	self deny: finderConPrefijoGamConMayuscula find isEmpty! !

!SentenceFinderByPrefixTest methodsFor: 'asserts' stamp: 'OO 10/13/2022 17:37:23'!
assertFindingResultsWithBocaPrefixAreEmpty

	^ self assert: finderConStackNoVacioYPrefijoBoca find isEmpty! !

!SentenceFinderByPrefixTest methodsFor: 'asserts' stamp: 'FG 10/13/2022 20:37:18'!
assertStackUsedInFinderRemainsSameSizeAndWithElementsInExpectedOrder

	self assert: sentences size equals: stackConOraciones size.
	sentences reversed do: [:sentence | self assert: sentence equals: stackConOraciones pop]! !

!SentenceFinderByPrefixTest methodsFor: 'asserts' stamp: 'OO 10/13/2022 17:35:35'!
assertThereAreThreeElementsInTheExpectedOrderForTheCollection: results

	self assert: results size = 3.
	self assert: (results at: 1 ) equals: 'winter is cold'.
	self assert: (results at: 2 ) equals: 'winning is everything'.	
	self assert: (results at: 3 ) equals: 'winter is coming'! !

!SentenceFinderByPrefixTest methodsFor: 'asserts' stamp: 'OO 10/13/2022 17:31:37'!
assertThereIsOnlyOneElementAndItsWinterIsHereForTheCollection: results

	self assert: results size = 1.
	self assert: (results at: 1 ) equals: 'Winter is here'! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accessing' stamp: 'FG 10/11/2022 21:16:53'!
size
	^size.! !

!OOStack methodsFor: 'accessing' stamp: 'FG 10/11/2022 21:02:37'!
top
	^top element.! !


!OOStack methodsFor: 'removing' stamp: 'OO 10/13/2022 14:55:16'!
pop
	| poppedElement |
	poppedElement := self top.
	size := size - 1.
	top := top nextLink.
	^poppedElement.! !


!OOStack methodsFor: 'private' stamp: 'FG 10/13/2022 20:45:07'!
initialize
	top := Base newWith: nil andNextElement: nil.
	size := 0.! !


!OOStack methodsFor: 'adding' stamp: 'OO 10/13/2022 14:56:59'!
push: anElement
	size := size + 1.
	top := Element newWith: anElement andNextElement: top.! !


!OOStack methodsFor: 'testing' stamp: 'FG 10/11/2022 21:17:56'!
isEmpty
	^size = 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack prefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'OO 10/13/2022 15:27:31'!
find
	  "El trabajo de este método es encontrar strings de un OOStack que contengan el prefijo con el que fue inizializado self."
	^self popStackAndFindSentencesWithEstablishedPrefixThenPushStackBackToPreviousStateAndReturnMatches.! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'FG 10/13/2022 20:33:14'!
initializeWithStack: aStack andPrefix: aStringPrefix 
	stack := aStack.
	prefix := aStringPrefix.
	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'FG 10/13/2022 20:33:03'!
popAllElementsFrom: aStack to: auxStack andForEachElementDo: aBlock

	|poppedElement|
	
	[aStack isEmpty not] whileTrue: [
			poppedElement := aStack pop.
			aBlock value: poppedElement.
			auxStack push: poppedElement.
		].

! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'FG 10/13/2022 20:32:44'!
popStackAndFindSentencesWithEstablishedPrefixThenPushStackBackToPreviousStateAndReturnMatches
	
	|popped matches|
	popped := OOStack new.
	matches := OrderedCollection new.
	
	self popAllElementsFrom: stack to: popped 
	      andForEachElementDo: [:poppedElement | 
							(poppedElement beginsWith: prefix) ifTrue: [matches addLast: poppedElement].
						].

	self popAllElementsFrom: popped to:  stack
	      andForEachElementDo: [:poppedElement | ].	
	
	^matches.

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'OO 10/12/2022 20:32:09'!
prefixCannotBeEmptyErrorDescription
	^'Prefix cannot be empty'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'OO 10/12/2022 20:54:30'!
prefixCannotHaveEmptySpacesDescription
	^'Prefix cannot have empty spaces'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'FG 10/13/2022 20:34:00'!
prefixMustBeAStringErrorDescription
	^'The prefix must be a String.'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'FG 10/13/2022 20:34:13'!
stackMustBeAnOOStackErrorDescription
	^'Stack must be an OOStack'! !


!SentenceFinderByPrefix class methodsFor: 'private' stamp: 'OO 10/13/2022 16:39:47'!
thisStringHasSpaces: aStringPrefix
	"Devuelve true si la string tiene al menos un espacio o está compuesta solamente por una."
	^ (aStringPrefix findBetweenSubStrs: {' '. '	'.}) size ~= 1! !


!SentenceFinderByPrefix class methodsFor: 'instance Creation' stamp: 'FG 10/13/2022 20:24:51'!
withStack: anOOStack andPrefix: aStringPrefix

	(anOOStack isKindOf: OOStack) ifFalse: [self error: self stackMustBeAnOOStackErrorDescription].
	
	aStringPrefix isString ifFalse: [self error: self prefixMustBeAStringErrorDescription ].
	
	aStringPrefix isEmpty ifTrue: [self error: self prefixCannotBeEmptyErrorDescription].
	
	(self thisStringHasSpaces: aStringPrefix)
			ifTrue: [self error: self prefixCannotHaveEmptySpacesDescription].
			
	^self new initializeWithStack: anOOStack andPrefix: aStringPrefix! !
