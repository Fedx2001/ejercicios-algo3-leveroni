!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'aPortfolio anAccountWithOneDeposit anotherAccountWithOneDeposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'setUp' stamp: 'OO 11/9/2022 16:31:29'!
setUp

	aPortfolio _ Portfolio new.

	anAccountWithOneDeposit _ ReceptiveAccount new.
	Deposit register: 100 on: anAccountWithOneDeposit.
	
	anotherAccountWithOneDeposit _ ReceptiveAccount new.
	Deposit register: 100 on: anotherAccountWithOneDeposit.! !


!PortfolioTest methodsFor: 'tests' stamp: 'OO 11/9/2022 16:29:48'!
test01PortfolioWithNoAccountsHasCeroBalance
	
	self assert: 0 equals: aPortfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'OO 11/9/2022 16:30:57'!
test02PortfolioWithOneAccountHasBalanceOfAccount

	aPortfolio add: anAccountWithOneDeposit.

	self assert: anAccountWithOneDeposit balance equals: aPortfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'OO 11/9/2022 16:32:07'!
test03PortfolioWithMultipleAccountsHasBalanceOfThoseAccounts
	
	
	aPortfolio add: anAccountWithOneDeposit.
	aPortfolio add: anotherAccountWithOneDeposit.

	self assert: (anAccountWithOneDeposit balance + anotherAccountWithOneDeposit balance) equals: aPortfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'OO 11/9/2022 16:35:19'!
