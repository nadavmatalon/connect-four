#Connect Four

## Table of Contents

* [Screenshot](#screenshot)
* [General Description](#general-description)
* [Functional Description](#functional-description)
* [See it Live on Heroku](#see-it-live-on-heroku)
* [Browsers](#browsers)
* [Testing](#testing)
* [License](#license)


##Screenshot

<div width="400px" >
	<a href="https://raw.githubusercontent.com/nadavmatalon/connect-four/master/public/images/connect-four-screenshot.png">
		<img src="/public/images/connect-four-screenshot.png" width="600" height="420px" />
	</a>
</div>


##General Description

The app consists of the game of __Connect Four__ written in 
[Ruby](https://www.ruby-lang.org/en/) &amp; 
[JavaScript](http://en.wikipedia.org/wiki/JavaScript) 
according to [TDD](http://en.wikipedia.org/wiki/Test-driven_development) 
(testing with [Rspec](http://rspec.info/) &amp; 
[Capybara](https://github.com/jnicklas/capybara)).

Here's a brief description of the game:

>__Connect Four__ is a two-player connection game in which the players 
>take turns dropping colored discs from the top into a seven-column, 
>six-row vertically suspended grid. The pieces fall straight down, 
>occupying the next available space within the column. The objective of 
>the game is to connect four of one's own discs of the same color next 
>to each other vertically, horizontally, or diagonally before your opponent. 

(Source: [Wikipedia on Connect Four](http://en.wikipedia.org/wiki/Connect_Four))


##Functional Description

* To start the game, click on the 'New Game' button.
* The starting color ('Black' or 'Red') is chosen randomly by the app.
* To play, click on one of the colored discs above the grid.
* The app dynamically checks if 4 discs of the same color have been connected 
  either vertiacally, horizontally or diagonally.
* The winner is the player who succeeded in connecting most sequences of four.

##See it Live on Heroku

A live version of the game can be found (and played!) at:

[Connect Four on Heroku](http://makers-connect-four.herokuapp.com/)

As I'm using Heroku's free hosting service, the app may take a bit of time to upload<br/>
(Heroku's giros take time to wake up...), so please be patient.


##Browsers

For the best user experience, please use:

* __Apple Safari__ (7.0.5)

The app has been tested with and supports the following browsers:

* __Google Chrome__ (36.0)
* __Mozilla Firefox__ (31.0)


##Testing

Tests were written with [Rspec](http://rspec.info/) (3.0.4) 
&amp; [Capybara](https://github.com/jnicklas/capybara) (2.4.1).

To run the tests in terminal: 

```bash
$> cd connect-four
$> rspec
```


##License

<p>Released under the <a href="http://www.opensource.org/licenses/MIT">MIT license</a>.</p>


