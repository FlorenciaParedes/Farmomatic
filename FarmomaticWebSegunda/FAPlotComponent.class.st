Class {
	#name : #FAPlotComponent,
	#superclass : #FAScreenComponentSegunda,
	#instVars : [
		'farm',
		'pots',
		'plot',
		'orderByType',
		'orderByDate',
		'type'
	],
	#category : #FarmomaticWebSegunda
}

{ #category : #'as yet unclassified' }
FAPlotComponent class >> withPlot: aPlot user: aUser farmomatic: aFarmomatic [
	^ self new withPlot: aPlot user: aUser farmomatic: aFarmomatic
]

{ #category : #initialization }
FAPlotComponent >> addEvent [

self call: (FAFormEvent withUser: user farmomatic: farmomatic  plot: plot)
]

{ #category : #initialization }
FAPlotComponent >> back [
self answer 
]

{ #category : #initialization }
FAPlotComponent >> dateAsceding [
]

{ #category : #initialization }
FAPlotComponent >> dateDesceding [
 true inform: 'descenso'
]

{ #category : #initialization }
FAPlotComponent >> initialize [ 
super initialize .

"table := FADataTableSegunda new"


]

{ #category : #initialization }
FAPlotComponent >> order: orderBy [

(orderBy match: '*type*') ifTrue: [ (orderBy match: '*descending*') ifTrue: [ self typeDesceding ] ifFalse: [ self typeAsceding ] ].
(orderBy match: '*date*') ifTrue: [ (orderBy match: '*descending*') ifTrue: [ self dateDesceding ] ifFalse: [ self dateAsceding ] ]
]

{ #category : #initialization }
FAPlotComponent >> renderComponent: html [
	| eventsList headerTable table |
	eventsList := plot events.
	headerTable := OrderedCollection new.
	headerTable
		add: 'Name';
		add: 'Date';
		add: 'Amount';
		add: 'Author';
		add: 'Select'.
	table := FADataTableSegunda
		withTitle: 'Eventos'
		headers: headerTable
		data: eventsList
		system: farmomatic
		user: user
		render: self.
	html break.
	html tbsButton
		class: 'addFarmButtom';
		with: [ html anchor
				callback: [ self addEvent ];
				with: 'ADD EVENT' ].
	html space.
	self backButton: html.	html paragraph: 'DATOS DEL PLOT: '.
	html paragraph: 'ID Numbre: ' , plot id.
	html paragraph: 'Description: ' , plot description.
	html
		paragraph: [ html text: 'Is Hothouse: '.
			html text: plot hothouse ].
	html break.
	html break.
	html break.
	table renderContentOn: html.
	html break.
	html break
]

{ #category : #initialization }
FAPlotComponent >> typeAsceding [
]

{ #category : #initialization }
FAPlotComponent >> typeDesceding [
]

{ #category : #initialization }
FAPlotComponent >> withPlot: aPlot user: aUser farmomatic: aFarmomatic [
	plot := aPlot .
	user :=aUser .
	farmomatic :=aFarmomatic .
]
