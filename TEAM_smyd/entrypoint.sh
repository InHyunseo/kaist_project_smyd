#!/usr/bin/env bash
set -euo pipefail

# ROS setup scripts may reference variables that are unset; avoid `set -u` failures while sourcing.
set +u
source /opt/ros/foxy/setup.bash
source /ws/install/setup.bash
set -u

export RMW_IMPLEMENTATION="${RMW_IMPLEMENTATION:-rmw_fastrtps_cpp}"
export ROS_LOCALHOST_ONLY=0

# This image is the per-CAV algorithm container for Problem 3 (pkg_p3) only.
# Other packages (pkg_p1_1, pkg_p1_2, pkg_p2) and the simulator are intentionally
# not built here; running them requires a different Dockerfile.
exec ros2 launch pkg_p3 competition.launch.py problem:=4
