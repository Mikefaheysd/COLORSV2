//
//  shuffle.m
//  COLORSV2
//
//  Created by Michael Fahey on 8/21/14.
//  Copyright (c) 2014 Michael Fahey. All rights reserved.
//

#import "shuffle.h"

@implementation shuffle
@synthesize sequence, userTurn, userSeqStep, gameOver;
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /*Setup your scene here */
        [[NSNotificationCenter defaultCenter] postNotificationName:@"showAd" object:nil]; //Sends message to show ad.
        NSUserDefaults* defaults  = [NSUserDefaults standardUserDefaults];
        sound = [defaults boolForKey: K_SWITCH_KEY];
        tmp = [[NSUserDefaults standardUserDefaults] integerForKey:@"shuffle highscore"];
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        _background = [SKSpriteNode spriteNodeWithImageNamed:@"color@2x.png"];
        [_background setName:@"background"];
        _background.size=self.frame.size;
        _background.position = (CGPoint) {self.frame.size.width*.5, self.frame.size.height*.5};
        [self addChild:_background];
        timerLength=3.0;
        if (screenBounds.size.height == 568) {
            points = [NSMutableArray arrayWithObjects:
                      [NSValue valueWithCGPoint:CGPointMake(10, 40)],//bottom left
                      [NSValue valueWithCGPoint:CGPointMake(165, 40)],//bottom right
                      [NSValue valueWithCGPoint:CGPointMake(10, 195)],//mid left
                      [NSValue valueWithCGPoint:CGPointMake(165, 195)],//mid right
                      [NSValue valueWithCGPoint:CGPointMake(10, 350)],//top legt
                      [NSValue valueWithCGPoint:CGPointMake(165, 350)],//top right
                      nil];
            //adding the node to the scene
            NSUInteger count = [points count];
            for (NSUInteger i = 0; i < count; ++i) {
                NSInteger remainingCount = count - i;
                NSInteger exchangeIndex = i + arc4random_uniform(remainingCount);
                [points exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
            }
            for (int i=0; i<6; i++) {
                squares *button = [[squares alloc] initWithPosition:i inSize:size];
                NSValue *val = [points objectAtIndex:i];
                CGPoint p = [val CGPointValue];
                switch (i) {
                    case 0:
                        button.position = p;
                        button.fillColor  = [UIColor yellowColor];
                        button.strokeColor  = [UIColor yellowColor];
                        break;
                    case 1:
                        button.position = p;
                        button.fillColor  = [UIColor greenColor];
                        button.strokeColor  = [UIColor greenColor];
                        break;
                    case 2:
                        button.position = p;
                        button.fillColor  = [UIColor magentaColor];
                        button.strokeColor  = [UIColor magentaColor];
                        break;
                    case 3:
                        button.position = p;
                        button.fillColor  = [UIColor cyanColor];
                        button.strokeColor  = [UIColor cyanColor];
                        break;
                    case 4:
                        button.position = p;
                        button.fillColor  = [UIColor redColor];
                        button.strokeColor  = [UIColor redColor];
                        break;
                    case 5:
                        button.position = p;
                        button.fillColor  = [UIColor blueColor];
                        button.strokeColor  = [UIColor blueColor];
                        break;
                }
                NSLog(@"Adding button at: (%f,%f)", button.position.x, button.position.y);
                [self addChild:button];
                for(SKNode *node in self.children){
                    if([node.name isEqualToString:@"button"]){
                        SKAction *shrink = [SKAction customActionWithDuration:0.25 actionBlock:^(SKNode *node, CGFloat elapsedTime){
                            button.strokeColor=[UIColor blackColor];
                            button.glowWidth = 0;
                        }];
                        [button runAction:shrink];
                    }
                }
            }
            SKLabelNode *score = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
            [score setFontSize:self.frame.size.width*0.10];
            score.text = @"LEVEL: 0";
            score.position = CGPointMake(self.frame.size.width*.5, self.frame.size.height*0.0125);
            score.fontColor = [SKColor colorWithRed:0.23 green:0.56 blue:0.79 alpha:1.0];
            score.name = @"scoreLabel";
            [self addChild:score];
        }else if (screenBounds.size.height == 480){
            //3.5in screeen
            points = [NSMutableArray arrayWithObjects:
                      [NSValue valueWithCGPoint:CGPointMake(10, 30)],
                      [NSValue valueWithCGPoint:CGPointMake(165, 30)],
                      [NSValue valueWithCGPoint:CGPointMake(10, 165)],
                      [NSValue valueWithCGPoint:CGPointMake(165, 165)],
                      [NSValue valueWithCGPoint:CGPointMake(10, 300)],
                      [NSValue valueWithCGPoint:CGPointMake(165, 300)],
                      nil];
            //adding the node to the scene
            NSUInteger count = [points count];
            for (NSUInteger i = 0; i < count; ++i) {
                NSInteger remainingCount = count - i;
                NSInteger exchangeIndex = i + arc4random_uniform(remainingCount);
                [points exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
            }
            for (int i=0; i<6; i++) {
                squares *button = [[squares alloc] initWithPosition:i inSize:size];
                NSValue *val = [points objectAtIndex:i];
                CGPoint p = [val CGPointValue];
                switch (i) {
                    case 0:
                        button.position = p;
                        button.fillColor  = [UIColor yellowColor];
                        button.strokeColor  = [UIColor yellowColor];
                        break;
                    case 1:
                        button.position = p;
                        button.fillColor  = [UIColor greenColor];
                        button.strokeColor  = [UIColor greenColor];
                        break;
                    case 2:
                        button.position = p;
                        button.fillColor  = [UIColor magentaColor];
                        button.strokeColor  = [UIColor magentaColor];
                        break;
                    case 3:
                        button.position = p;
                        button.fillColor  = [UIColor cyanColor];
                        button.strokeColor  = [UIColor cyanColor];
                        break;
                    case 4:
                        button.position = p;
                        button.fillColor  = [UIColor redColor];
                        button.strokeColor  = [UIColor redColor];
                        break;
                    case 5:
                        button.position = p;
                        button.fillColor  = [UIColor blueColor];
                        button.strokeColor  = [UIColor blueColor];
                        break;
                }
                NSLog(@"Adding button at: (%f,%f)", button.position.x, button.position.y);
                [self addChild:button];
                for(SKNode *node in self.children){
                    if([node.name isEqualToString:@"button"]){
                        SKAction *shrink = [SKAction customActionWithDuration:0.25 actionBlock:^(SKNode *node, CGFloat elapsedTime){
                            button.strokeColor=[UIColor blackColor];
                            button.glowWidth = 0;
                        }];
                        [button runAction:shrink];
                    }
                }
            }
            SKLabelNode *score = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
            [score setFontSize:self.frame.size.width*0.08];
            score.text = @"LEVEL: 0";
            score.position = CGPointMake(self.frame.size.width*.5, self.frame.size.height*0.0125);
            score.fontColor = [SKColor colorWithRed:0.23 green:0.56 blue:0.79 alpha:1.0];
            score.name = @"scoreLabel";
            [self addChild:score];
        }else{
            points = [NSMutableArray arrayWithObjects:
                      [NSValue valueWithCGPoint:CGPointMake(30, 40)],
                      [NSValue valueWithCGPoint:CGPointMake(400, 40)],
                      [NSValue valueWithCGPoint:CGPointMake(30, 350)],
                      [NSValue valueWithCGPoint:CGPointMake(400, 350)],
                      [NSValue valueWithCGPoint:CGPointMake(30, 660)],
                      [NSValue valueWithCGPoint:CGPointMake(400, 660)],
                      nil];
            //adding the node to the scene
            NSUInteger count = [points count];
            for (NSUInteger i = 0; i < count; ++i) {
                NSInteger remainingCount = count - i;
                NSInteger exchangeIndex = i + arc4random_uniform(remainingCount);
                [points exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
            }
            for (int i=0; i<6; i++) {
                squares *button = [[squares alloc] initWithPosition:i inSize:size];
                NSValue *val = [points objectAtIndex:i];
                CGPoint p = [val CGPointValue];
                switch (i) {
                    case 0:
                        button.position = p;
                        button.fillColor  = [UIColor yellowColor];
                        button.strokeColor  = [UIColor blackColor];
                        break;
                    case 1:
                        button.position = p;
                        button.fillColor  = [UIColor greenColor];
                        button.strokeColor  = [UIColor blackColor];
                        break;
                    case 2:
                        button.position = p;
                        button.fillColor  = [UIColor magentaColor];
                        button.strokeColor  = [UIColor blackColor];
                        break;
                    case 3:
                        button.position = p;
                        button.fillColor  = [UIColor cyanColor];
                        button.strokeColor  = [UIColor blackColor];
                        break;
                    case 4:
                        button.position = p;
                        button.fillColor  = [UIColor redColor];
                        button.strokeColor  = [UIColor blackColor];
                        break;
                    case 5:
                        button.position = p;
                        button.fillColor  = [UIColor blueColor];
                        button.strokeColor  = [UIColor blackColor];
                        break;
                }
                NSLog(@"Adding button at: (%f,%f)", button.position.x, button.position.y);
                [self addChild:button];
                for(SKNode *node in self.children){
                    if([node.name isEqualToString:@"button"]){
                        SKAction *shrink = [SKAction customActionWithDuration:0.25 actionBlock:^(SKNode *node, CGFloat elapsedTime){
                            button.strokeColor=[UIColor blackColor];
                            button.glowWidth = 0;
                        }];
                        [button runAction:shrink];
                    }
                }
            }
            SKLabelNode *score = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
            [score setFontSize:self.frame.size.width*0.05];
            score.text = @"LEVEL: 0";
            score.position = CGPointMake(self.frame.size.width*.5, self.frame.size.height*0.0065);
            score.fontColor = [SKColor colorWithRed:0.23 green:0.56 blue:0.79 alpha:1.0];
            score.name = @"scoreLabel";
            [self addChild:score];
        }
        sequence = [NSMutableArray array];
        userTurn = NO;
        userSeqStep = 0;
        gameOver = NO;
        
    }
    return self;
}

-(void) didMoveToView:(SKView *)view{
    SKAction *wait = [SKAction waitForDuration:1.0];
    [self runAction:wait completion:^(void){
        [self continueSequence];
    }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    for (UITouch *touch in touches) {
        NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
        for(SKNode *node in nodes){
            if([node.name isEqualToString:@"button"]){
                squares *touchedCircle = (squares*)node;
                touchedCircle.glowWidth = touchedCircle.frame.size.width/16;
            }
        }
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    int touchesMask = 0;
    for (UITouch *touch in touches) {
        NSArray *nodes = [self nodesAtPoint:[touch locationInNode:self]];
        for(SKNode *node in nodes){
            if([node.name isEqualToString:@"button"]){
                squares *touchedCircle = (squares*)node;
                touchedCircle.glowWidth = 0.0;
                touchesMask = touchesMask | touchedCircle.positionBitMask;
            }
        }
    }
    if(userTurn == YES && gameOver != YES){
        if (touchesMask==0)
            return;
        if(userSeqStep < [sequence count]){
            NSNumber *nextNum = [sequence objectAtIndex:userSeqStep];
            int nextIntMask = [nextNum intValue];
            if(touchesMask != nextIntMask){
                gameOver = YES;
                [self endGameWithMessage:@"You touched the wrong color!"];
                return;
            }
            if(userSeqStep == [sequence count] - 1){
                //update the score
                SKLabelNode *scoreNode = (SKLabelNode*)[self childNodeWithName:@"scoreLabel"];
                [scoreNode setText:[NSString stringWithFormat:@"LEVEL: %lu", (unsigned long)[sequence count]]];
                //continue the sequence
                [self continueSequence];
            }else{
                userSeqStep++;
                [self rearrangeshapes];
                [gameTimer invalidate];
                gameTimer = [NSTimer scheduledTimerWithTimeInterval:timerLength target:self selector:@selector(timerFired:) userInfo:nil repeats:NO];
            }
        }
    }
}

-(void)continueSequence{
    userSeqStep = 0;
    userTurn = NO;
    [gameTimer invalidate];
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    int newSeq = arc4random_uniform(6);
    NSNumber *newSeqMask = [NSNumber numberWithInt:(1 << newSeq)];
    NSLog(@"Adding sequence mask %@", newSeqMask);
    [sequence addObject:newSeqMask];
    SKAction *wait = [SKAction waitForDuration:1.0];
    [self runAction:wait completion:^(void){
        [self nextInSequence:0];
    }];
    
}

-(void)nextInSequence:(NSInteger)seqNum{
    if(seqNum < [sequence count]){
        NSNumber *nextNum = [sequence objectAtIndex:seqNum];
        int nextSeqMask = [nextNum intValue];
        for(SKNode *node in self.children){
            if([node.name isEqualToString:@"button"]){
                squares *button = (squares*)node;
                if((button.positionBitMask & nextSeqMask) != 0){
                    if (sound == YES) {
                        NSString *beep = [[NSBundle mainBundle] pathForResource:noise[nextSeqMask] ofType:@"wav" ];
                        NSURL *fileurl = [[NSURL alloc] initFileURLWithPath:beep];
                        AudioServicesCreateSystemSoundID((__bridge CFURLRef)fileurl, &soundFileObject);
                        AudioServicesPlaySystemSound(soundFileObject);
                    }
                    SKAction *grow = [SKAction customActionWithDuration:0.25 actionBlock:^(SKNode *node, CGFloat elapsedTime){
                        button.strokeColor=[UIColor blackColor];
                        button.glowWidth = button.frame.size.width/16;
                    }];
                    SKAction *shrink = [SKAction customActionWithDuration:0.25 actionBlock:^(SKNode *node, CGFloat elapsedTime){
                        button.glowWidth = 0;
                    }];
                    
                    SKAction *growshrink = [SKAction sequence:@[grow, shrink]];
                    
                    [button runAction:growshrink completion:^(void){
                        [self nextInSequence:(seqNum + 1)];
                    }];
                }
            }
        }
    }else{
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        userTurn = YES;
        gameTimer = [NSTimer scheduledTimerWithTimeInterval:timerLength target:self selector:@selector(timerFired:) userInfo:nil repeats:NO];
    }
}

-(void)rearrangeshapes{
    NSUInteger count = [points count];
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform(remainingCount);
        [points exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
    int i=0;
    for(SKNode *node in self.children){
        if (![node.name isEqual:@"background"]) {
            squares *button = (squares*)node;
            if([node.name isEqual:@"button"]){
                NSValue *val = [points objectAtIndex:i];
                CGPoint p = [val CGPointValue];
                switch (i) {
                    case 0:
                        button.position = p;
                        break;
                    case 1:
                        button.position = p;
                        break;
                    case 2:
                        button.position = p;
                        break;
                    case 3:
                        button.position = p;
                        break;
                    case 4:
                        button.position = p;
                        break;
                    case 5:
                        button.position = p;
                        break;
                }
                SKAction *moveBottomLeft = [SKAction moveTo:button.position duration:.5];
                [button runAction:moveBottomLeft];
                i++;
            }
        }
    }
}

- (void)timerFired:(NSTimer*)theTimer {
    // If the timer fired and simon said, but the user didn’t touch, end // the gamm
    [self endGameWithMessage:@"Time's up!"];
    return;
}

// Call this method to end the game
-(void) endGameWithMessage:(NSString*) message {
    // Invalidate the timer
    [gameTimer invalidate];
    if (sequence.count-1 > tmp)
        [[NSUserDefaults standardUserDefaults] setInteger:sequence.count-1 forKey:@"shuffle highscore"];
    //Show an alert with the results
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over" message:message delegate:self cancelButtonTitle:@"EXIT"otherButtonTitles:@"TRY AGAIN", nil];
    [alert show];
}

// Alert view delegate method
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    //[gameTimer invalidate];
    // NSLog(@"in alert");
    timerLength = 2.0;
    if (buttonIndex == 0) {
        SKScene *myScene = [[TitleScene alloc] initWithSize:self.size];
        [self.view presentScene:myScene];
    }else{
        NSLog(@"Restarting game...");
        userTurn = NO;
        sequence = NULL;
        sequence = [NSMutableArray array];
        gameOver = NO;
        SKLabelNode *scoreNode = (SKLabelNode*)[self childNodeWithName:@"scoreLabel"];
        [scoreNode setText:[NSString stringWithFormat:@"LEVEL: %lu", (unsigned long)[sequence count]]];
        [self continueSequence];
    }
}
@end
