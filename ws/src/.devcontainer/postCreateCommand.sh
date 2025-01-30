#!/usr/bin/env bash

# sudo rosdep update && sudo rosdep install --from-paths ../src --ignore-src -y &&

export PATH=$PATH:/home/madnad/.local/bin
echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc

python3 -m pip install PyYAML mavproxy --user

/home/ws/ardupilot/Tools/environment_install/install-prereqs-ubuntu.sh -y
. ~/.profile

export PATH=$PATH:/home/ws/src/ardupilot/Tools/autotest
echo 'export PATH="$PATH:$HOME/src/ardupilot/Tools/autotest"' >> ~/.bashrc
export PATH=/usr/lib/ccache:$PATH
echo 'export PATH="/usr/lib/ccache:$PATH"' >> ~/.bashrc
. ~/.bashrc

pip3 install --user kconfiglib
pip3 install --user jinja2
pip3 install --user jsonschema
pip3 install --user pyros-genmsg
pip3 install --user future

echo 'export GZ_VERSION=harmonic' >> ~/.bashrc
# export GZ_SIM_RESOURCE_PATH=/home/ws/gz_ws/src/ardupilot_gazebo/models:/home/ws/gz_ws/src/ardupilot_gazebo/worlds:$GZ_SIM_RESOURCE_PATH
echo 'export GZ_SIM_RESOURCE_PATH="/home/ws/gz_ws/src/ardupilot_gazebo/models:/home/ws/gz_ws/src/ardupilot_gazebo/worlds:$GZ_SIM_RESOURCE_PATH"' >> ~/.bashrc
# export GZ_SIM_SYSTEM_PLUGIN_PATH=/home/ws/gz_ws/src/ardupilot_gazebo/build:$GZ_SIM_SYSTEM_PLUGIN_PATH
echo 'export GZ_SIM_SYSTEM_PLUGIN_PATH="/home/ws/gz_ws/src/ardupilot_gazebo/build:$GZ_SIM_SYSTEM_PLUGIN_PATH"' >> ~/.bashrc
. ~/.bashrc

