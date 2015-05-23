//
//  squares.h
//  COLORSV2
//
//  Created by Michael Fahey on 8/20/14.
//  Copyright (c) 2014 Michael Fahey. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#define K_SWITCH_KEY @"switch_key"
int difficulty;
long tmp;
bool sound;
UISwitch *switch1;
NSString *difficult;
NSInteger easyhighscore;
NSInteger medhighscore;
NSInteger hardhighscore;
NSInteger stealthhighscore;
NSInteger shufflehighscore;
NSInteger classichighscore;
NSInteger totalhighscore;
NSString *noise[33];
SystemSoundID soundFileObject;
@interface squares : SKShapeNode{

}
@property (nonatomic) int positionBitMask;

-(id)initWithPosition:(int)position inSize:(CGSize)size;

@end
