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

!TransferTest methodsFor: 'tests' stamp: 'FG 11/6/2022 15:54:36'!
test04WithdrawIsRegisteredInReceptiveAccountAfterTransfer
	
	| aTransfer |
	
	aTransfer := Transfer from: transfereeAccount to: recipientAccount forValue: 200*peso.
	
	self assert: (transfereeAccount hasRegistered: aTransfer withdrawLeg transaction).! !

!TransferTest methodsFor: 'tests' stamp: 'FG 11/6/2022 15:54:52'!
test05DepositIsRegisteredInReceptiveAccountAfterTransfer
	
	| aTransfer |
	
	aTransfer := Transfer from: transfereeAccount to: recipientAccount forValue: 200*peso.
	
	self assert: (recipientAccount hasRegistered: aTransfer depositLeg transaction).! !

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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'FG 11/4/2022 19:40:28'!
applyTo: aBalance
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'FG 11/4/2022 19:40:03'!
applyTo: aBalance
	^aBalance + self value.! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'FG 11/4/2022 19:40:17'!
applyTo: aBalance
	^aBalance - self value.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions balance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'FG 11/4/2022 19:53:11'!
initialize

	transactions := OrderedCollection new.
	balance := 0.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FG 11/4/2022 19:53:11'!
balance
	transactions do: [ :aTransaction |
		balance := aTransaction applyTo: balance.
	].
	
	^balance.
	! !

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


!ReceptiveAccount methodsFor: 'category-name' stamp: 'FG 11/4/2022 20:04:57'!
transferTo: aReceptiveAccount forValue: aSimpleMeasure 
	Deposit register: aSimpleMeasure on: aReceptiveAccount.
	Withdraw register: aSimpleMeasure on: self.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'FG 11/6/2022 15:23:24'!
initializeFrom: transferee to: recipient forValue: aValue 
	withdrawLeg _ TransferLeg with: (Withdraw register: aValue on: transferee).
	depositLeg _ TransferLeg with: (Deposit register: aValue on: recipient).
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


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferLeg
	instanceVariableNames: 'oppositeLeg transaction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferLeg methodsFor: 'accessing' stamp: 'FG 11/6/2022 15:14:02'!
oppositeLeg
	^oppositeLeg.! !

!TransferLeg methodsFor: 'accessing' stamp: 'FG 11/6/2022 15:26:54'!
transaction
	^transaction.! !


!TransferLeg methodsFor: 'private' stamp: 'FG 11/6/2022 15:27:13'!
initializeWith: aTransaction
	transaction _ aTransaction.! !

!TransferLeg methodsFor: 'private' stamp: 'FG 11/6/2022 15:24:53'!
opposite: aTransferLeg
	oppositeLeg _ aTransferLeg.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'FG 11/6/2022 15:26:03'!
with: aTransaction
	^self new initializeWith: aTransaction ! !
