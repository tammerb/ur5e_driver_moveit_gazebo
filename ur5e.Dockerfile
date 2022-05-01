FROM ros:melodic

LABEL   maintainer="Tammer Barkouki" \
        name="thbarkouki/ur5e_2f85"

SHELL ["/bin/bash", "-c"] 

WORKDIR /catkin_ws
RUN source /opt/ros/$ROS_DISTRO/setup.bash \
        && mkdir src

# clone the driver
RUN git clone https://github.com/UniversalRobots/Universal_Robots_ROS_Driver.git src/Universal_Robots_ROS_Driver \
        && git clone -b calibration_devel https://github.com/fmauch/universal_robot.git src/fmauch_universal_robot

# install depsand build
RUN source /opt/ros/$ROS_DISTRO/setup.bash \
        && apt update -qq \
        && rosdep update \
        && rosdep install --from-paths src --ignore-src -y \
        && catkin_make

# permanently setup environment
RUN echo -e "source /opt/ros/$ROS_DISTRO/setup.bash\nsource devel/setup.bash" > /root/.bashrc

# copy the calibration file into the container
COPY ur5e.rviz /catkin_ws/src/fmauch_universal_robot/ur5e_moveit_config

# Open three shells and run launch the following, in order for a SIM environment
# Later we'll CMD these to run immediately with a docker arguement
# roslaunch ur_gazebo ur5e_bringup.launch
# roslaunch ur5e_moveit_config ur5e_moveit_planning_execution.launch sim:=true
# roslaunch ur5e_moveit_config moveit_rviz.launch rviz_config:=/catkin_ws/src/fmauch_universal_robot/ur5e_moveit_config/launch/moveit.rviz