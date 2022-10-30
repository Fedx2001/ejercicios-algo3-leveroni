!classDefinition: #MovementRule category: 'EjercicioMarsRover'!
TestCase subclass: #MovementRule
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioMarsRover'!

!MovementRule methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:10:14'!
nextMovementRuleAntiClockwise
	self subclassResponsibility.! !

!MovementRule methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:02:53'!
nextMovementRuleClockwise
	self subclassResponsibility.! !

!MovementRule methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:25:57'!
nextStepBackwardsInThisDirection
	self subclassResponsibility.! !

!MovementRule methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:29:08'!
nextStepForwardInThisDirection
	self subclassResponsibility.! !


!classDefinition: #MovementRuleEast category: 'EjercicioMarsRover'!
MovementRule subclass: #MovementRuleEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioMarsRover'!

!MovementRuleEast methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:15:03'!
nextMovementRuleAntiClockwise
	^MovementRuleNorth new.! !

!MovementRuleEast methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:15:10'!
nextMovementRuleClockwise
	^MovementRuleSouth new.! !

!MovementRuleEast methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:26:36'!
nextStepBackwardsInThisDirection
	^(-1@0).! !

!MovementRuleEast methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:20:51'!
nextStepForwardInThisDirection
	^(1@0).! !


!classDefinition: #MovementRuleNorth category: 'EjercicioMarsRover'!
MovementRule subclass: #MovementRuleNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioMarsRover'!

!MovementRuleNorth methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:15:17'!
nextMovementRuleAntiClockwise
	^MovementRuleWest new.! !

!MovementRuleNorth methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:14:53'!
nextMovementRuleClockwise
	^MovementRuleEast new.! !

!MovementRuleNorth methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:27:01'!
nextStepBackwardsInThisDirection
	^(0@-1).! !

!MovementRuleNorth methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:21:18'!
nextStepForwardInThisDirection
	^(0@1).! !


!classDefinition: #MovementRuleSouth category: 'EjercicioMarsRover'!
MovementRule subclass: #MovementRuleSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioMarsRover'!

!MovementRuleSouth methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:14:53'!
nextMovementRuleAntiClockwise
	^MovementRuleEast new.! !

!MovementRuleSouth methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:15:17'!
nextMovementRuleClockwise
	^MovementRuleWest new.! !

!MovementRuleSouth methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:27:18'!
nextStepBackwardsInThisDirection
	^(0@1).! !

!MovementRuleSouth methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:21:49'!
nextStepForwardInThisDirection
	^(0@-1).! !


!classDefinition: #MovementRuleWest category: 'EjercicioMarsRover'!
MovementRule subclass: #MovementRuleWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioMarsRover'!

!MovementRuleWest methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:15:10'!
nextMovementRuleAntiClockwise
	^MovementRuleSouth new.! !

!MovementRuleWest methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:15:03'!
nextMovementRuleClockwise
	^MovementRuleNorth new.! !

!MovementRuleWest methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:27:33'!
nextStepBackwardsInThisDirection
	^(1@0).! !

!MovementRuleWest methodsFor: 'accessing' stamp: 'OO 10/30/2022 16:22:20'!
nextStepForwardInThisDirection
	^(0@-1).! !


!classDefinition: #TestsMarsRover category: 'EjercicioMarsRover'!
TestCase subclass: #TestsMarsRover
	instanceVariableNames: 'aMarsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioMarsRover'!

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 10/30/2022 16:15:03'!
test01EmptyCommandDoesNothing
	
	
	aMarsRover executeComand: ''.
	
	self assert: (aMarsRover isInPosition: 0@0).
	self assert: (aMarsRover isFacing: MovementRuleNorth).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 10/30/2022 17:36:09'!
test02CommandRRotatesRover
	

	
	aMarsRover executeComand: 'r'.
	
	self deny: (aMarsRover isFacing: MovementRuleNorth).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 10/30/2022 17:36:19'!
test03CommandLRotatesRover
	

	
	aMarsRover executeComand: 'l'.
	
	self deny: (aMarsRover isFacing: MovementRuleNorth).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 10/30/2022 17:09:01'!
test04CommandFMovesMarsRoverForward
	
	aMarsRover executeComand: 'f'.
	
	self deny: (aMarsRover isInPosition: 0@0).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 10/30/2022 13:11:48'!
test05CommandBMovesMarsRoverBackwards
	

	aMarsRover executeComand: 'b'.
	
	self deny: (aMarsRover isInPosition: 0@0).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 10/30/2022 17:27:49'!
test06ExecutingCommandRTwoTimesRotates180DegreesToTheRight
	

	aMarsRover executeComand: 'rr'.
	
	self assert: (aMarsRover isFacing: MovementRuleSouth).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 10/30/2022 17:30:06'!
test07CommandRFMovesRoverOnePointToTheEast
	

	aMarsRover executeComand: 'rf'.
	
	self assert: (aMarsRover isFacing: MovementRuleEast).
	self assert: (aMarsRover isInPosition: 1@0).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 10/30/2022 17:31:19'!
test08CommandRBMovesRoverOnePointToTheWestWhileFacingEast
	

	aMarsRover executeComand: 'rb'.
	
	self assert: (aMarsRover isFacing: MovementRuleEast).
	self assert: (aMarsRover isInPosition: -1@0).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 10/30/2022 17:32:03'!
test09InvalidCommandRaisesExpectedErrorDescription
	
	  self should: [aMarsRover executeComand: 'ñ'.]  
	 	 raise:  Error
	        withExceptionDo: [:anError |self assert: 'Invalid Instruction!!' equals: anError messageText].! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 10/30/2022 17:33:03'!
test10CommandFFMovesRoverTwoPointsToTheNorthWhileFacingNorth
		aMarsRover executeComand: 'ff'.
		self assert: (aMarsRover isInPosition: 0@2).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 10/30/2022 17:34:12'!
test11CommandBBMovesRoverTwoPointsToTheSouthWhileFacingNorth
		aMarsRover executeComand: 'bb'.
		self assert: (aMarsRover isInPosition: 0@-2).! !


!TestsMarsRover methodsFor: 'setUp' stamp: 'OO 10/30/2022 16:15:03'!
setUp

	aMarsRover := MarsRover inPoint: 0@0 facing: MovementRuleNorth new.! !


!classDefinition: #MarsRover category: 'EjercicioMarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentPosition aMovementRule validCommands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioMarsRover'!

!MarsRover methodsFor: 'private' stamp: 'OO 10/30/2022 16:52:13'!
initializeInPoint: aPoint facing: aCardinalDirection 
	
	
	currentPosition := aPoint.
	aMovementRule := aCardinalDirection.
	
	validCommands := {'f'. 'b'. 'r'. 'l'}.! !


!MarsRover methodsFor: 'commands' stamp: 'OO 10/30/2022 17:04:11'!
executeComand: aStringOfCommandsIdentifiers 
	
	|CommandIdentifier|
	aStringOfCommandsIdentifiers do: [:aCharacter |
	CommandIdentifier := String with: aCharacter.
	(self isValidCommand: CommandIdentifier) ifFalse: [self error: 'Invalid Instruction!!'].
	CommandIdentifier = 'r' ifTrue: [self rotateRight.].
	CommandIdentifier = 'l' ifTrue: [self rotateLeft.].
	CommandIdentifier = 'f' ifTrue: [self moveForward].
	CommandIdentifier = 'b' ifTrue: [self moveBackwards].
	].! !

!MarsRover methodsFor: 'commands' stamp: 'OO 10/30/2022 17:16:12'!
moveBackwards
	currentPosition := currentPosition + (aMovementRule nextStepBackwardsInThisDirection).
	! !

!MarsRover methodsFor: 'commands' stamp: 'OO 10/30/2022 17:14:54'!
moveForward
	 currentPosition := currentPosition + (aMovementRule nextStepForwardInThisDirection).
! !

!MarsRover methodsFor: 'commands' stamp: 'OO 10/30/2022 16:24:43'!
rotateLeft
	aMovementRule:= aMovementRule nextMovementRuleAntiClockwise.

	! !

!MarsRover methodsFor: 'commands' stamp: 'OO 10/30/2022 16:24:43'!
rotateRight
	aMovementRule:= aMovementRule nextMovementRuleClockwise.! !


!MarsRover methodsFor: 'testing' stamp: 'OO 10/30/2022 16:24:43'!
isFacing: aCardinalDirection 
	^aMovementRule isKindOf: aCardinalDirection.! !

!MarsRover methodsFor: 'testing' stamp: 'OO 10/30/2022 13:02:25'!
isInPosition: aPoint 
	
	^currentPosition = aPoint.! !

!MarsRover methodsFor: 'testing' stamp: 'OO 10/30/2022 16:55:32'!
isValidCommand: aCommand

	^validCommands includes: aCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'EjercicioMarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'OO 10/30/2022 12:32:10'!
inPoint: aPoint facing: aCardinalDirection
	
	^self new initializeInPoint: aPoint facing: aCardinalDirection.! !
