!classDefinition: #TestsMarsRover category: 'EjercicioMarsRoverTDD'!
TestCase subclass: #TestsMarsRover
	instanceVariableNames: 'aMarsRoverInitiallyFacingNorth aMarsRoverInitiallyFacingSouth aMarsRoverInitiallyFacingWest aMarsRoverInitiallyFacingEast'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'EjercicioMarsRoverTDD'!

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 20:43:07'!
test01EmptyCommandDoesNothing
	
	
	aMarsRoverInitiallyFacingNorth executeComands: ''.
	
	self assert: (aMarsRoverInitiallyFacingNorth isInPosition: 0@0).
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: #North).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 20:51:36'!
test02CommandRRotatesRover
	
	aMarsRoverInitiallyFacingNorth executeComands: 'r'.
	
	self deny: (aMarsRoverInitiallyFacingNorth isFacing: #North).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 21:03:11'!
test03CommandLRotatesRoverLeft90Degrees
	
	aMarsRoverInitiallyFacingNorth executeComands: 'l'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: #West).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 21:04:05'!
test04CommandFMovesMarsRoverForward
	
	aMarsRoverInitiallyFacingNorth executeComands: 'f'.
	
	self deny: (aMarsRoverInitiallyFacingNorth isInPosition: 0@0).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 21:06:06'!
test05CommandBMovesMarsRoverBackwards
	

	aMarsRoverInitiallyFacingNorth executeComands: 'b'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isInPosition: 0@-1).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 21:12:44'!
test06CommandRRotatesRover90DegreesToTheRightWithRoverInitiallyFacingEast
	
	aMarsRoverInitiallyFacingEast executeComands: 'r'.
	
	self assert: (aMarsRoverInitiallyFacingEast isFacing: #South).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 21:14:41'!
test07CommandLRotatesRoverLeft90DegreesWithRoverInitiallyFacingEast
	
	aMarsRoverInitiallyFacingEast executeComands: 'l'.
	
	self assert: (aMarsRoverInitiallyFacingEast isFacing: #North).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 21:16:15'!
test08CommandFMovesMarsRoverForwardToTheEastWithRoverInitiallyFacingEast
	
	aMarsRoverInitiallyFacingEast executeComands: 'f'.
	
	self assert: (aMarsRoverInitiallyFacingEast isInPosition: 1@0).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 21:17:39'!
test09CommandBMovesMarsRoverBackwardsWithRoverInitiallyFacingEast
	

	aMarsRoverInitiallyFacingEast executeComands: 'b'.
	
	self assert: (aMarsRoverInitiallyFacingEast isInPosition: -1@0).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 21:19:15'!
test10CommandRRotatesRover90DegreesToTheRightWithRoverInitiallyFacingSouth
	
	aMarsRoverInitiallyFacingSouth executeComands: 'r'.
	
	self assert: (aMarsRoverInitiallyFacingSouth isFacing: #West).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 21:22:39'!
test11CommandLRotatesRoverLeft90DegreesWithRoverInitiallyFacingSouth
	
	aMarsRoverInitiallyFacingSouth executeComands: 'l'.
	
	self assert: (aMarsRoverInitiallyFacingSouth isFacing: #East).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 21:23:28'!
test12CommandFMovesMarsRoverForwardToTheSouthWithRoverInitiallyFacingSouth
	
	aMarsRoverInitiallyFacingSouth executeComands: 'f'.
	
	self assert: (aMarsRoverInitiallyFacingSouth isInPosition: 0@-1).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 21:24:34'!
test13CommandBMovesMarsRoverBackwardsWithRoverInitiallyFacingSouth
	

	aMarsRoverInitiallyFacingSouth executeComands: 'b'.
	
	self assert: (aMarsRoverInitiallyFacingSouth isInPosition: 0@1).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 21:27:50'!
test14CommandRRotatesRover90DegreesToTheRightWithRoverInitiallyFacingWest
	
	aMarsRoverInitiallyFacingWest executeComands: 'r'.
	
	self assert: (aMarsRoverInitiallyFacingWest isFacing: #North).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 21:29:24'!
test15CommandLRotatesRoverLeft90DegreesWithRoverInitiallyFacingWest
	
	aMarsRoverInitiallyFacingWest executeComands: 'l'.
	
	self assert: (aMarsRoverInitiallyFacingWest isFacing: #South).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 21:30:23'!
test16CommandFMovesMarsRoverForwardToTheSouthWithRoverInitiallyFacingWest
	
	aMarsRoverInitiallyFacingWest executeComands: 'f'.
	
	self assert: (aMarsRoverInitiallyFacingWest isInPosition: -1@0).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 21:31:34'!
test17CommandBMovesMarsRoverBackwardsWithRoverInitiallyFacingWest
	

	aMarsRoverInitiallyFacingWest executeComands: 'b'.
	
	self assert: (aMarsRoverInitiallyFacingWest isInPosition: 1@0).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 22:33:58'!
test18ExecutingCommandRTwoTimesRotates180DegreesToTheRight
	

	aMarsRoverInitiallyFacingNorth executeComands: 'rr'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: #South).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 22:34:47'!
test19ExecutingCommandRTwoTimesRotates270DegreesToTheRight
	

	aMarsRoverInitiallyFacingNorth executeComands: 'rrr'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: #West).! !

!TestsMarsRover methodsFor: 'tests' stamp: 'OO 11/2/2022 22:42:48'!
test20ExecutingCommandRTwoTimesRotates450DegreesToTheRight
	

	aMarsRoverInitiallyFacingNorth executeComands: 'rrrrr'.
	
	self assert: (aMarsRoverInitiallyFacingNorth isFacing: #East).! !


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


!MarsRover methodsFor: 'operations' stamp: 'OO 11/2/2022 22:40:12'!
executeComands: aStringOfCommands 
	
	aStringOfCommands do:[ :aCommand |
	aCommand = $r ifTrue: [self rotateRight].
	aCommand = $l ifTrue: [self rotateLeft].
	aCommand = $f ifTrue: [self moveForward].
	aCommand = $b ifTrue: [self moveBackwards].
	]
	! !

!MarsRover methodsFor: 'operations' stamp: 'OO 11/2/2022 22:17:07'!
moveBackwards

	^ currentPosition :=  movementRule nextStepBackwardsInThisDirection! !

!MarsRover methodsFor: 'operations' stamp: 'OO 11/2/2022 22:16:46'!
moveForward

	^ currentPosition := movementRule nextStepForwardInThisDirection! !

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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'EjercicioMarsRoverTDD'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'OO 11/2/2022 22:12:11'!
inPoint: aPosition facing: aCardinalDirection 

	aCardinalDirection = #North ifTrue:[
	^self new initializeInPoint: aPosition withTheMovementRule:  MarsRoverMovementRuleNorth new.].
	aCardinalDirection = #South ifTrue:[
	^self new initializeInPoint: aPosition withTheMovementRule:  MarsRoverMovementRuleSouth new.].
	aCardinalDirection = #East ifTrue:[
	^self new initializeInPoint: aPosition withTheMovementRule:  MarsRoverMovementRuleEast new.].
	aCardinalDirection = #West ifTrue:[
	^self new initializeInPoint: aPosition withTheMovementRule:  MarsRoverMovementRuleWest new.].

	"alias switch dinámico"! !


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
