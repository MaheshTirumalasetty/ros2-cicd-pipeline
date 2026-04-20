FROM ros:humble-ros-base

WORKDIR /ros2_ws

COPY src/ src/

RUN apt-get update -q && \
    rosdep update && \
    rosdep install --from-paths src --ignore-src -r -y --rosdistro humble

RUN /bin/bash -c ". /opt/ros/humble/setup.bash && \
    colcon build --packages-select my_robot_pkg"

RUN echo "source /ros2_ws/install/setup.bash" >> /ros_entrypoint.sh

ENTRYPOINT ["/bin/bash", "-c", "source /opt/ros/humble/setup.bash && source /ros2_ws/install/setup.bash && ros2 run my_robot_pkg robot_node"]