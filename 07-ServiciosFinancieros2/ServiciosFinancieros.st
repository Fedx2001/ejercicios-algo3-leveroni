!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!

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


!classDefinition: #TransferTest category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'FG 11/11/2022 20:17:07'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0*peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'reportes' stamp: 'FG 11/12/2022 12:47:21'!
accountSummary
	
	| report |
	report _ OrderedCollection new.
	
	accounts do: [ :anAccount | 
		report addAll: (anAccount accountSummary allButLast)
	].
	
	report add: 'Balance = ', self balance asString.
	
	^report.! !

!Portfolio methodsFor: 'reportes' stamp: 'FG 11/12/2022 17:33:10'!
netTransferReport
	
	| total |
	total _ 0*peso.
	
	accounts isEmpty ifTrue: [^0*peso.].
	
	accounts do: [ :anAccount | total _ total + anAccount netTransferReport ].
	
	^total.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FG 11/11/2022 20:16:22'!
balance

	^transactions 
		inject: (0*peso)
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
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


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'dd' stamp: 'FG 11/13/2022 12:42:05'!
processFor: aReport

	self subclassResponsibility.! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'dd' stamp: 'FG 11/13/2022 12:48:22'!
processFor: aReport

	^aReport processDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'dd' stamp: 'FG 11/13/2022 12:48:30'!
processFor: aReport

	^aReport processTransferDepositLeg: self.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'dd' stamp: 'FG 11/13/2022 12:48:35'!
processFor: aReport

	^aReport processTransferWithdrawLeg: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'dd' stamp: 'FG 11/13/2022 12:48:39'!
processFor: aReport

	^aReport processWithdraw: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-SolucionExtraParte1Catedra'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
!classDefinition: #AccountSummaryReportTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #AccountSummaryReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!AccountSummaryReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:09:56'!
test01SummaryOfAccountWithNoTransactionsHasBalanceOf0Pesos
	
	| anAccount expectedResult aReport |
	anAccount _ ReceptiveAccount new.
	
	expectedResult _ OrderedCollection with: 'Balance = 0 * pesos'.
	
	aReport _ AccountSummaryReport generateFor: anAccount.
	
	self assert: expectedResult equals: aReport yieldResult.! !

!AccountSummaryReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:10:23'!
test02SummaryOfAccountWithOneDepositHasBalanceAndDeposit
	
	| anAccount expectedReport aReport |
	anAccount _ ReceptiveAccount new.
	
	Deposit register: 100*peso on: anAccount.
	
	expectedReport _ OrderedCollection with: 'Depósito por 100 * pesos' with: 'Balance = 100 * pesos'.
	
	aReport _ AccountSummaryReport generateFor: anAccount.
	
	self assert: expectedReport equals: aReport yieldResult.! !

!AccountSummaryReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:10:38'!
test03SummaryOfAccountWithMultipleDepositsHasAllDeposits
	
	| anAccount expectedReport aReport |
	anAccount _ ReceptiveAccount new.
	
	Deposit register: 100*peso on: anAccount.
	Deposit register: 10*peso on: anAccount.
	
	expectedReport _ OrderedCollection with: 'Depósito por 100 * pesos' with: 'Depósito por 10 * pesos' with: 'Balance = 110 * pesos'.
	
	aReport _ AccountSummaryReport generateFor: anAccount.
	
	self assert: expectedReport equals: aReport yieldResult.! !

!AccountSummaryReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:10:44'!
test04SummaryOfAccountWithOneWithdrawalHasBalanceAndWithdraw
	
	| anAccount expectedReport aReport |
	anAccount _ ReceptiveAccount new.
	
	Withdraw register: 100*peso on: anAccount.
	
	expectedReport _ OrderedCollection with: 'Extracción por 100 * pesos' with: 'Balance = -100 * pesos'.
	
	aReport _ AccountSummaryReport generateFor: anAccount.
	
	self assert: expectedReport equals: aReport yieldResult.! !

!AccountSummaryReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:11:03'!
test05SummaryOfAccountWithMultipleWithdrawsHasAllWithdraws
	
	| anAccount expectedReport aReport |
	anAccount _ ReceptiveAccount new.
	
	Withdraw register: 100*peso on: anAccount.
	Withdraw register: 50*peso on: anAccount.
	
	expectedReport _ OrderedCollection with: 'Extracción por 100 * pesos' with: 'Extracción por 50 * pesos' with: 'Balance = -150 * pesos'.
	
	aReport _ AccountSummaryReport generateFor: anAccount.
	
	self assert: expectedReport equals: aReport yieldResult.! !

!AccountSummaryReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:11:44'!
test06SummaryOfAccountThatTransferedHasTransferLegAndBalance
	
	| originAccount expectedReport recipientAccount aReport |
	originAccount _ ReceptiveAccount new.
	recipientAccount _ ReceptiveAccount new.
	
	Transfer amount: 100*peso from: originAccount to: recipientAccount. 
		
	expectedReport _ OrderedCollection with: 'Salida por transferencia de 100 * pesos' with: 'Balance = -100 * pesos'.
	
	aReport _ AccountSummaryReport generateFor: originAccount.
	
	self assert: expectedReport equals: aReport yieldResult.! !

!AccountSummaryReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:12:48'!
test07SummaryOfAccountThatTransferedMultipleTimesHasTransferLegsAndBalance
	
	| originAccount expectedReport recipientAccount aReport |
	originAccount _ ReceptiveAccount new.
	recipientAccount _ ReceptiveAccount new.
	
	Transfer amount: 100*peso from: originAccount to: recipientAccount.
	Transfer amount: 200*peso from: originAccount to: recipientAccount.
			
	expectedReport _ OrderedCollection with: 'Salida por transferencia de 100 * pesos' with: 'Salida por transferencia de 200 * pesos' with: 'Balance = -300 * pesos'.
	
	aReport _ AccountSummaryReport generateFor: originAccount.
	
	self assert: expectedReport equals: aReport yieldResult.! !

!AccountSummaryReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:13:11'!
test08SummaryOfAccountThatReceivedATransferHasTransferLegAndBalance
	
	| originAccount expectedReport recipientAccount aReport |
	originAccount _ ReceptiveAccount new.
	recipientAccount _ ReceptiveAccount new.
	
	Transfer amount: 100*peso from: originAccount to: recipientAccount.
			
	expectedReport _ OrderedCollection with: 'Entrada por transferencia de 100 * pesos' with: 'Balance = 100 * pesos'.
	
	aReport _ AccountSummaryReport generateFor: recipientAccount.
	
	self assert: expectedReport equals: aReport yieldResult.! !

!AccountSummaryReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:13:23'!
test09SummaryOfAccountThatReceivedMultipleTransferencesHasTransferLegsAndBalance
	
	| originAccount expectedReport recipientAccount aReport |
	originAccount _ ReceptiveAccount new.
	recipientAccount _ ReceptiveAccount new.
	
	Transfer amount: 100*peso from: originAccount to: recipientAccount.
	Transfer amount: 200*peso from: originAccount to: recipientAccount.
			
	expectedReport _ OrderedCollection with: 'Entrada por transferencia de 100 * pesos' with: 'Entrada por transferencia de 200 * pesos' with: 'Balance = 300 * pesos'.
	
	aReport _ AccountSummaryReport generateFor: recipientAccount.
	
	self assert: expectedReport equals: aReport yieldResult.! !

!AccountSummaryReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:13:33'!
test10SummaryOfPortfolioWithNoAccountsHasCeroBalance
	
	| aPortfolio expectedReport aReport |
	aPortfolio _ Portfolio new.
	
	expectedReport _ OrderedCollection with: 'Balance = 0 * pesos'.
	
	aReport _ AccountSummaryReport generateFor: aPortfolio.
	
	self assert: expectedReport equals: aReport yieldResult.! !

!AccountSummaryReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:13:44'!
test11SummaryOfPortfolioWithAnAccountWithDepositHasDepositAndBalance
	
	| aPortfolio aReceptiveAccount expectedReport aReport |
	aReceptiveAccount _ ReceptiveAccount new.
	aPortfolio _ Portfolio with: aReceptiveAccount.
	
	Deposit register: 100*peso on: aReceptiveAccount. 
	
	expectedReport _ OrderedCollection with: 'Depósito por 100 * pesos' with: 'Balance = 100 * pesos'.
	
	aReport _ AccountSummaryReport generateFor: aPortfolio.
	
	self assert: expectedReport equals: aReport yieldResult.! !

!AccountSummaryReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:13:55'!
test12SummaryOfPortfolioWithMultipleAccountsHasDepositsOfAccountsAndBalance
	
	| aPortfolio aReceptiveAccount expectedReport aReceptiveAccount2 aReport |
	aReceptiveAccount _ ReceptiveAccount new.
	aReceptiveAccount2 _ ReceptiveAccount new.
	aPortfolio _ Portfolio with: aReceptiveAccount with: aReceptiveAccount2.
	
	Deposit register: 200*peso on: aReceptiveAccount2. 
	Deposit register: 100*peso on: aReceptiveAccount.
	
	expectedReport _ OrderedCollection with: 'Depósito por 100 * pesos' with: 'Depósito por 200 * pesos' with: 'Balance = 300 * pesos'.
	
	aReport _ AccountSummaryReport generateFor: aPortfolio.
	
	self assert: expectedReport equals: aReport yieldResult.! !

!AccountSummaryReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:14:07'!
test13SummaryOfParentPortfolioWithChildPortfolioAndAccountHasDepositOfAccountAndBalance
	
	| aPortfolio expectedReport anAccount parentPortfolio aReport |
	anAccount _ ReceptiveAccount new.
	aPortfolio _ Portfolio with: anAccount.
	parentPortfolio _ Portfolio with: aPortfolio.
	
	Deposit register: 100*peso on: anAccount.
	
	expectedReport _ OrderedCollection with: 'Depósito por 100 * pesos' with: 'Balance = 100 * pesos'.
	
	aReport _ AccountSummaryReport generateFor: parentPortfolio.
	
	self assert: expectedReport equals: aReport yieldResult.! !


!classDefinition: #NetTransferReportTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #NetTransferReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!NetTransferReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:14:49'!
test01ReceptiveAccountWithNoTransfersHas0pesosNetTransferReport
	
	| originAccount aReport |
	originAccount _ ReceptiveAccount new.
	
	aReport _ NetTransferReport generateFor: originAccount.
	
	self assert: 0*peso equals: aReport yieldResult.! !

!NetTransferReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:15:29'!
test02NetTransferReportFromOriginOfTransferAccountWithOnlyOneTransferIsTheExpected
	
	| originAccount recipientAccount aReport |
	originAccount _ ReceptiveAccount new.
	recipientAccount _ ReceptiveAccount new.
	
	Transfer amount: 10*peso from: originAccount to: recipientAccount. 
	
	aReport _ NetTransferReport generateFor: originAccount.
	
	self assert: -10*peso equals: aReport yieldResult.! !

!NetTransferReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:16:04'!
test03
	
	| originAccount recipientAccount aReport |
	originAccount _ ReceptiveAccount new.
	recipientAccount _ ReceptiveAccount new.
	
	Transfer amount: 10*peso from: originAccount to: recipientAccount. 
	
	aReport _ NetTransferReport generateFor: recipientAccount.
	
	self assert: 10*peso equals: aReport yieldResult.! !

!NetTransferReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:16:15'!
test04
	
	| originAccount recipientAccount aReport |
	originAccount _ ReceptiveAccount new.
	recipientAccount _ ReceptiveAccount new.
	
	Transfer amount: 10*peso from: originAccount to: recipientAccount.
	Transfer amount: 10*peso from: originAccount to: recipientAccount. 
	
	aReport _ NetTransferReport generateFor: originAccount.
	
	self assert: -20*peso equals: aReport yieldResult.! !

!NetTransferReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:16:34'!
test05
	
	| originAccount recipientAccount aReport |
	originAccount _ ReceptiveAccount new.
	recipientAccount _ ReceptiveAccount new.
	
	Transfer amount: 10*peso from: originAccount to: recipientAccount.
	Transfer amount: 10*peso from: originAccount to: recipientAccount.
	Deposit register: 100*peso on: originAccount.
	
	aReport _ NetTransferReport generateFor: originAccount.
	
	self assert: -20*peso equals: aReport yieldResult.
	self assert: 80*peso equals: originAccount balance.! !

!NetTransferReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:16:58'!
test06
	
	| portfolio aReport |
	portfolio _ Portfolio new.
	
	aReport _ NetTransferReport generateFor: portfolio.
	
	self assert: 0*peso equals: aReport yieldResult.! !

!NetTransferReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:17:16'!
test07
	
	| originAccount recipientAccount portfolio aReport |
	originAccount _ ReceptiveAccount new.
	recipientAccount _ ReceptiveAccount new.
	portfolio _ Portfolio with: originAccount.
	
	Transfer amount: 10*peso from: originAccount to: recipientAccount.
	
	aReport _ NetTransferReport generateFor: portfolio.
	
	self assert: -10*peso equals: aReport yieldResult.! !

!NetTransferReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:17:34'!
test08
	
	| originAccount recipientAccount portfolio aReport |
	originAccount _ ReceptiveAccount new.
	recipientAccount _ ReceptiveAccount new.
	portfolio _ Portfolio with: recipientAccount.
	
	Transfer amount: 10*peso from: originAccount to: recipientAccount.
	
	aReport _ NetTransferReport generateFor: portfolio.
	
	self assert: 10*peso equals: aReport yieldResult.! !

!NetTransferReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:17:49'!
test09
	
	| originAccount recipientAccount portfolio aReport |
	originAccount _ ReceptiveAccount new.
	recipientAccount _ ReceptiveAccount new.
	portfolio _ Portfolio with: recipientAccount.
	
	Transfer amount: 10*peso from: originAccount to: recipientAccount.
	Transfer amount: 10*peso from: originAccount to: recipientAccount.
	
	aReport _ NetTransferReport generateFor: portfolio.
	
	self assert: 20*peso equals: aReport yieldResult.! !

