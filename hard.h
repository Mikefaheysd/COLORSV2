//
//  hard.h
//  COLORSV2
//
//  Created by Michael Fahey on 8/21/14.
//  Copyright (c) 2014 Michael Fahey. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "squares.h"
#import "TitleScene.h"

@interface hard : SKScene{
    NSMutableArray *points;
    NSTimer* gameTimer;
    float timerLength;
}

-(void)continueSequence;
-(void)nextInSequence:(NSInteger)seqNum;
-(void)rearrangeshapes;
@property (nonatomic, strong) NSMutableArray *sequence;
@property (nonatomic) BOOL userTurn;
@property (nonatomic) int userSeqStep;
@property (nonatomic) BOOL gameOver;
@property (nonatomic, strong) SKSpriteNode *background;
@end
