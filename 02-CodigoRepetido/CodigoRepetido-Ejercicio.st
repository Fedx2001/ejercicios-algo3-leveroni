!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'OO 9/27/2022 13:30:10'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	customerBook := CustomerBook new.	
	self should: [ customerBook addCustomerNamed: 'John Lennon' ] notTakeMoreThan: 50 milliSeconds.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'OO 9/27/2022 13:30:43'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	customerBook := CustomerBook newWithCustomerNamed: 'Paul McCartney'.
	self should: [ customerBook removeCustomerNamed: 'Paul McCartney' ] notTakeMoreThan: 100 milliSeconds.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'OO 9/27/2022 13:31:13'!
test03CanNotAddACustomerWithEmptyName
	
	| customerBook |
	
	customerBook := CustomerBook new.
	self assertThatThisBlock: [ customerBook addCustomerNamed: '' ] 
	      raisesAnErrorOfType: Error
	      andCompliesWith: [ :anError | 
			 		     self assertCustomerCanNotBeEmptyErrorMessageIsEqualToMessageTextOfTheError: anError 
				  	     andCustomerBookIsEmpty: customerBook 
					   ].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'OO 9/27/2022 13:31:33'!
test04CanNotRemoveAnInvalidCustomer
	| customerBook |
			
	customerBook := CustomerBook newWithCustomerNamed: 'John Lennon'.
	self assertThatThisBlock: [ customerBook removeCustomerNamed: 'Paul McCartney' ] 
	      raisesAnErrorOfType: NotFound
	      andCompliesWith: [ :anError | 
					     self assertThereIsOneCustomerAndItIsJohnLennonInTheCustomerBook: customerBook 
					   ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'OO 9/27/2022 13:32:01'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	| customerBook paulMcCartney |
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook newWithCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	self assertThisBook: customerBook hasCustomersActive: 0 andSuspended: 1
	      andCompliesWith: [ :aBook | aBook includesCustomerNamed: paulMcCartney ].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'OO 9/27/2022 13:32:37'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook newWithCustomerNamed: paulMcCartney. 
	
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	self assertThisBook: customerBook hasCustomersActive: 0 andSuspended: 0
	      andCompliesWith: [ :aBook | (aBook includesCustomerNamed: paulMcCartney) not ].
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'OO 9/27/2022 13:33:07'!
test07CanNotSuspendAnInvalidCustomer

	| customerBook |
			
	customerBook := CustomerBook newWithCustomerNamed: 'John Lennon'.
		
	self assertThatThisBlock: [ customerBook suspendCustomerNamed: 'Ringo Starr'. ] 
	      raisesAnErrorOfType: CantSuspend
	      andCompliesWith: [ :anError | 
					     self assertThereIsOneCustomerAndItIsJohnLennonInTheCustomerBook: customerBook
					   ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'OO 9/27/2022 13:33:27'!
test08CanNotSuspendAnAlreadySuspendedCustomer

	| customerBook johnLennon |
	johnLennon := 'John Lennon'.
	customerBook := CustomerBook newWithCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	self assertThatThisBlock: [ customerBook suspendCustomerNamed: johnLennon. ] 
	      raisesAnErrorOfType: CantSuspend
	      andCompliesWith: [ :anError | 
					     self assertThereIsOneCustomerAndItIsJohnLennonInTheCustomerBook: customerBook
					   ].! !


!CustomerBookTest methodsFor: 'asserts' stamp: 'OO 9/27/2022 13:33:45'!
assertCustomerCanNotBeEmptyErrorMessageIsEqualToMessageTextOfTheError: anError andCustomerBookIsEmpty: customerBook

	self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
	self assert: customerBook isEmpty! !

!CustomerBookTest methodsFor: 'asserts' stamp: 'FG 9/27/2022 16:01:15'!
assertThatThisBlock: aBlockToEvaluate raisesAnErrorOfType: errorType andCompliesWith: aConditionBlock


	self should: [ aBlockToEvaluate value. self fail ]
	     raise: errorType
	     withExceptionDo: aConditionBlock.! !

!CustomerBookTest methodsFor: 'asserts' stamp: 'OO 9/27/2022 13:33:56'!
assertThereIsOneCustomerAndItIsJohnLennonInTheCustomerBook: aCustomerBook
	self assert:		1 equals: aCustomerBook numberOfCustomers.
	self assert: (aCustomerBook includesCustomerNamed: 'John Lennon').! !

!CustomerBookTest methodsFor: 'asserts' stamp: 'OO 9/27/2022 13:34:27'!
assertThisBook: aBook hasCustomersActive: numberOfActiveCustomers andSuspended: numberOfSuspendedCustomers andCompliesWith: aBlock  
	self assert: numberOfActiveCustomers equals: aBook numberOfActiveCustomers.
	self assert: numberOfSuspendedCustomers equals: aBook numberOfSuspendedCustomers.
	self assert: (numberOfActiveCustomers + numberOfSuspendedCustomers) equals: aBook numberOfCustomers.
	self assert: (aBlock value: aBook).
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'OO 9/27/2022 13:34:41'!
includesCustomerNamed: aName
	^(self hasAnActiveCustomerNamed: aName) or: [ self hasASuspendedCustomerNamed: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'OO 9/27/2022 13:34:47'!
isEmpty
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'OO 9/27/2022 13:35:00'!
initialize
	super initialize.
	active := OrderedCollection new.
	suspended := OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'OO 9/27/2022 13:35:14'!
addCustomerNamed: aName
	self verifyAndSignalANameIsValidAndItDoesNotExistInTheBookForTheName: aName.
	active add: aName! !

!CustomerBook methodsFor: 'customer management' stamp: 'OO 9/27/2022 13:35:21'!
hasASuspendedCustomerNamed: aName
	^suspended includes: aName! !

!CustomerBook methodsFor: 'customer management' stamp: 'OO 9/27/2022 13:35:29'!
hasAnActiveCustomerNamed: aName 
	^active includes: aName.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'OO 9/27/2022 13:35:43'!
moveFromActiveToSuspendedTheCustomer: aName
	active remove: aName.	
	suspended add: aName.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'OO 9/27/2022 13:35:51'!
numberOfActiveCustomers
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'OO 9/27/2022 13:35:59'!
numberOfCustomers
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'customer management' stamp: 'OO 9/27/2022 13:36:07'!
numberOfSuspendedCustomers
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'OO 9/27/2022 13:36:19'!
removeActiveOrSuspendedCustomerNamed: aName
	^active remove: aName 
		    ifAbsent: [ 
			suspended remove: aName ifAbsent: [ ^NotFound signal ]
		    ]
! !

!CustomerBook methodsFor: 'customer management' stamp: 'OO 9/27/2022 13:36:27'!
removeCustomerNamed: aName 
	^self removeActiveOrSuspendedCustomerNamed: aName
! !

!CustomerBook methodsFor: 'customer management' stamp: 'OO 9/27/2022 13:36:33'!
signalCustomerAlreadyExists 
	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'OO 9/27/2022 13:36:38'!
signalCustomerNameCannotBeEmpty 
	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'OO 9/27/2022 13:36:52'!
suspendCustomerNamed: aName 
	(self hasAnActiveCustomerNamed: aName) ifFalse: [^CantSuspend signal].
	self moveFromActiveToSuspendedTheCustomer: aName.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'OO 9/27/2022 13:37:01'!
verifyAndSignalANameIsValidAndItDoesNotExistInTheBookForTheName: aName 
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !


!CustomerBook class methodsFor: 'instance creation' stamp: 'FG 9/25/2022 12:44:06'!
newWithCustomerNamed: aName

	| customerBook |

	customerBook := self new.
	customerBook addCustomerNamed: aName.
	
	^customerBook! !