!NetTransferReportTest methodsFor: 'tests' stamp: 'FG 11/13/2022 12:18:09'!
test10
	
	| originAccount recipientAccount portfolio aReport |
	originAccount _ ReceptiveAccount new.
	recipientAccount _ ReceptiveAccount new.
	portfolio _ Portfolio with: (Portfolio with: recipientAccount).
	
	Transfer amount: 10*peso from: originAccount to: recipientAccount.
		
	aReport _ NetTransferReport generateFor: portfolio.
	
	self assert: 10*peso equals: aReport yieldResult.! !


!classDefinition: #Report category: 'ServiciosFinancieros-Parte2'!
Object subclass: #Report
	instanceVariableNames: 'result'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!Report methodsFor: 'initialization' stamp: 'FG 11/13/2022 12:01:53'!
initializeWith: anAccount

	self subclassResponsibility.! !


!Report methodsFor: 'result' stamp: 'FG 11/13/2022 12:08:24'!
yieldResult
	
	^result.! !


!Report methodsFor: 'dd' stamp: 'FG 11/13/2022 12:43:01'!
processDeposit: aDeposit

	self subclassResponsibility.! !

!Report methodsFor: 'dd' stamp: 'FG 11/13/2022 12:43:35'!
processTransferDepositLeg: aTransferDepositLeg

	self subclassResponsibility.! !

!Report methodsFor: 'dd' stamp: 'FG 11/13/2022 12:43:20'!
processTransferWithdrawLeg: aTransferWithdrawLeg

	self subclassResponsibility.! !

!Report methodsFor: 'dd' stamp: 'FG 11/13/2022 12:43:09'!
processWithdraw: aWithdraw

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: 'ServiciosFinancieros-Parte2'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'instance creation' stamp: 'FG 11/13/2022 12:00:52'!
generateFor: anAccount
	
	^self new initializeWith: anAccount.! !


!classDefinition: #AccountSummaryReport category: 'ServiciosFinancieros-Parte2'!
Report subclass: #AccountSummaryReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!AccountSummaryReport methodsFor: 'initialization' stamp: 'FG 11/13/2022 13:00:59'!
initializeWith: anAccount
	
	result _ OrderedCollection new.
	
	anAccount transactions do: [ :aTransaction | 
		result add: (aTransaction processFor: self).
	].
	
	result add: ('Balance = ', anAccount balance asString).! !


!AccountSummaryReport methodsFor: 'dd' stamp: 'FG 11/13/2022 12:45:14'!
processDeposit: aDeposit
	
	^'Depósito por ', aDeposit value asString.! !

!AccountSummaryReport methodsFor: 'dd' stamp: 'FG 11/13/2022 12:47:34'!
processTransferDepositLeg: aTransferDepositLeg
	
	^'Entrada por transferencia de ', aTransferDepositLeg value asString.! !

!AccountSummaryReport methodsFor: 'dd' stamp: 'FG 11/13/2022 12:47:23'!
processTransferWithdrawLeg: aTransferWithdrawLeg

	^'Salida por transferencia de ', aTransferWithdrawLeg value asString.! !

!AccountSummaryReport methodsFor: 'dd' stamp: 'FG 11/13/2022 12:47:10'!
processWithdraw: aWithdraw
	
	^'Extracción por ', aWithdraw value asString.! !


!classDefinition: #NetTransferReport category: 'ServiciosFinancieros-Parte2'!
Report subclass: #NetTransferReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!NetTransferReport methodsFor: 'initialization' stamp: 'FG 11/13/2022 12:53:14'!
initializeWith: anAccount

	result _ 0*peso.
	
	anAccount transactions do: [ :transaction |  
		result _ transaction processFor: self.
	].! !


!NetTransferReport methodsFor: 'dd' stamp: 'FG 11/13/2022 12:50:44'!
processDeposit: aDeposit
	
	^result.! !

!NetTransferReport methodsFor: 'dd' stamp: 'FG 11/13/2022 12:52:59'!
processTransferDepositLeg: aTransferDepositLeg

	^aTransferDepositLeg affectBalance: result.! !

!NetTransferReport methodsFor: 'dd' stamp: 'FG 11/13/2022 12:52:06'!
processTransferWithdrawLeg: aTransferWithdrawLeg

	^aTransferWithdrawLeg affectBalance: result.! !

!NetTransferReport methodsFor: 'dd' stamp: 'FG 11/13/2022 12:51:05'!
processWithdraw: aWithdraw
	
	^result.! !
