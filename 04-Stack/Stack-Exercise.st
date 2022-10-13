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
	instanceVariableNames: 'stackVacio finderConStackVacio stackNoVacio finderConStackNoVacioYPrefijoWinter finderConStackNil finderConStackNoVacioYEmptyPrefix finderConStackNoVacioYPrefixConEspacios finderConStackNoVacioYNilPrefix finderConStackNoVacioYPrefijowin finderConStackNoVacioYPrefijoBoca finderConPrefijoGamConMinuscula finderConPrefijoGamConMayuscula'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'OO 10/12/2022 21:34:11'!
test01SentenceFinderWithNilStackAsParameterReturnsEmptyCollection
	
	self should: [SentenceFinderByPrefix with: nil andPrefix: 'Winter']
	      raise: Error
	      withExceptionDo: [:anError | self assert: SentenceFinderByPrefix stackCannotBeNilErrorDescription equals: anError 
					  messageText].
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'OO 10/12/2022 21:23:12'!
test02SentenceFinderWithEmptyStackAsParameterReturnsEmptyCollection
	
	self assert: (finderConStackVacio find isEmpty).

	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'OO 10/12/2022 21:37:27'!
test03CannotSearchWithEmptyPrefix

	
	self should: [SentenceFinderByPrefix with: stackNoVacio andPrefix: '']
	      raise: Error
	      withExceptionDo: [:anError | self assert: SentenceFinderByPrefix prefixCannotBeEmptyErrorDescription equals: anError 
					  messageText].
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'OO 10/12/2022 21:39:55'!
test04CannotSearchAPrefixWithSpaces

	self should: [SentenceFinderByPrefix with: stackNoVacio andPrefix: 'win  ter']
	      raise: Error
	      withExceptionDo: [:anError | self assert: SentenceFinderByPrefix prefixCannotHaveEmptySpacesDescription equals: anError 
					  messageText].
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'OO 10/12/2022 21:36:01'!
test05CannotSearchWithNilPrefix

	self should: [SentenceFinderByPrefix with: stackNoVacio andPrefix: nil]
	      raise: Error
	      withExceptionDo: [:anError | self assert: SentenceFinderByPrefix prefixCannotBeNilErrorDescription equals: anError 
					  messageText].
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'OO 10/12/2022 21:52:10'!
test06SentenceFinderWithStackNotEmptyAndWinterPrefixReturnsOnlyOneMatch
	
	|results|
	results := finderConStackNoVacioYPrefijoWinter find.
	self assert: results size = 1.
	self assert: (results at: 1 ) equals: 'Winter is here'.
	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'OO 10/12/2022 21:58:10'!
test07SentenceFinderWithStackNotEmptyAndwinPrefixReturnsThreeExpectedMatches
	
	|results|
	results := finderConStackNoVacioYPrefijowin find.
	self assert: results size = 3.
	self assert: (results at: 1 ) equals: 'winter is cold'.
	self assert: (results at: 2 ) equals: 'winning is everything'.	
	self assert: (results at: 3 ) equals: 'winter is coming'.
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'OO 10/12/2022 22:01:49'!
test08SentenceFinderWithStackNotEmptyAndBocaPrefixReturnsNoMatches
	
	self assert: finderConStackNoVacioYPrefijoWinter find isEmpty.

	
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'OO 10/12/2022 22:11:22'!
test09SentenceFinderIsCaseSensitive
	
	self assert: finderConPrefijoGamConMinuscula find isEmpty.
	self deny: finderConPrefijoGamConMayuscula find isEmpty.
	
	
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'OO 10/12/2022 22:10:59'!
setUp

	finderConStackVacio := SentenceFinderByPrefix with: OOStack new andPrefix: 'Winter'. 
	
	stackNoVacio := OOStack new.
	stackNoVacio push: 'winter is coming'.
	stackNoVacio push: 'winning is everything'.
	stackNoVacio push: 'The winds of Winter'.
	stackNoVacio push: 'Winter is here'.
	stackNoVacio push: 'winter is cold'.	
	stackNoVacio push: 'Game of Thrones'.	
	finderConStackNoVacioYPrefijoWinter := SentenceFinderByPrefix with: stackNoVacio andPrefix: 'Winter'.
	finderConStackNoVacioYPrefijowin := SentenceFinderByPrefix with: stackNoVacio andPrefix: 'win'.
	finderConStackNoVacioYPrefijoBoca := SentenceFinderByPrefix with: stackNoVacio andPrefix: 'Boca'.

	finderConPrefijoGamConMinuscula := SentenceFinderByPrefix with: stackNoVacio andPrefix: 'gam'.
	finderConPrefijoGamConMayuscula := SentenceFinderByPrefix with: stackNoVacio andPrefix: 'Gam'.	
	! !


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


!OOStack methodsFor: 'removing' stamp: 'FG 10/12/2022 13:38:07'!
pop
	| poppedElement |
	poppedElement := self top.
	size := size - 1.
	top := top nextLink.
	^poppedElement.! !


!OOStack methodsFor: 'private' stamp: 'FG 10/11/2022 21:27:32'!
initialize
	top := Base new.
	size := 0.! !


!OOStack methodsFor: 'adding' stamp: 'FG 10/11/2022 21:29:38'!
push: aString
	size := size + 1.
	top := Element newWith: aString andNextElement: top.! !


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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'OO 10/12/2022 21:18:52'!
find
	self shouldBeImplemented.
	  "El trabajo de este método es encontrar strings de un OOStack que contengan el prefijo con el que fue inizializado."! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'OO 10/12/2022 20:32:09'!
prefixCannotBeEmptyErrorDescription
	^'Prefix cannot be empty'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'OO 10/12/2022 21:29:29'!
prefixCannotBeNilErrorDescription
	^'Prefix cannot be nil.'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'OO 10/12/2022 20:54:30'!
prefixCannotHaveEmptySpacesDescription
	^'Prefix cannot have empty spaces'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'OO 10/12/2022 21:33:08'!
stackCannotBeNilErrorDescription
	^'Stack cannot be nil.'! !


!SentenceFinderByPrefix class methodsFor: 'Instance Creation' stamp: 'OO 10/12/2022 21:21:51'!
with: aOOStack andPrefix: aStringPrefix

	! !
