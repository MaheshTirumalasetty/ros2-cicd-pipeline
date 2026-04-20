FROM ros:humble-ros-base

WORKDIR /ros2_ws

COPY src/ src/

RUN apt-get update -q && \
    rosdep update && \
    rosdep install --from-paths src --ignore-src -r -y --rosdistro humble

RUN /bin/bash -c ". /opt/ros/humble/setup.bash && \
    colcon build --packages-select my_robot_pkg"

CMD ["/bin/bash", "-c", "source /opt/ros/humble/setup.bash && \
    source /ros2_ws/install/setup.bash && \
    source /ros2_ws/install/my_robot_pkg/share/my_robot_pkg/package.bash && \
    /ros2_ws/install/my_robot_pkg/bin/robot_node"]