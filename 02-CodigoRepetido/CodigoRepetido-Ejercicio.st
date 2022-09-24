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

!CustomerBookTest methodsFor: 'testing' stamp: 'OO 9/24/2022 11:40:31'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	
	|customerBook|
	customerBook := CustomerBook new.
	self assertThatRunningThisBlock: [ customerBook addCustomerNamed: 'John Lennon' ] takesLessThan: (50 * millisecond).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FG 9/24/2022 15:34:19'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	customerBook := self createNewCustomerBookWithCustomer: 'Paul McCartney'.
	self assertThatRunningThisBlock: [customerBook removeCustomerNamed: 'Paul McCartney' ] takesLessThan: (100 * millisecond).
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'OO 9/24/2022 13:54:56'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	self assertThatThisBlock: [ customerBook addCustomerNamed: ''] 
		 raisesAnErrorOfType: Error
		 andCompliesWith: [ :anError | 
			 self assertCustomerCanNotBeEmptyErrorMessageIsEqualToMessageTextOfTheError: anError 
				  andCustomerBookIsEmpty: customerBook].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'OO 9/24/2022 13:38:59'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook |
			
	customerBook := self createNewCustomerBookWithCustomer: 'John Lennon'.

	self assertThatThisBlock: [ customerBook removeCustomerNamed: 'Paul McCartney'] 
		 raisesAnErrorOfType: NotFound
		 andCompliesWith: [ :anError | 
					self assertThereIsOneCustomerAndItIsJohnLennonInTheCustomerBook: customerBook].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'OO 9/24/2022 13:16:27'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createNewCustomerBookWithCustomer: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assertThisBook: customerBook hasCustomersActive: 0 andSuspended: 1
	     andCompliesWith:[:aBook| aBook includesCustomerNamed: paulMcCartney].
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'OO 9/24/2022 13:34:39'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createNewCustomerBookWithCustomer: paulMcCartney. 
	
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertThisBook: customerBook hasCustomersActive: 0 andSuspended: 0
	     andCompliesWith:[:aBook| (aBook includesCustomerNamed: paulMcCartney)not].
	


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'OO 9/24/2022 13:38:59'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook |
			
	customerBook := self createNewCustomerBookWithCustomer: 'John Lennon'.
		
	self assertThatThisBlock: [ customerBook suspendCustomerNamed: 'Ringo Starr'.] 
	     raisesAnErrorOfType: CantSuspend
	     andCompliesWith: [ :anError | 
			self assertThereIsOneCustomerAndItIsJohnLennonInTheCustomerBook: customerBook].


	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'OO 9/24/2022 13:38:59'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
	johnLennon := 'John Lennon'.
	customerBook := self createNewCustomerBookWithCustomer: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.

	self assertThatThisBlock: [ customerBook suspendCustomerNamed: johnLennon.] 
	     raisesAnErrorOfType: CantSuspend
	     andCompliesWith: [ :anError | 
			self assertThereIsOneCustomerAndItIsJohnLennonInTheCustomerBook: customerBook].! !


!CustomerBookTest methodsFor: 'asserts' stamp: 'OO 9/24/2022 13:52:13'!
assertCustomerCanNotBeEmptyErrorMessageIsEqualToMessageTextOfTheError: anError andCustomerBookIsEmpty: customerBook

	self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
	self assert: customerBook isEmpty ! !

!CustomerBookTest methodsFor: 'asserts' stamp: 'OO 9/24/2022 10:18:24'!
assertThatRunningThisBlock: aBlock takesLessThan: timeLimit
	^self assert: aBlock timeToRun < (timeLimit)! !

!CustomerBookTest methodsFor: 'asserts' stamp: 'OO 9/24/2022 13:30:36'!
assertThatThisBlock: aBlockToEvaluate raisesAnErrorOfType: errorType andCompliesWith: aConditionBlock

	[ aBlockToEvaluate value. self fail ]
		on: errorType 
		do: aConditionBlock. ! !

!CustomerBookTest methodsFor: 'asserts' stamp: 'OO 9/24/2022 13:38:59'!
assertThereIsOneCustomerAndItIsJohnLennonInTheCustomerBook: aCustomerBook
	
	self assert:			1 equals: aCustomerBook numberOfCustomers.
	self assert: (aCustomerBook includesCustomerNamed: 'John Lennon').! !

!CustomerBookTest methodsFor: 'asserts' stamp: 'OO 9/24/2022 13:11:45'!
assertThisBook: aBook hasCustomersActive: numberOfActiveCustomers andSuspended: numberOfSuspendedCustomers andCompliesWith: aBlock  

	self assert: numberOfActiveCustomers equals: aBook numberOfActiveCustomers.
	self assert: numberOfSuspendedCustomers equals: aBook numberOfSuspendedCustomers.
	self assert: (numberOfActiveCustomers + numberOfSuspendedCustomers) equals: aBook numberOfCustomers.
	self assert: (aBlock value: aBook).

	
! !

!CustomerBookTest methodsFor: 'asserts' stamp: 'OO 9/24/2022 11:42:42'!
createNewCustomerBookWithCustomer: customerNameString
	
	| customerBook customer |
			
	customerBook := CustomerBook new.
	customer := customerNameString.
	customerBook addCustomerNamed: customer.
	^customerBook.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'FG 9/24/2022 15:52:14'!
includesCustomerNamed: aName

	^(self hasAnActiveCustomerNamed: aName) or: [ self hasASuspendedCustomerNamed: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'FG 9/24/2022 15:36:04'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'FG 9/24/2022 15:55:23'!
hasASuspendedCustomerNamed: aName

	^suspended includes: aName! !

!CustomerBook methodsFor: 'customer management' stamp: 'FG 9/24/2022 15:52:57'!
hasAnActiveCustomerNamed: aName 
	
	^active includes: aName
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'OO 9/24/2022 14:09:07'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'FG 9/24/2022 16:20:04'!
removeCustomerNamed: aName 

	^self removeFromActiveOrSuspendedACustomerNamed: aName
! !

!CustomerBook methodsFor: 'customer management' stamp: 'FG 9/24/2022 16:34:29'!
removeFromActiveOrSuspendedACustomerNamed: aName
	
	^active remove: aName 
		    ifAbsent: [ 
			suspended remove: aName ifAbsent: [ ^NotFound signal ]
		    ]
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'FG 9/24/2022 15:52:29'!
suspendCustomerNamed: aName 
	
	(self hasAnActiveCustomerNamed: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

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
