//
//  levelselect.h
//  COLORSV2
//
//  Created by Michael Fahey on 8/20/14.
//  Copyright (c) 2014 Michael Fahey. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "squares.h"
#import "TitleScene.h"
#import "MyScene.h"
#import "medium.h"
#import "hard.h"
#import "stealth.h"
#import "shuffle.h"
#import "classic.h"
@import SpriteKit;

@interface levelselect : SKScene{
    NSMutableArray *points;
}
@property (nonatomic, strong) SKSpriteNode *background;
@end

