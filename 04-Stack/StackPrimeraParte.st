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

!StackTest methodsFor: 'tests' stamp: 'FG 10/8/2022 13:21:01'!
test07PoppingFromAnEmptyStackRaisesAnError

	self should: [stack pop] 
	      raise: Error 
	      withExceptionDo: [:anError | 
			self assert: stack canNotPopFromAnEmptyStackErrorDescription equals: anError messageText
		]. ! !

!StackTest methodsFor: 'tests' stamp: 'FG 10/8/2022 13:20:50'!
test08AccessingTopOfAnEmptyStackRaisesAnError

	self should: [stack top] 
	      raise: Error 
	      withExceptionDo: [ :anError | 
			self assert: stack canNotAccessTopOfAnEmptyStackErrorDescription equals: anError messageText
		]. ! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'stackStructure'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'accessing' stamp: 'FG 10/8/2022 13:21:47'!
size
	^stackStructure size.! !

!Stack methodsFor: 'accessing' stamp: 'FG 10/8/2022 13:19:40'!
top
	self isEmpty ifTrue: [self error: self canNotAccessTopOfAnEmptyStackErrorDescription].
	^stackStructure at: 1.! !


!Stack methodsFor: 'removing' stamp: 'FG 10/8/2022 13:19:08'!
pop
	self isEmpty ifTrue: [self error: self canNotPopFromAnEmptyStackErrorDescription].
	^stackStructure removeFirst.! !


!Stack methodsFor: 'private' stamp: 'FG 10/6/2022 10:55:51'!
initialize
	stackStructure := OrderedCollection new.! !


!Stack methodsFor: 'adding' stamp: 'FG 10/6/2022 11:14:35'!
push: anElement 
	stackStructure addFirst: anElement.! !


!Stack methodsFor: 'testing' stamp: 'FG 10/6/2022 10:25:41'!
isEmpty
	^stackStructure isEmpty.! !


!Stack methodsFor: 'error descriptions' stamp: 'FG 10/8/2022 13:20:03'!
canNotAccessTopOfAnEmptyStackErrorDescription
	^'Can not access the top of an empty stack'.! !

!Stack methodsFor: 'error descriptions' stamp: 'FG 10/8/2022 13:20:06'!
canNotPopFromAnEmptyStackErrorDescription
	^'Cannot remove an element from an empty stack'.! !
