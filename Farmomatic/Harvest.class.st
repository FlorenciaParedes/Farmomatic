"
Pleasecomment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	kg:		<Object>
	variety:		<Object>


    Implementation Points
"
Class {
	#name : #Harvest,
	#superclass : #Event,
	#instVars : [
		'kg',
		'variety'
	],
	#category : #Farmomatic
}

{ #category : #'as yet unclassified' }
Harvest class >> withAuthor: aUser Comments: aComment kg: aKg variety: aVariety [
	^self new withAuthor: aUser
		Comments: aComment
		kg: aKg
		variety: aVariety.
]

{ #category : #'as yet unclassified' }
Harvest class >> withAuthor: aUser kg: aKg variety: aVariety [
	^ self new
		withAuthor: aUser
		kg: aKg
		variety: aVariety
]

{ #category : #constructor }
Harvest class >> withDate: adate Author: aUser Comments: aComment kg: aKg variety: aVariety [
	^self new withDate: adate
		Author: aUser
		Comments: aComment
		kg: aKg
		variety: aVariety.
]

{ #category : #'as yet unclassified' }
Harvest class >> withDate: adate Author: aUser kg: aKg variety: aVariety [
	^ self new
		withDate: adate
		Author: aUser
		kg: aKg
		variety: aVariety
]

{ #category : #'as yet unclassified' }
Harvest >> withAuthor: aUser Comments: aComment kg: aKg variety: aVariety [
	author := aUser.
	comments := aComment.
	kg := aKg.
	variety:= aVariety . 
]

{ #category : #'as yet unclassified' }
Harvest >> withAuthor: aUser kg: aKg variety: aVariety [
	
	author := aUser.
	kg := aKg.
	variety := aVariety
]

{ #category : #constructor }
Harvest >> withDate: aDate Author: aUser Comments: aComment kg: aKg variety: aVariety [
	self withDate: aDate Author: aUser Comments: aComment.
	kg := aKg.
	variety:= aVariety . 
]

{ #category : #'as yet unclassified' }
Harvest >> withDate: aDate Author: aUser kg: aKg variety: aVariety [
	date := aDate.
	author := aUser.
	kg := aKg.
	variety := aVariety
]