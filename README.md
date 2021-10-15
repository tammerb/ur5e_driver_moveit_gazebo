# ur5e_driver_moveit_gazebo

This repo contains a Dockerfile that builds MoveIt and Gazebo on top of ROS melodic with models of the Universal Robotics UR family of robots. It includes the drivers to work with the physical robot, and all the files to perform Gazebo simulation. It also includes an Rviz config file to make it easy to operate the robot in MoveIt.

The only dependencies are Docker and docker-compose.

- Clone this repo, 
- `cd` into it,
- and run `docker-compose up`.
- Navigate to <http://localhost:8080/vnc_auto.html> in your browser.
- The roslaunch commands are at the bottom of the ur5e.Dockerfile as comments.
