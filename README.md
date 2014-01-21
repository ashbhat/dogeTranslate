dogeTranslate
=============

Translate common english into Doge. The algorithm is implemented as an example case in Objective C. Ask questions via twitter to <a href="https://twitter.com/theashbhat"><strong>@theashbhat</strong></a>

Translated - very Translate wow common so english very into much Doge. such Algorithm very implemented as very example wow case in wow Objective C. Ask wow questions via such twitter to wow <a href="https://twitter.com/theashbhat"><strong>@theashbhat</strong></a>

Rough Overview Algorithm
--------
1. Create 2 objects that contain doge words and bad words

	doge words consists of <strong>much, such, wow, so, many</strong>

	bad words consists of any of the following 						
	<strong>it, he, they, we, us, me, him, her, has, have, are, is, was, were, be, become, became<strong>

2. Given a sentance in proper english, loop through the sentance for every word
		
		a. if the word matches the bad words list, remove the word (if for looping through an array, remember to remove 1 to the count)
		
		b. if the word has a "ly" or "ing" ending, remove the ending
		
		c. if a&b don't apply to the word, place a random word from the "doge words" list infront of the word (if for looping through an array, remember to add 1 to the count)


<img src="http://ashbhat.com/wp-content/uploads/2014/01/iOS-Simulator-Screen-shot-Jan-20-2014-7.48.34-PM.png" height="568" width="320">
