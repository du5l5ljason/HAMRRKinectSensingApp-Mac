//
//  MyView.h
//  kinect_sensing
//
//  Created by Yinpeng Chen on 9/20/11.
//  Copyright 2011 Arizona State University. All rights reserved.
//

#import <AppKit/AppKit.h>
#include "Buffer.h"

@interface MyView : NSView {
    NSBitmapImageRep *zNsBitmapImageRepObj;
    BaseBuf* rgbBuf;
}

- (void) drawBuffer:(BaseBuf*) buf;
@end
