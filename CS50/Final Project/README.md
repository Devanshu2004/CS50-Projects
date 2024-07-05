# Sticker Wars

#### Video Demo: https://www.youtube.com/watch?v=AQXkNGJELhM&t=11s
#### Description:

In my Final Project I have created a video game called “Sticker Wars”, with the help of “Lua with Löve”. It is a 2 player
action game having a limitation of only two characters namely Player-1 and Player-2.

Its idea came to me from the game called "Urban Champion" which was on Nintendo and I used to play it a lot with my friend
when I was a kid but now as the modern online games have came I was not able to find it anywhere. So, I decided to make
one of my own, there was one more game on play store called "Blood and Glory" which is not available now, so I thought that
I could give the characters a theme of gladiators and it turned out to be fun.

But even before the idea of "Urban Champion" I wanted to make the game like "Assassin's Creed Java" which was on mobile
phone and I even made 5 different characters but I did not knew that how to make a platformer game. And that is one of the
reason that why is Player-1 wearing a cape and a hat looking a bit like an assassin.

For making the characters I used a website called “Universal LPC Spiritsheet Generator” and for creating the fighting
platform I used the software called “Tiled”. Actually I didn't knew that how animate the characters so I took screenshots
of different instances on my laptop in a rectangular form which looked hideous so I again took screenshots but this time I
took the outlines and looped those images of different instances for animating the players. And then I would loop those
instances in my project. They looked like some torn out stickers which I recalled from my childhood so I named my project
as "Sticker Wars".

Before this I had a different background which looked like a photograph of a village taken at the night time, and it did
not match those rectangular screenshots, so I changed the background to some kind of an office and it seemed pretty
promising that there could be stickers in an office.

I have tried to keep this game as simple as possible that is the reason why there is no home screen in my game. The keys
for actions of Player-1 are as follow:-
w = jump
a = move left
d = move right
s = attack

The keys for actions of Player-2 are as follow:-
i = jump
j = move left
l = move right
k = attack

Rules for the game are(is) simple that the first one to make the hit wins, so for increasing the difficulty I have allowed
the players to have infinite number of jumps even while being in air.

In my project I have a folder called 'map' which has the battle floor of my game; folder named 'Spirits' contains the
screenshots of all the instances of the players, the background image and the image of battle floor; 'sti' is an external
library enabling logic/physics to the game.

The file 'conf.lua' contains the configurations of the game window screen; 'main.lua' contains the main code which runs
on lua connecting the code of both the players; 'player.lua' contains the code necessary for making Player-1 similarly
'player2.lua' contains the code necessary for making Player-2; on clicking on 'run.bat' the game starts.

It took me about a week for making this game. For it I had to learn 'Lua with Löve' from 'You Tube' which took about nearly
2 days.