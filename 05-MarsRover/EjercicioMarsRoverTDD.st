!classDefinition: #TestsMarsRover category: 'EjercicioMarsRoverTDD'!
TestCase subclass: #TestsMarsRover
	instanceVariableNames: 'aMarsRoverInitiallyFacingNorth aMarsRoverInitiallyFacingSouth aMarsRoverInitiallyFacingWest aMarsRoverInitiallyFacingEast'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioMarsRoverTDD'!

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test01EmptyCommandDoesNothing
	
	
	aMarsRoverInitiallyFacingNorth executeCommands: ''.
	
	self assert: (aMarsRoverInitiallyFacingNorth isInPosition: 0@0).
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: #North).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test02CommandRRotatesRover
	
	aMarsRoverInitiallyFacingNorth executeCommands: 'r'.
	
	self deny: (aMarsRoverInitiallyFacingNorth isFacing: #North).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test03CommandLRotatesRoverLeft90Degrees
	
	aMarsRoverInitiallyFacingNorth executeCommands: 'l'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: #West).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test04CommandFMovesMarsRoverForward
	
	aMarsRoverInitiallyFacingNorth executeCommands: 'f'.
	
	self deny: (aMarsRoverInitiallyFacingNorth isInPosition: 0@0).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test05CommandBMovesMarsRoverBackwards
	

	aMarsRoverInitiallyFacingNorth executeCommands: 'b'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isInPosition: 0@-1).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test06CommandRRotatesRover90DegreesToTheRightWithRoverInitiallyFacingEast
	
	aMarsRoverInitiallyFacingEast executeCommands: 'r'.
	
	self assert: (aMarsRoverInitiallyFacingEast isFacing: #South).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test07CommandLRotatesRoverLeft90DegreesWithRoverInitiallyFacingEast
	
	aMarsRoverInitiallyFacingEast executeCommands: 'l'.
	
	self assert: (aMarsRoverInitiallyFacingEast isFacing: #North).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test08CommandFMovesMarsRoverForwardToTheEastWithRoverInitiallyFacingEast
	
	aMarsRoverInitiallyFacingEast executeCommands: 'f'.
	
	self assert: (aMarsRoverInitiallyFacingEast isInPosition: 1@0).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test09CommandBMovesMarsRoverBackwardsWithRoverInitiallyFacingEast
	

	aMarsRoverInitiallyFacingEast executeCommands: 'b'.
	
	self assert: (aMarsRoverInitiallyFacingEast isInPosition: -1@0).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test10CommandRRotatesRover90DegreesToTheRightWithRoverInitiallyFacingSouth
	
	aMarsRoverInitiallyFacingSouth executeCommands: 'r'.
	
	self assert: (aMarsRoverInitiallyFacingSouth isFacing: #West).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test11CommandLRotatesRoverLeft90DegreesWithRoverInitiallyFacingSouth
	
	aMarsRoverInitiallyFacingSouth executeCommands: 'l'.
	
	self assert: (aMarsRoverInitiallyFacingSouth isFacing: #East).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test12CommandFMovesMarsRoverForwardToTheSouthWithRoverInitiallyFacingSouth
	
	aMarsRoverInitiallyFacingSouth executeCommands: 'f'.
	
	self assert: (aMarsRoverInitiallyFacingSouth isInPosition: 0@-1).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test13CommandBMovesMarsRoverBackwardsWithRoverInitiallyFacingSouth
	

	aMarsRoverInitiallyFacingSouth executeCommands: 'b'.
	
	self assert: (aMarsRoverInitiallyFacingSouth isInPosition: 0@1).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test14CommandRRotatesRover90DegreesToTheRightWithRoverInitiallyFacingWest
	
	aMarsRoverInitiallyFacingWest executeCommands: 'r'.
	
	self assert: (aMarsRoverInitiallyFacingWest isFacing: #North).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test15CommandLRotatesRoverLeft90DegreesWithRoverInitiallyFacingWest
	
	aMarsRoverInitiallyFacingWest executeCommands: 'l'.
	
	self assert: (aMarsRoverInitiallyFacingWest isFacing: #South).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test16CommandFMovesMarsRoverForwardToTheSouthWithRoverInitiallyFacingWest
	
	aMarsRoverInitiallyFacingWest executeCommands: 'f'.
	
	self assert: (aMarsRoverInitiallyFacingWest isInPosition: -1@0).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test17CommandBMovesMarsRoverBackwardsWithRoverInitiallyFacingWest
	

	aMarsRoverInitiallyFacingWest executeCommands: 'b'.
	
	self assert: (aMarsRoverInitiallyFacingWest isInPosition: 1@0).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test18ExecutingCommandRTwoTimesRotates180DegreesToTheRight
	

	aMarsRoverInitiallyFacingNorth executeCommands: 'rr'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: #South).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test19ExecutingCommandRThreeTimesRotates270DegreesToTheRight
	

	aMarsRoverInitiallyFacingNorth executeCommands: 'rrr'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: #West).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test20ExecutingCommandRFiveTimesRotates450DegreesToTheRight
	

	aMarsRoverInitiallyFacingNorth executeCommands: 'rrrrr'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: #East).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test21ExecutingCommandLTwoTimesRotates180DegreesToTheLeft
	

	aMarsRoverInitiallyFacingNorth executeCommands: 'll'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: #South).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test22ExecutingCommandLThreeTimesRotates270DegreesToTheLeft
	

	aMarsRoverInitiallyFacingNorth executeCommands: 'lll'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: #East).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test23ExecutingCommandLFiveTimesRotates450DegreesToTheLeft
	

	aMarsRoverInitiallyFacingNorth executeCommands: 'lllll'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: #West).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test24CommandFFMovesRoverTwoPointsToTheNorthWhileFacingNorth
	

	aMarsRoverInitiallyFacingNorth executeCommands: 'ff'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isInPosition: 0@2).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test25CommandFFFMovesRoverThreePointsToTheNorthWhileFacingNorth
	

	aMarsRoverInitiallyFacingNorth executeCommands: 'fff'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isInPosition: 0@3).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test26CommandBBMovesRoverTwoPointsToTheSouthWhileFacingNorth
	

	aMarsRoverInitiallyFacingNorth executeCommands: 'bb'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isInPosition: 0@-2).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test27CommandBBBMovesRoverThreePointsToTheSouthWhileFacingNorth
	

	aMarsRoverInitiallyFacingNorth executeCommands: 'bbb'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isInPosition: 0@-3).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test28Invalid—CommandRaisesExpectedErrorDescription
	
	  self should: [aMarsRoverInitiallyFacingNorth executeCommands: 'Ò'.]  
	 	 raise:  Error
	        withExceptionDo: [:anError |self assert: 'Invalid Instruction!!' equals: anError messageText].! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test29InvalidCommand—RaisesExpectedErrorDescriptionAndStopsFurtherExecutionOfCommands
	
	  self should: [aMarsRoverInitiallyFacingNorth executeCommands: 'Òr'.]  
	 	 raise:  Error
	        withExceptionDo: [:anError |self assert: 'Invalid Instruction!!' equals: anError messageText.
							   self assert: (aMarsRoverInitiallyFacingNorth isFacing: #North)].! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test30InvalidCommand—RaisesExpectedErrorDescriptionAndStopsFurtherExecutionOfCommands
	
	  self should: [aMarsRoverInitiallyFacingNorth executeCommands: 'Òl'.]  
	 	 raise:  Error
	        withExceptionDo: [:anError |self assert: 'Invalid Instruction!!' equals: anError messageText.
							   self assert: (aMarsRoverInitiallyFacingNorth isFacing: #North)].! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:43:05'!
test31ExecuteValidCommandThenInvalid—CommandRaisesExpectedErrorDescriptionAndStopsFurtherExecutionOfCommands
	
	  self should: [aMarsRoverInitiallyFacingNorth executeCommands: 'rÒl'.]  
	 	 raise:  Error
	        withExceptionDo: [:anError |self assert: 'Invalid Instruction!!' equals: anError messageText.
							   self assert: (aMarsRoverInitiallyFacingNorth isFacing: #East)].! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test32InvalidCommandNot—RaisesExpectedErrorDescription
	
	  self should: [aMarsRoverInitiallyFacingNorth executeCommands: 'k'.]  
	 	 raise:  Error
	        withExceptionDo: [:anError |self assert: 'Invalid Instruction!!' equals: anError messageText].! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/3/2022 12:42:01'!
test33InvalidCommandNot—RaisesExpectedErrorDescriptionAndStopsFurtherExecutionOfCommands
	
	  self should: [aMarsRoverInitiallyFacingNorth executeCommands: 'kr'.]  
	 	 raise:  Error
	        withExceptionDo: [:anError |self assert: 'Invalid Instruction!!' equals: anError messageText.
							   self assert: (aMarsRoverInitiallyFacingNorth isFacing: #North)].! !


!TestsMarsRover methodsFor: 'setUp' stamp: 'OO 11/2/2022 20:43:58'!
setUp

	aMarsRoverInitiallyFacingNorth := MarsRover inPoint: 0@0 facing: #North.
	aMarsRoverInitiallyFacingEast := MarsRover inPoint: 0@0 facing: #East.
	aMarsRoverInitiallyFacingSouth := MarsRover inPoint: 0@0 facing: #South.
	aMarsRoverInitiallyFacingWest := MarsRover inPoint: 0@0 facing: #West.! !


!classDefinition: #MarsRover category: 'EjercicioMarsRoverTDD'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentPosition movementRule'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioMarsRoverTDD'!

!MarsRover methodsFor: 'private' stamp: 'OO 11/2/2022 22:13:17'!
initializeInPoint: aPosition withTheMovementRule: aMovementRule 
	
	currentPosition := aPosition.
	movementRule := aMovementRule.! !


!MarsRover methodsFor: 'operations' stamp: 'OO 11/3/2022 12:42:01'!
executeCommands: aStringOfCommands 
	
	aStringOfCommands do:[ :aCommand |
	(self isValidCommand: aCommand) ifFalse: [self error: 'Invalid Instruction!!'].
	aCommand = $r ifTrue: [self rotateRight].
	aCommand = $l ifTrue: [self rotateLeft].
	aCommand = $f ifTrue: [self moveForward].
	aCommand = $b ifTrue: [self moveBackwards].
	].! !

!MarsRover methodsFor: 'operations' stamp: 'OO 11/3/2022 11:06:37'!
moveBackwards

	^ currentPosition :=  currentPosition + movementRule nextStepBackwardsInThisDirection! !

!MarsRover methodsFor: 'operations' stamp: 'OO 11/3/2022 11:00:47'!
moveForward

	^ currentPosition := currentPosition + movementRule nextStepForwardInThisDirection! !

!MarsRover methodsFor: 'operations' stamp: 'OO 11/2/2022 22:16:28'!
rotateLeft

	^ movementRule := movementRule nextMovementRuleAntiClockwise! !

!MarsRover methodsFor: 'operations' stamp: 'OO 11/2/2022 22:15:59'!
rotateRight

	^ movementRule := movementRule nextMovementRuleClockwise! !


!MarsRover methodsFor: 'testing' stamp: 'OO 11/2/2022 22:29:51'!
isFacing: aCardinalDirection 
	^movementRule isMarsRoverFacing: aCardinalDirection.! !

!MarsRover methodsFor: 'testing' stamp: 'OO 11/2/2022 21:33:20'!
isInPosition: aPosition 
	^currentPosition  = aPosition.! !

!MarsRover methodsFor: 'testing' stamp: 'OO 11/3/2022 11:32:42'!
isValidCommand: aCommand

	^ {$r. $l. $f. $b} includes: aCommand! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'EjercicioMarsRoverTDD'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'OO 11/3/2022 12:40:52'!
inPoint: aPosition facing: aCardinalDirection 

	^self new initializeInPoint: aPosition withTheMovementRule:  (MarsRoverMovementRule newForDirection: aCardinalDirection).
	
! !


!classDefinition: #MarsRoverMovementRule category: 'EjercicioMarsRoverTDD'!
Object subclass: #MarsRoverMovementRule
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioMarsRoverTDD'!

!MarsRoverMovementRule methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:43:09'!
nextMovementRuleAntiClockwise
	self subclassResponsibility.! !

!MarsRoverMovementRule methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:43:23'!
nextMovementRuleClockwise
	self subclassResponsibility.! !

!MarsRoverMovementRule methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:43:44'!
nextStepBackwardsInThisDirection
	self subclassResponsibility.! !

!MarsRoverMovementRule methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:44:19'!
nextStepForwardInThisDirection
	self subclassResponsibility.! !


!MarsRoverMovementRule methodsFor: 'testing' stamp: 'OO 11/2/2022 22:23:27'!
isMarsRoverFacing: aCardinalDirection
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverMovementRule class' category: 'EjercicioMarsRoverTDD'!
MarsRoverMovementRule class
	instanceVariableNames: ''!

!MarsRoverMovementRule class methodsFor: 'instance creation' stamp: 'OO 11/3/2022 12:38:13'!
newForDirection: aCardinalDirection

	^(MarsRoverMovementRule subclasses detect:[:aMovementRuleSubclass | 
							aMovementRuleSubclass isCompatibleWithDirection: aCardinalDirection ]) new.! !


!MarsRoverMovementRule class methodsFor: 'private' stamp: 'OO 11/3/2022 12:36:52'!
isCompatibleWithDirection: aCardinalDirection
	self subclassResponsibility.! !


!classDefinition: #MarsRoverMovementRuleEast category: 'EjercicioMarsRoverTDD'!
MarsRoverMovementRule subclass: #MarsRoverMovementRuleEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioMarsRoverTDD'!

!MarsRoverMovementRuleEast methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:49:53'!
nextMovementRuleAntiClockwise
	^MarsRoverMovementRuleNorth new.! !

!MarsRoverMovementRuleEast methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:50:03'!
nextMovementRuleClockwise
	^MarsRoverMovementRuleSouth new.! !

!MarsRoverMovementRuleEast methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:45:03'!
nextStepBackwardsInThisDirection
	^(-1@0).! !

!MarsRoverMovementRuleEast methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:45:33'!
nextStepForwardInThisDirection
	^(1@0).! !


!MarsRoverMovementRuleEast methodsFor: 'testing' stamp: 'OO 11/2/2022 22:28:57'!
isMarsRoverFacing: aCardinalDirection
	^#East = aCardinalDirection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverMovementRuleEast class' category: 'EjercicioMarsRoverTDD'!
MarsRoverMovementRuleEast class
	instanceVariableNames: ''!

!MarsRoverMovementRuleEast class methodsFor: 'private' stamp: 'OO 11/3/2022 12:39:45'!
isCompatibleWithDirection: aCardinalDirection
	^#East = aCardinalDirection.! !


!classDefinition: #MarsRoverMovementRuleNorth category: 'EjercicioMarsRoverTDD'!
MarsRoverMovementRule subclass: #MarsRoverMovementRuleNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioMarsRoverTDD'!

!MarsRoverMovementRuleNorth methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:49:18'!
nextMovementRuleAntiClockwise
	^MarsRoverMovementRuleWest new. ! !

!MarsRoverMovementRuleNorth methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:49:34'!
nextMovementRuleClockwise
	^MarsRoverMovementRuleEast new. ! !

!MarsRoverMovementRuleNorth methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:46:02'!
nextStepBackwardsInThisDirection
	^(0@-1).! !

!MarsRoverMovementRuleNorth methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:46:11'!
nextStepForwardInThisDirection
	^(0@1).! !


!MarsRoverMovementRuleNorth methodsFor: 'testing' stamp: 'OO 11/2/2022 22:29:14'!
isMarsRoverFacing: aCardinalDirection
	^#North = aCardinalDirection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverMovementRuleNorth class' category: 'EjercicioMarsRoverTDD'!
MarsRoverMovementRuleNorth class
	instanceVariableNames: ''!

!MarsRoverMovementRuleNorth class methodsFor: 'private' stamp: 'OO 11/3/2022 12:39:56'!
isCompatibleWithDirection: aCardinalDirection
	^#North = aCardinalDirection.! !


!classDefinition: #MarsRoverMovementRuleSouth category: 'EjercicioMarsRoverTDD'!
MarsRoverMovementRule subclass: #MarsRoverMovementRuleSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioMarsRoverTDD'!

!MarsRoverMovementRuleSouth methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:49:04'!
nextMovementRuleAntiClockwise
	^MarsRoverMovementRuleEast new.! !

!MarsRoverMovementRuleSouth methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:48:54'!
nextMovementRuleClockwise
	^MarsRoverMovementRuleWest new.! !

!MarsRoverMovementRuleSouth methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:46:54'!
nextStepBackwardsInThisDirection
	^(0@1).! !

!MarsRoverMovementRuleSouth methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:47:20'!
nextStepForwardInThisDirection
	^(0@-1).! !


!MarsRoverMovementRuleSouth methodsFor: 'testing' stamp: 'OO 11/2/2022 22:29:26'!
isMarsRoverFacing: aCardinalDirection
	^#South = aCardinalDirection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverMovementRuleSouth class' category: 'EjercicioMarsRoverTDD'!
MarsRoverMovementRuleSouth class
	instanceVariableNames: ''!

!MarsRoverMovementRuleSouth class methodsFor: 'private' stamp: 'OO 11/3/2022 12:40:06'!
isCompatibleWithDirection: aCardinalDirection
	^#South = aCardinalDirection.! !


!classDefinition: #MarsRoverMovementRuleWest category: 'EjercicioMarsRoverTDD'!
MarsRoverMovementRule subclass: #MarsRoverMovementRuleWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioMarsRoverTDD'!

!MarsRoverMovementRuleWest methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:48:20'!
nextMovementRuleAntiClockwise
	^MarsRoverMovementRuleSouth new.! !

!MarsRoverMovementRuleWest methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:48:42'!
nextMovementRuleClockwise
	^MarsRoverMovementRuleNorth new.! !

!MarsRoverMovementRuleWest methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:47:53'!
nextStepBackwardsInThisDirection
	^(1@0).! !

!MarsRoverMovementRuleWest methodsFor: 'accessing' stamp: 'OO 11/2/2022 21:48:00'!
nextStepForwardInThisDirection
	^(-1@0).! !


!MarsRoverMovementRuleWest methodsFor: 'testing' stamp: 'OO 11/2/2022 22:29:37'!
isMarsRoverFacing: aCardinalDirection
	^#West = aCardinalDirection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverMovementRuleWest class' category: 'EjercicioMarsRoverTDD'!
MarsRoverMovementRuleWest class
	instanceVariableNames: ''!

!MarsRoverMovementRuleWest class methodsFor: 'private' stamp: 'OO 11/3/2022 12:40:15'!
isCompatibleWithDirection: aCardinalDirection
	^#West = aCardinalDirection.! !
