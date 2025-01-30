FROM ros:humble
ARG USERNAME=$USERNAME
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG ROS_DISTRO=humble

# Delete user if it exists in container (e.g Ubuntu Noble: ubuntu)
RUN if id -u $USER_UID ; then userdel `id -un $USER_UID` ; fi

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3-pip

ENV SHELL /bin/bash

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME
CMD ["/bin/bash"]

RUN sudo apt-get update -y
RUN sudo apt-get install lsb-release curl gnupg -y
RUN sudo apt-get install rapidjson-dev -y
RUN sudo apt-get install libopencv-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-gl -y

RUN sudo apt-get install ros-$ROS_DISTRO-rviz2 -y
RUN sudo apt-get install ros-${ROS_DISTRO}-ros-gz -y

RUN sudo apt-get update -y
RUN sudo curl https://packages.osrfoundation.org/gazebo.gpg --output /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
RUN sudo apt-get update -y

RUN sudo apt-get install gz-garden -y
RUN sudo apt-get install libgz-sim8-dev -y

RUN sudo apt-get install python3-dev python3-opencv python3-wxgtk4.0 python3-pip python3-matplotlib python3-lxml python3-pygame -y
# RUN sudo -E pip install --user pexpect

RUN sudo apt-get install wget vim lsof -y

RUN sudo adduser $USER dialout; exit 0

