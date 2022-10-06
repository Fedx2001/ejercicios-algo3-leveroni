!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'setup' stamp: 'FG 10/6/2022 09:56:25'!
setUp
	stack := Stack new.! !


!StackTest methodsFor: 'asserts' stamp: 'FG 10/6/2022 12:01:49'!
assertSecondElementIsTopAfterPoppingLastElementAfterPushing: firstElement andThen: secondElement andThen: lastElement

	self push: firstElement andThen: secondElement andThen: lastElement.
	self assert: lastElement equals: stack pop.
	self assert: secondElement equals: stack top.! !


!StackTest methodsFor: 'compund operations' stamp: 'FG 10/6/2022 11:31:04'!
push: firstElement andThen: secondElement andThen: thirdElement
	{firstElement . secondElement . thirdElement } do: [:element | stack push: element].! !


!StackTest methodsFor: 'tests' stamp: 'FG 10/6/2022 09:56:39'!
test01StackShouldBeEmptyWhenCreated

	self assert: stack isEmpty! !

!StackTest methodsFor: 'tests' stamp: 'FG 10/6/2022 10:30:54'!
test02StackShouldNotBeEmptyAfterPushingAnElement
	
	stack push: 1.
	
	self deny: stack isEmpty.! !

!StackTest methodsFor: 'tests' stamp: 'FG 10/6/2022 11:00:06'!
test03PushAddsAnElementToTheTop
	
	stack push: 1.
	
	self assert: 1 equals: stack top.! !

!StackTest methodsFor: 'tests' stamp: 'FG 10/6/2022 11:10:00'!
test04PopRemovesAnElementFromTheStack
	
	stack push: 1.
	stack pop.
	
	self assert: stack isEmpty.! !

!StackTest methodsFor: 'tests' stamp: 'FG 10/6/2022 12:01:49'!
test05PopRemovesTheTopElementOfTheStack
	
	self assertSecondElementIsTopAfterPoppingLastElementAfterPushing: 1 andThen: 2 andThen: 3.
	self assertSecondElementIsTopAfterPoppingLastElementAfterPushing: 4 andThen: 5 andThen: 6.! !

!StackTest methodsFor: 'tests' stamp: 'FG 10/6/2022 11:31:23'!
test06AccessingTopOfStackDoesNotRemoveTheElement
	
	self push: 1 andThen: 2 andThen: 3.

	self assert: 3 equals: stack top.
	self assert: 3 equals: stack size.! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'stackStructure'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'accessing' stamp: 'FG 10/6/2022 10:25:41'!
isEmpty
	^stackStructure isEmpty.! !

!Stack methodsFor: 'accessing' stamp: 'FG 10/6/2022 11:21:01'!
size
	^stackStructure size.! !

!Stack methodsFor: 'accessing' stamp: 'FG 10/6/2022 11:17:47'!
top
	self isEmpty ifTrue: [self error: 'The stack is empty'].
	^stackStructure at: 1.! !


!Stack methodsFor: 'removing' stamp: 'FG 10/6/2022 11:16:14'!
pop
	self isEmpty ifTrue: [self error: 'Cannot remove an element from an empty stack'].
	^stackStructure removeFirst.! !


!Stack methodsFor: 'private' stamp: 'FG 10/6/2022 10:55:51'!
initialize
	stackStructure := OrderedCollection new.! !


!Stack methodsFor: 'adding' stamp: 'FG 10/6/2022 11:14:35'!
push: anElement 
	stackStructure addFirst: anElement.! !
