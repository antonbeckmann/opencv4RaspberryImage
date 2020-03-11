#include "opencv2/opencv.hpp"
#include <stdio.h>
using namespace cv;
int main(int argc, char** argv)
{
    VideoCapture cap,cap2;
    
// open the default camera, use something different from 0 otherwise;
    // Check VideoCapture documentation.
    if(!cap.open(0))
        return 1;
    if(!cap2.open(1))
        return 2;
    
    Mat frame, frame2;
    cap >> frame;
    cap2 >> frame2;

    if( frame.empty() || frame2.empty())
	return 3;
        
    imwrite("Image_right.jpg", frame);
    imwrite("Image_left.jpg",frame2);
    // the camera will be closed automatically upon exit
    //cap.close();
    return 0;
}
