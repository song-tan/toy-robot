Toy Robot Simulator
===================
Description:

. The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.

. There are no other obstructions on the table surface.

. The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movementthat would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

## Start Simulator
``` bash
$ cd toy_robot
$ bundle install
$ ruby play.rb
# ruby versions >= 2.6.5
```
## Requirement

Ruby Version 2.6.5
bundler Version 2.1.4

## Run Test
``` bash
$ cd toy_robot
$ bundle exec rspec
```
## Example
``` bash
$ ruby play.rb
Game start!
Please enter command:
place 1,3,NORTH
move
move
right
move
report
2,4,EAST
move
move
move
left
move
report
4,4,NORTH
game over
Command not exist!
exit
Game over!
```
## Commands
* PLACE X,Y,Direction
  will put the toy robot on the table in position X,Y and facing NORT=
H, SOUTH, EAST or WEST.

* By Default, the origin (0,0) can be considered to be the SOUTH WEST most corner without PLACE command.

* Right
  Robot turns 90 degree to the right.

* Left 
  Robot turns 90 degree to the left.

* MOVE 
  will move the toy robot one unit forward in the direction it is currently facing. A robot that is on the table can choose to ignore the MOVE when it is on the eage of the table.

* REPORT 
  will announce the X,Y and orientation of the robot.

