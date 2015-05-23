//
//  TitleScene.h
//  COLORSV2
//
//  Created by Michael Fahey on 8/20/14.
//  Copyright (c) 2014 Michael Fahey. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "MyScene.h"
#import "settings.h"
#import "highscore.h"
#import "levelselect.h"

@interface TitleScene : SKScene

@property BOOL contentCreated;
@property (nonatomic, strong) SKSpriteNode *background;
@end

