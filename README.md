# ur5e_driver_moveit_gazebo

This repo contains a Dockerfile (ur5e.Dockerfile) that builds MoveIt and Gazebo on top of ROS melodic with models and drivers of the Universal Robotics UR family of robots. To interact with Rviz/MoveIt, Gazebo, or any other graphical tools, you'll need to run the docker-compose file that starts both the image created from the ur5e.Dockerfile, and the noVNC client that displays a desktop environment in a broswer window.

The only dependencies are Docker and docker-compose. The image is on Dockerhub as `thbarkouki/ur5e`, so you don't need to build it ahead of time.

## Setup:
- Clone this repo, 
- `cd` into it,
- (optional: run `docker pull thbarkouki/ur5e` which will pull the latest image from Dockerhub)
- run `docker-compose up`.
- Navigate to <http://localhost:8080/vnc_auto.html> in your browser.

### Start ROS, Gazeob, and Rviz/MoveIt to Simulate the UR5e:
- `roslaunch ur_gazebo ur5e_bringup.launch`
- `roslaunch ur5e_moveit_config ur5e_moveit_planning_execution.launch sim:=true`
- `roslaunch ur5e_moveit_config moveit_rviz.launch rviz_config:=/catkin_ws/src/fmauch_universal_robot/ur5e_moveit_config/launch/moveit.rviz`
