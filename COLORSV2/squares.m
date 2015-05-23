//
//  squares.m
//  COLORSV2
//
//  Created by Michael Fahey on 8/20/14.
//  Copyright (c) 2014 Michael Fahey. All rights reserved.
//

#import "squares.h"

@implementation squares
@synthesize positionBitMask;

-(id)initWithPosition:(int)position inSize:(CGSize)size
{
    if((self = [super init]))
    {
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        CGRect box;
        if(screenBounds.size.height == 568) {
            box = CGRectMake(0,0, 150, 150);
        }else if(screenBounds.size.height == 480) {
            box = CGRectMake(0,0, 150, 130);
        }else{
            box = CGRectMake(0,0, 350, 300);
        }
        self.path = [UIBezierPath bezierPathWithRect:box].CGPath;
        self.lineWidth = 1;
        self.glowWidth = 0.0;
        self.strokeColor = [UIColor blackColor];
        
        self.name = @"button";
        self.positionBitMask = 1 << position;
        if(sound == YES){
            noise[1]=@"soundtwo";
            noise[2]=@"soundfour";
            noise[4]=@"soundsix";
            noise[8]=@"soundfive";
            noise[16]=@"soundthree";
            noise[32]=@"soundone";
        }
    }
   
    return self;
}

@end
