# FROM nvidia/ros2:humble
# FROM ubuntu:22.04 
FROM ros:humble 

# Make all the commands noninteractive
ARG DEBIAN_FRONTEND=noninteractive


# Install standard packages for development
RUN echo "\n\n Installing the standard linux tools \n\n" && \
    apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    git-lfs \
    ripgrep \
    fd-find \
    python3-pip \
    python3-vcstool \
    udev && \
    rm -rf /var/lib/apt/lists/*

# ENV KINISI_WORKSPACE=/opt/ros/kinisi/src
# ENV ROS_FOLDER=${KINISI_WORKSPACE}/ros

# # Install external ROS2 packages
# RUN vcs import src/third_party < dependencies.repos --recursive

# # Install the python packages
# WORKDIR ${ROS_FOLDER}

# #install isaac sim in an earlier layer to reduce need to reinstall other python deps
# ENV OMNI_KIT_ACCEPT_EULA=YES
# RUN pip3 install -r isaac_requirements.txt

# RUN pip3 install -r requirements.txt \
#     && pip uninstall -y setuptools_scm


# # Install all the dependencies and build them
# WORKDIR ${KINISI_WORKSPACE}
# RUN apt-get update && \
#     rm -r /etc/ros/rosdep/sources.list.d/20-default.list \
#     && rosdep init \
#     && rosdep update \
#     && rosdep install --ignore-src --from-paths . -y && \
#     rm -rf /var/lib/apt/lists/*

# # Compile the external packages
# RUN rm -rf ros && cd .. \
#    && . /opt/ros/humble/setup.sh \
#    && export TORCH_CUDA_ARCH_LIST="8.6" \
#    && colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF
