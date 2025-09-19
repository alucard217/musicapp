## musicapp

This application allows you to listen to music from Jamento streaming service. 

# Architecture: 
I used bloc over different state managements since it seemed more logical and extendable for me.
I implemented bloc for Search Bar since it had 2 states and for MusicList with Loading and everything there.

# Functionalities:
* Find popular tracks - Called automatically when music list initialized
* Find track by name - There is a search bar looking like a snow flake which is when clicked turns into a searching bar
* Listen to music - Each music tile is done that when clicked starts playing automatically

# UI:
There is a backround widget that consists of different widgets: SnowFigure, gradient, silhouettes.
SnowFigure is basically a container that is done with snow styling, shadowing and has sinusoidal movement with a custom animation.
When the application is initialized it creates multiple snowflakes in different positions, sizes and speeds in order to create "chaotic" movement.
There is a background gradient too :)
All the buttons, forms and different UIs are created using custom widgets in order to follow the style of the application.

# Inspiration
I wanted an application that gives cool vibes while listening to music. Mostly got inspired from TikTok tho. People
were listening to music with some viby gradient background, something flies like a snow or particles and I wanted to create something like
that by myself. This is not the last version of the project cuz I'm willing to add more features to this application. Stay safe yo

![Homepage] (lib/Screenshots/ss1.png)
![Searching] (lib/Screenshots/ss2.png)



