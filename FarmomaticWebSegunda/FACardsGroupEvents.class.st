Class {
	#name : #FACardsGroupEvents,
	#superclass : #FAScreenComponentSegunda,
	#instVars : [
		'events',
		'order',
		'date',
		'type'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #adding }
FACardsGroupEvents >> addList [
	self
		show: (FAListForm withUser: user farmomatic: farmomatic)

]

{ #category : #'as yet unclassified' }
FACardsGroupEvents >> determineFilter [
	date ifNotNil: [ events := farmomatic filterEventByDate: date ].
	type ifNotNil: [ events := farmomatic filterEventByType: type ].
]

{ #category : #'as yet unclassified' }
FACardsGroupEvents >> determineOrder [
	order
		ifNil: [ events := farmomatic events ]
		ifNotNil: [ order = 'Closest to oldest'
				ifTrue: [ events := farmomatic sortEventsByDateDec ].
			order = 'Oldest to closest'
				ifTrue: [ events := farmomatic sortEventsByDateAsc ].
			order = 'Ascending' 
				ifTrue: [ events := farmomatic sortEventsByTypeAsc ].
			order = 'Descending'
				ifTrue: [ events := farmomatic sortEventsByTypeDec ] ]
]

{ #category : #'as yet unclassified' }
FACardsGroupEvents >> lookEvents: html [
	self determineOrder.
	self determineFilter.

	events
		do: [ :elem | 
			html
				tbsColumn: [ html tbsThumbnail
						id: 'card';
						with: [ html break.
							html paragraph: elem type.
							html paragraph: 'author: '.
							html paragraph: elem author fullName.
							html paragraph: 'Creation date:'.
							html paragraph: elem creationDate.
							html anchor
								callback: [ self renderEvent: elem ];
								with: 'Ver Mas' ] ]
				mediumSize: 4 ]
]

{ #category : #accessing }
FACardsGroupEvents >> order: aOrder [
	order := aOrder.
]

{ #category : #'as yet unclassified' }
FACardsGroupEvents >> renderChooseOrder: html [
	| orderByDate orderByType |
	orderByType := OrderedCollection
		newFrom: #(' ' 'Descending' 'Ascending').
	orderByDate := OrderedCollection
		newFrom: #(' ' 'Closest to oldest' 'Oldest to closest').
	html
		form: [ html text: 'Order by Date '.
			html space.
			html select
				selected: orderByDate first;
				list: orderByDate;
				onChange: 'submit()';
				callback: [ :value | self order: value ] ].
	html space.
	html
		form: [ html text: 'Order by Type '.
			html space.
			html select
				selected: orderByType first;
				list: orderByType;
				onChange: 'submit()';
				callback: [ :value | self order: value ] ]
]

{ #category : #rendering }
FACardsGroupEvents >> renderComponent: html [

					html tbsButton
						class: 'addFarmButtom';
						with: [ html anchor
								callback: [ self back ];
								with: 'BACK' ].
html space.
	 html tbsButton
				class: 'addFarmButtom';
				with: [ html anchor
						callback: [ self addList ];
						with: 'ADD LIST' ].
html break.
html break.
			self renderChooseOrder: html.
			html space.
			self renderFilter: html.
			html horizontalRule.
			self lookEvents: html 
]

{ #category : #rendering }
FACardsGroupEvents >> renderEvent: elem [
	self
		show: (FAEventComponent
		withUser: user
		farmomatic: farmomatic
		event: elem)

]

{ #category : #rendering }
FACardsGroupEvents >> renderFilter: html [
	html
		form: [ html text: 'Filter by Date '.
			html dateInput callback: [ :value | date := value ].
			html submitButton text: 'Refresh' ].
	html space.
	html
		form: [ html text: 'Filter by type '.
			html select
				list: #('Aplication' 'Harvest' 'Problem' 'Plantation');
				callback: [ :value | type := value ].
			html submitButton text: 'Refresh' ]
]
