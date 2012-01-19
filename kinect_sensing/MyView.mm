//
//  MyView.m
//  kinect_sensing
//
//  Created by Yinpeng Chen on 9/20/11.
//  Copyright 2011 Arizona State University. All rights reserved.
//

#import "MyView.h"
int shouldcopy = 0;
@implementation MyView

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(void) awakeFromNib {
    zNsBitmapImageRepObj = nil;
    rgbBuf = new Buffer24();
}
- (void) drawBuffer:(BaseBuf*) buf {
    if(shouldcopy==0){
        rgbBuf->copyBuffer(*buf);
        [self display];
    }
    shouldcopy++;
    if(shouldcopy==5) shouldcopy = 0;
}

- (void) drawRect:(NSRect) bounds {
    /*
    //if (zNsBitmapImageRepObj == nil ) 
     NSBitmapImageRep*   zNsBitmapImageRepObj = [[NSBitmapImageRep alloc] initWithFocusedViewRect:bounds];
	
	
	[NSGraphicsContext saveGraphicsState];
    
     NSUInteger	zRed	= round(255.0 * 0.0);
     NSUInteger	zGreen	= round(255.0 * 0.0);
     NSUInteger	zBlue	= round(255.0 * 1.0);
     
     NSUInteger zColourAry[3] = {zRed,zGreen,zBlue};
	for (int y = 0; y < 240; y++) {
        //	NSInteger x;
		for (int x = 0; x < 320; x++) {
			[zNsBitmapImageRepObj setPixel:zColourAry atX:x y:y];
		} // end for x
	} // end for y
    
    [zNsBitmapImageRepObj drawInRect:bounds];
	[NSGraphicsContext restoreGraphicsState];
     */
    if (zNsBitmapImageRepObj == nil ) 
        zNsBitmapImageRepObj = [[NSBitmapImageRep alloc] initWithFocusedViewRect:bounds];
	
	
	[NSGraphicsContext saveGraphicsState];
	for (int y = 0; y < 240; y++) {
		for (int x = 0; x < 320; x++) {
            char p[3];
            rgbBuf->getPixelAt(y*2, x*2, p);
            NSUInteger	zRed	= round(p[0]);
            NSUInteger	zGreen	= round(p[1]);
            NSUInteger	zBlue	= round(p[2]);
            
            NSUInteger zColourAry[3] = {zRed,zGreen,zBlue};
			[zNsBitmapImageRepObj setPixel:zColourAry atX:x y:y];
		} // end for x
	} // end for y
    
    [zNsBitmapImageRepObj drawInRect:bounds];
	[NSGraphicsContext restoreGraphicsState];
}
@end
