FROM ubuntu:18.04
RUN apt -y update && apt -y upgrade && apt-get -y remove x264 libx264-dev && \

## Install dependencies
apt-get -y install build-essential checkinstall cmake pkg-config yasm && \
apt-get -y install git gfortran && \
#RUN apt-get -y install libjpeg8-dev libjasper-dev libpng12-dev && \

apt-get -y install libtiff5-dev && \

apt-get -y install libtiff-dev && \

 apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev && \
 apt-get -y install libxine2-dev libv4l-dev && \
 cd /usr/include/linux && \
 ln -s -f ../libv4l1-videodev.h videodev.h && \
cd $cwd && \

#RUN apt-get -y install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
apt-get -y install libgtk2.0-dev libtbb-dev qt5-default && \
apt-get -y install libatlas-base-dev && \
apt-get -y install libmp3lame-dev libtheora-dev && \
apt-get -y install libvorbis-dev libxvidcore-dev libx264-dev && \
apt-get -y install libopencore-amrnb-dev libopencore-amrwb-dev && \
apt-get -y install libavresample-dev && \
apt-get -y install x264 v4l-utils && \

# Optional dependencies
apt-get -y install libprotobuf-dev protobuf-compiler && \
apt-get -y install libgoogle-glog-dev libgflags-dev && \
apt-get -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen && \
cd / && \
git clone https://github.com/opencv/opencv.git && ls /opencv -l

#RUN git checkout master

RUN mkdir /opencv/build && ls && \
 cd /opencv/build && cmake -D CMAKE_BUILD_TYPE=RELEASE \
            -D CMAKE_INSTALL_PREFIX=/usr/local \
            -D INSTALL_C_EXAMPLES=OFF \
            -D INSTALL_PYTHON_EXAMPLES=OFF \
            -D WITH_TBB=ON \
            -D WITH_V4L=ON \
        -D WITH_QT=OFF \
        -D WITH_OPENGL=ON \
		-DBUILD_opencv_java=OFF -DBUILD_opencv_python=OFF \
        .. && make && make install && rm -r /opencv && rm -rf /var/lib/apt/lists/ && mkdir /test
ADD CMakeLists.txt /test
ADD opencv.cpp /test

RUN apt -y update && apt-get install -y libtesseract-dev tesseract-ocr
ADD ocr.cpp /test