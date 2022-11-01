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
	instanceVariableNames: 'aMarsRoverInitiallyFacingNorth aMarsRoverInitiallyFacingNorthEast aMarsRoverInitiallyFacingSouth aMarsRoverInitiallyFacingWest'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioMarsRover'!

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/1/2022 16:51:07'!
test01EmptyCommandDoesNothing
	
	
	aMarsRoverInitiallyFacingNorth executeComands: ''.
	
	self assert: (aMarsRoverInitiallyFacingNorth isInPosition: 0@0).
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: MovementRuleNorth).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/1/2022 16:51:07'!
test02CommandRRotatesRover
	

	
	aMarsRoverInitiallyFacingNorth executeComands: 'r'.
	
	self deny: (aMarsRoverInitiallyFacingNorth isFacing: MovementRuleNorth).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/1/2022 16:51:07'!
test03CommandLRotatesRover
	

	
	aMarsRoverInitiallyFacingNorth executeComands: 'l'.
	
	self deny: (aMarsRoverInitiallyFacingNorth isFacing: MovementRuleNorth).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/1/2022 16:51:07'!
test04CommandFMovesMarsRoverForward
	
	aMarsRoverInitiallyFacingNorth executeComands: 'f'.
	
	self deny: (aMarsRoverInitiallyFacingNorth isInPosition: 0@0).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/1/2022 16:51:07'!
test05CommandBMovesMarsRoverBackwards
	

	aMarsRoverInitiallyFacingNorth executeComands: 'b'.
	
	self deny: (aMarsRoverInitiallyFacingNorth isInPosition: 0@0).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/1/2022 16:59:23'!
test0605ExecutingCommandRTwoTimesRotates180DegreesToTheRight
	

	aMarsRoverInitiallyFacingNorth executeComands: 'rr'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: MovementRuleSouth).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/1/2022 16:58:03'!
test061ExecutingCommandRTwoTimesRotates270DegreesToTheRight
	

	aMarsRoverInitiallyFacingNorth executeComands: 'rrr'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: MovementRuleWest ).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/1/2022 16:58:42'!
test062ExecutingCommandRTwoTimesRotates360DegreesToTheRight
	

	aMarsRoverInitiallyFacingNorth executeComands: 'rrrr'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: MovementRuleNorth).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/1/2022 17:00:35'!
test063ExecutingCommandRTwoTimesRotates180DegreesToTheLeft
	

	aMarsRoverInitiallyFacingNorth executeComands: 'll'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: MovementRuleSouth).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/1/2022 17:01:00'!
test064ExecutingCommandRTwoTimesRotates270DegreesToTheLeft
	

	aMarsRoverInitiallyFacingNorth executeComands: 'lll'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: MovementRuleEast).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/1/2022 17:01:21'!
test064ExecutingCommandRTwoTimesRotates360DegreesToTheLeft
	

	aMarsRoverInitiallyFacingNorth executeComands: 'llll'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: MovementRuleNorth).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/1/2022 16:51:07'!
test07CommandRFMovesRoverOnePointToTheEast
	

	aMarsRoverInitiallyFacingNorth executeComands: 'rf'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: MovementRuleEast).
	self assert: (aMarsRoverInitiallyFacingNorth isInPosition: 1@0).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/1/2022 16:51:07'!
test08CommandRBMovesRoverOnePointToTheWestWhileFacingEast
	

	aMarsRoverInitiallyFacingNorth executeComands: 'rb'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: MovementRuleEast).
	self assert: (aMarsRoverInitiallyFacingNorth isInPosition: -1@0).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/1/2022 16:51:07'!
test09InvalidCommandRaisesExpectedErrorDescription
	
	  self should: [aMarsRoverInitiallyFacingNorth executeComands: 'ñ'.]  
	 	 raise:  Error
	        withExceptionDo: [:anError |self assert: 'Invalid Instruction!!' equals: anError messageText].! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/1/2022 16:51:07'!
test10CommandFFMovesRoverTwoPointsToTheNorthWhileFacingNorth
		aMarsRoverInitiallyFacingNorth executeComands: 'ff'.
		self assert: (aMarsRoverInitiallyFacingNorth isInPosition: 0@2).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/1/2022 16:51:07'!
test11CommandBBMovesRoverTwoPointsToTheSouthWhileFacingNorth
		aMarsRoverInitiallyFacingNorth executeComands: 'bb'.
		self assert: (aMarsRoverInitiallyFacingNorth isInPosition: 0@-2).! !


!TestsMarsRover methodsFor: 'setUp' stamp: 'OO 11/1/2022 16:52:37'!
setUp

	aMarsRoverInitiallyFacingNorth := MarsRover inPoint: 0@0 facing: MovementRuleNorth new.
	aMarsRoverInitiallyFacingNorthEast := MarsRover inPoint: 0@0 facing: MovementRuleEast new.
	aMarsRoverInitiallyFacingSouth := MarsRover inPoint: 0@0 facing: MovementRuleSouth new.
	aMarsRoverInitiallyFacingWest := MarsRover inPoint: 0@0 facing: MovementRuleWest new.! !


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


!MarsRover methodsFor: 'commands' stamp: 'OO 11/1/2022 16:49:47'!
executeComands: aStringOfCommandsIdentifiers 
	
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
