//
//  MyScene.h
//  COLORSV2
//

//  Copyright (c) 2014 Michael Fahey. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <iAd/iAd.h>
#import "squares.h"
#import "TitleScene.h"

@interface MyScene : SKScene<ADBannerViewDelegate>{
    NSMutableArray *points;
    NSTimer* gameTimer;
    float timerLength;
}

@property (nonatomic, strong) NSMutableArray *sequence;
@property (nonatomic) BOOL userTurn;
@property (nonatomic) int userSeqStep;
@property (nonatomic) BOOL gameOver;
@property (nonatomic, strong) SKSpriteNode *background;
@end
