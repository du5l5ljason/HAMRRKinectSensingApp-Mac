//
//  MyController.m
//  kinect_sensing
//
//  Created by Yinpeng Chen on 9/20/11.
//  Copyright 2011 Arizona State University. All rights reserved.
//

#import "MyController.h"
#include "KinectSensor.h"
#include "MyView.h"
KinectOpenNI kinect;

@implementation MyController

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)kinectThread {
    while(1) {
        kinect.update();
        [rgbView drawBuffer:kinect.getRGBImg()];
        //do your processing
        // kinect.getRGBImg();
        // kinect.getDepthImg();
        
    }
}
- (void)awakeFromNib {
    kinect.init();
    kinect.open();
   [NSThread detachNewThreadSelector:@selector(kinectThread) toTarget:self withObject:nil];
}
@end
