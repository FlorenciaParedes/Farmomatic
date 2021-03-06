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
		'variety'
	],
	#category : #Farmomatic
}

{ #category : #'as yet unclassified' }
Harvest class >> withAuthor: aUser Comments: aComment kg: aKg variety: aVariety [
	^ self new withAuthor: aUser
		Comments: aComment
		kg: aKg
		variety: aVariety.
]

{ #category : #forTesting }
Harvest >> amount [ 
^amount
]

{ #category : #forTesting }
Harvest >> getPredefined [ 
 ^ variety 
]

{ #category : #forTesting }
Harvest >> theme: themeOfTheNews [
	^ variety applied: themeOfTheNews 
]

{ #category : #forTesting }
Harvest >> withAuthor: aUser Comments: aComment kg: aKg variety: aVariety [
	self withAuthor: aUser Comments: aComment.
	amount := aKg.
	variety:= aVariety . 

]
