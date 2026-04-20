WORKDIR /ros2_ws

COPY src/ src/

RUN apt-get update && \
    rosdep update && \
    rosdep install --from-paths src --ignore-src -r -y

RUN . /opt/ros/humble/setup.sh && \
    colcon build --packages-select my_robot_pkg

RUN echo "source /ros2_ws/install/setup.bash" >> ~/.bashrc

CMD ["ros2", "run", "my_robot_pkg", "robot_node"]