test04PortfolioWithNoAccountsDoesntRegisterTransactions
	
	| anAccount aDeposit |
	
	anAccount _ ReceptiveAccount new.
	aDeposit _ Deposit register: 100 on: anAccount.
	
	self deny: (aPortfolio hasRegistered: aDeposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'OO 11/9/2022 16:29:48'!
test05PortfolioWithOneAccountRegistersDepositTransactionMadeToThatAccount
	
	| anAccount aDeposit |
	
	anAccount _ ReceptiveAccount new.
	aDeposit _ Deposit register: 100 on: anAccount.
	
	aPortfolio add: anAccount.
	
	self assert: (aPortfolio hasRegistered: aDeposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'OO 11/9/2022 16:29:48'!
test06PortfolioWithNoAccountsHasNoTransactions
	
	self assert: OrderedCollection new equals: (aPortfolio transactions).! !

!PortfolioTest methodsFor: 'tests' stamp: 'OO 11/9/2022 16:29:48'!
test07PortfolioWithAnAccountHasTheTransactionMadeToThatAccount
	
	| anAccount |
	
	anAccount _ ReceptiveAccount new.
	Deposit register: 100 on: anAccount.
	
	aPortfolio add: anAccount.
	
	self assert: anAccount transactions equals: (aPortfolio transactions).! !

!PortfolioTest methodsFor: 'tests' stamp: 'OO 11/9/2022 16:29:48'!
test08PortfolioWithNoAccountsAndAnotherPortfolioAddedAlsoWithNoAccountsDoesntHaveAnyTransactions
	
	| aPortfolio2 |
	aPortfolio2 _ Portfolio new.
	
	aPortfolio add: aPortfolio2.
	
	self assert: (OrderedCollection new) equals: (aPortfolio transactions).! !

!PortfolioTest methodsFor: 'tests' stamp: 'OO 11/9/2022 17:06:37'!
test09CantRegisterATransactionOnAPortfolio	
		
	self should:[Deposit register: 100*peso on: aPortfolio]  
		 raise: Error  
		withExceptionDo: [:anError | self assert: anError messageText equals: 'Cannot register aTransaction on a Portfolio.'].! !

!PortfolioTest methodsFor: 'tests' stamp: 'OO 11/9/2022 17:18:55'!
test10
		
	self should:[
		
		aPortfolio add: anAccountWithOneDeposit.
		aPortfolio add: anAccountWithOneDeposit.		
		
		]  
		 raise: Error  
		withExceptionDo: [:anError | self assert: anError messageText equals: 'Cannot add an already existing account.'].! !

!PortfolioTest methodsFor: 'tests' stamp: 'OO 11/9/2022 17:26:16'!
test11
		
	self should:[
		|aBigPortfolio|
		aBigPortfolio _ Portfolio new.
		aPortfolio add: anAccountWithOneDeposit.
		aBigPortfolio add: aPortfolio.	
		aBigPortfolio add: anAccountWithOneDeposit.	
		]  
		 raise: Error  
		withExceptionDo: [:anError | self assert: anError messageText equals: 'Cannot add an already existing account.'].! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'OO 11/9/2022 17:08:41'!
test08CantAddAnAccountToAReceptiveAccount

	| account |
	
	account := ReceptiveAccount new.
		
	self should:[account add: ReceptiveAccount new.]  
		 raise: Error  
		withExceptionDo: [:anError | self assert: anError messageText equals: 'Cannot add an Account to a ReceptiveAccount.']

! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'transfereeAccount recipientAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'tests' stamp: 'FG 11/6/2022 15:52:07'!
test01Tranfering100PesosUpdatesAccountsBalance
	
	Transfer from: transfereeAccount to: recipientAccount forValue: 100*peso.
	
	self assert: (-100*peso) equals: transfereeAccount balance.
	self assert: (100*peso) equals: recipientAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'FG 11/6/2022 15:52:23'!
test02TranferValueIs100PesosAfterTransfering
	
	| aTransfer |
	
	aTransfer := Transfer from: transfereeAccount to: recipientAccount forValue: 100*peso.
	
	self assert: (100*peso) equals: aTransfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'FG 11/6/2022 15:52:47'!
test03ValueOfTransferIsTheSameAsTheRequestedValue
	
	| aTransfer |

	aTransfer := Transfer from: transfereeAccount to: recipientAccount forValue: 200*peso.
	
	self assert: (200*peso) equals: aTransfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'OO 11/9/2022 15:33:27'!
test04WithdrawIsRegisteredInReceptiveAccountAfterTransfer
	
	| aTransfer |
	
	aTransfer := Transfer from: transfereeAccount to: recipientAccount forValue: 200*peso.
	
	self assert: (transfereeAccount hasRegistered: aTransfer withdrawLeg).! !

!TransferTest methodsFor: 'tests' stamp: 'OO 11/9/2022 15:33:14'!
test05DepositIsRegisteredInReceptiveAccountAfterTransfer
	
	| aTransfer |
	
	aTransfer := Transfer from: transfereeAccount to: recipientAccount forValue: 200*peso.
	
	self assert: (recipientAccount hasRegistered: aTransfer depositLeg).! !

!TransferTest methodsFor: 'tests' stamp: 'FG 11/6/2022 15:55:05'!
test06WithdrawLegHasDepositLegAsOpposite
	
	| aTransfer |
	
	aTransfer _ Transfer from: transfereeAccount to: recipientAccount forValue: 200*peso.
	
	self assert: aTransfer depositLeg equals: aTransfer withdrawLeg oppositeLeg.! !

!TransferTest methodsFor: 'tests' stamp: 'FG 11/6/2022 15:55:20'!
test07CanNotMakeATransferFor0Pesos
	
	self should: [Transfer from: transfereeAccount to: recipientAccount forValue: 0*peso.]
		raise: Error
		withExceptionDo: [ :anError | self assert: Transfer canNotTransfer0ValueErrorDescription equals: anError messageText ]! !

!TransferTest methodsFor: 'tests' stamp: 'FG 11/6/2022 15:55:35'!
test08CanNotMakeATransferForNegativeValue
	
	self should: [Transfer from: transfereeAccount to: recipientAccount forValue: -1*peso.]
		raise: Error
		withExceptionDo: [ :anError | self assert: Transfer canNotTransferNegativeValueErrorDescription equals: anError messageText ]! !


!TransferTest methodsFor: 'setup' stamp: 'FG 11/6/2022 15:51:49'!
setUp
	transfereeAccount := ReceptiveAccount new.
	recipientAccount := ReceptiveAccount new.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'private' stamp: 'OO 11/9/2022 16:07:08'!
initializeFor: aValue

	value := aValue.! !


!AccountTransaction methodsFor: 'operations' stamp: 'FG 11/8/2022 20:17:39'!
applyTo: aBalance

	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'accesing' stamp: 'OO 11/9/2022 16:07:08'!
value 

	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'OO 11/9/2022 15:51:56'!
for: aValue

	^ self new initializeFor: aValue.! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'operations' stamp: 'FG 11/4/2022 19:40:03'!
applyTo: aBalance
	^aBalance + self value.! !


!classDefinition: #DepositTransferLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #DepositTransferLeg
	instanceVariableNames: 'oppositeLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositTransferLeg methodsFor: 'accessing' stamp: 'OO 11/9/2022 15:45:59'!
applyTo: aBalance
	^aBalance + self value.! !

!DepositTransferLeg methodsFor: 'accessing' stamp: 'OO 11/9/2022 15:57:11'!
oppositeLeg
	^oppositeLeg.! !


!DepositTransferLeg methodsFor: 'private' stamp: 'OO 11/9/2022 15:55:59'!
opposite: aTransferLeg
	oppositeLeg _ aTransferLeg.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'operations' stamp: 'FG 11/4/2022 19:40:17'!
applyTo: aBalance
	^aBalance - self value.! !


!classDefinition: #WithdrawTransferLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #WithdrawTransferLeg
	instanceVariableNames: 'oppositeLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawTransferLeg methodsFor: 'accessing' stamp: 'OO 11/9/2022 15:46:33'!
applyTo: aBalance
	^aBalance - self value.! !

!WithdrawTransferLeg methodsFor: 'accessing' stamp: 'OO 11/9/2022 15:57:16'!
oppositeLeg
	^oppositeLeg.! !


!WithdrawTransferLeg methodsFor: 'private' stamp: 'OO 11/9/2022 15:56:20'!
opposite: aTransferLeg
	oppositeLeg _ aTransferLeg.! !


!classDefinition: #BankAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #BankAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!BankAccount methodsFor: 'main protocol' stamp: 'OO 11/9/2022 16:57:41'!
add: anAccount
	
	self error: 'Cannot add an Account to a ReceptiveAccount.'! !

!BankAccount methodsFor: 'main protocol' stamp: 'OO 11/9/2022 16:46:58'!
balance

	self subclassResponsibility.! !

!BankAccount methodsFor: 'main protocol' stamp: 'OO 11/9/2022 17:37:25'!
equalOrContains: aBankAccount
	self subclassResponsibility.! !

!BankAccount methodsFor: 'main protocol' stamp: 'OO 11/9/2022 16:46:54'!
hasRegistered: aTransaction
	
	self subclassResponsibility.! !

!BankAccount methodsFor: 'main protocol' stamp: 'OO 11/9/2022 17:06:01'!
register: aTransaction
	self error: 'Cannot register aTransaction on a Portfolio.' 
	! !

!BankAccount methodsFor: 'main protocol' stamp: 'OO 11/9/2022 16:46:49'!
transactions
	self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
BankAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'main protocol' stamp: 'OO 11/9/2022 17:44:59'!
add: aBankAccount
	(accounts anySatisfy: [:anAccount | anAccount equalOrContains: aBankAccount]) ifTrue: [self error: 'Cannot add an already existing account.'].
	accounts add: aBankAccount.! !

!Portfolio methodsFor: 'main protocol' stamp: 'FG 11/8/2022 20:50:05'!
balance
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [^0].! !

!Portfolio methodsFor: 'main protocol' stamp: 'OO 11/9/2022 17:47:13'!
equalOrContains: aBankAccount
	
	"self = aBankAccount ifTrue:[^true]."
	
	(accounts anySatisfy: [:anAccount | aBankAccount equalOrContains: anAccount]) ifTrue: [^true].
	
	^false.
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'FG 11/8/2022 20:57:14'!
hasRegistered: aTransaction 
	
	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ].! !

!Portfolio methodsFor: 'main protocol' stamp: 'OO 11/9/2022 17:40:19'!
transactions

	| allTransactions |
	allTransactions _ OrderedCollection new.
	
	accounts do: [ :anAccount | allTransactions addAll: anAccount transactions ].
	
	^allTransactions.! !


!Portfolio methodsFor: 'initialization' stamp: 'FG 11/8/2022 20:47:18'!
initialize
	accounts _ OrderedCollection new.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
BankAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'FG 11/8/2022 20:42:05'!
initialize

	transactions := OrderedCollection new.
! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FG 11/8/2022 20:43:02'!
balance
	| balance |
	balance _ 0.
	
	transactions do: [ :aTransaction |
		balance _ aTransaction applyTo: balance.
	].
	
	^balance.
	! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'OO 11/9/2022 17:44:12'!
equalOrContains: aBankAccount

	^self = aBankAccount.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'OO 11/9/2022 15:57:45'!
initializeFrom: transferee to: recipient forValue: aValue 
	withdrawLeg _ WithdrawTransferLeg register: aValue on: transferee.
	depositLeg _ DepositTransferLeg register: aValue on: recipient.
	withdrawLeg opposite: depositLeg.
	depositLeg opposite: withdrawLeg.
	value _ aValue.! !


!Transfer methodsFor: 'accessing' stamp: 'FG 11/6/2022 13:55:52'!
depositLeg
	^depositLeg.! !

!Transfer methodsFor: 'accessing' stamp: 'FG 11/6/2022 13:38:37'!
value
	^value.! !

!Transfer methodsFor: 'accessing' stamp: 'FG 11/6/2022 13:54:07'!
withdrawLeg
	^withdrawLeg.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'FG 11/6/2022 15:44:46'!
from: aTranferee to: aRecipient forValue: aValue
	aValue = (0*peso) ifTrue: [ self error: self canNotTransfer0ValueErrorDescription ].
	aValue < (0*peso) ifTrue: [ self error: self canNotTransferNegativeValueErrorDescription ].

	^self new initializeFrom: aTranferee to: aRecipient forValue: aValue ! !


!Transfer class methodsFor: 'error descriptions' stamp: 'FG 11/6/2022 15:44:06'!
canNotTransfer0ValueErrorDescription
	^'Can not transfer for 0 pesos'.! !

!Transfer class methodsFor: 'error descriptions' stamp: 'FG 11/6/2022 15:43:49'!
canNotTransferNegativeValueErrorDescription
	^'Can not transfer for negative amount'.! !
