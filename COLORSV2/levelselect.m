//
//  levelselect.m
//  COLORSV2
//
//  Created by Michael Fahey on 8/20/14.
//  Copyright (c) 2014 Michael Fahey. All rights reserved.
//

#import "levelselect.h"


@implementation levelselect

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"hideAd" object:nil];
        NSUserDefaults* def  = [NSUserDefaults standardUserDefaults];
        switch1 = [[UISwitch alloc] initWithFrame:CGRectZero];
        switch1.on = [def boolForKey: K_SWITCH_KEY];
        if (switch1.on)
            sound = YES;
        else
            sound = NO;
        NSUserDefaults* defaults  = [NSUserDefaults standardUserDefaults];
        [defaults setBool: sound forKey: K_SWITCH_KEY];
        [defaults synchronize];
        easyhighscore = [[NSUserDefaults standardUserDefaults] integerForKey:@"easy highscore"];
        medhighscore = [[NSUserDefaults standardUserDefaults] integerForKey:@"med highscore"];
        hardhighscore = [[NSUserDefaults standardUserDefaults] integerForKey:@"hard highscore"];
        stealthhighscore = [[NSUserDefaults standardUserDefaults] integerForKey:@"stealth highscore"];
        shufflehighscore = [[NSUserDefaults standardUserDefaults] integerForKey:@"shuffle highscore"];
        classichighscore = [[NSUserDefaults standardUserDefaults] integerForKey:@"classic highscore"];
        totalhighscore=easyhighscore+medhighscore+hardhighscore+stealthhighscore+shufflehighscore;
        /*Setup your scene here */
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        _background = [SKSpriteNode spriteNodeWithImageNamed:@"color@2x.png"];
        [_background setName:@"background"];
        _background.size=self.frame.size;
        _background.position = (CGPoint) {self.frame.size.width*.5, self.frame.size.height*.5};
        [self addChild:_background];
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
            for (int i=0; i<6; i++) {
                squares *button = [[squares alloc] initWithPosition:i inSize:size];
                NSValue *val = [points objectAtIndex:i];
                CGPoint p = [val CGPointValue];
                switch (i) {
                    case 0:
                        button.position = p;
                        button.fillColor  = [UIColor cyanColor];
                        break;
                    case 1:
                        button.position = p;
                        button.fillColor  = [UIColor magentaColor];
                        break;
                    case 2:
                        button.position = p;
                        button.fillColor  = [UIColor yellowColor];
                        break;
                    case 3:
                        button.position = p;
                        button.fillColor  = [UIColor greenColor];
                        break;
                    case 4:
                        button.position = p;
                        button.fillColor  = [UIColor redColor];
                        break;
                    case 5:
                        button.position = p;
                        button.fillColor  = [UIColor blueColor];
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
                [self addToScene:0];
            }
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
            for (int i=0; i<6; i++) {
                squares *button = [[squares alloc] initWithPosition:i inSize:size];
                NSValue *val = [points objectAtIndex:i];
                CGPoint p = [val CGPointValue];
                switch (i) {
                    case 0:
                        button.position = p;
                        button.fillColor  = [UIColor cyanColor];
                        break;
                    case 1:
                        button.position = p;
                        button.fillColor  = [UIColor magentaColor];
                        break;
                    case 2:
                        button.position = p;
                        button.fillColor  = [UIColor yellowColor];
                        break;
                    case 3:
                        button.position = p;
                        button.fillColor  = [UIColor greenColor];
                        break;
                    case 4:
                        button.position = p;
                        button.fillColor  = [UIColor redColor];
                        break;
                    case 5:
                        button.position = p;
                        button.fillColor  = [UIColor blueColor];
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
                [self addToScene:1];
            }
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
            for (int i=0; i<6; i++) {
                squares *button = [[squares alloc] initWithPosition:i inSize:size];
                NSValue *val = [points objectAtIndex:i];
                CGPoint p = [val CGPointValue];
                switch (i) {
                    case 0:
                        button.position = p;
                        button.fillColor  = [UIColor cyanColor];
                        break;
                    case 1:
                        button.position = p;
                        button.fillColor  = [UIColor magentaColor];
                        break;
                    case 2:
                        button.position = p;
                        button.fillColor  = [UIColor yellowColor];
                        break;
                    case 3:
                        button.position = p;
                        button.fillColor  = [UIColor greenColor];
                        break;
                    case 4:
                        button.position = p;
                        button.fillColor  = [UIColor redColor];
                        break;
                    case 5:
                        button.position = p;
                        button.fillColor  = [UIColor blueColor];
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
                [self addToScene:2];
            }
        }
    }
    return self;
}

//handle touch events
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    if ([node.name isEqualToString:@"backbutton"]) {
        SKScene *myScene = [[TitleScene alloc] initWithSize:self.size];
        [self.view presentScene:myScene];
    }else if ([node.name isEqualToString:@"easy"]){
        SKScene *myScene = [[MyScene alloc] initWithSize:self.size];
        [self.view presentScene:myScene];
    }else if ([node.name isEqualToString:@"med"]){
        SKScene *myScene = [[medium alloc] initWithSize:self.size];
        [self.view presentScene:myScene];
    }else if ([node.name isEqualToString:@"hard"]){
        SKScene *myScene = [[hard alloc] initWithSize:self.size];
        [self.view presentScene:myScene];
    }else if ([node.name isEqualToString:@"stealth"]){
        if (easyhighscore<10 && medhighscore<10 && hardhighscore<10) {
            [self displaymessage:@"Reach level 10 on any difficulty to unlock"];
            return;
        }
       if (sound==NO) {
            [self soundoff:@"Sound must be turned on for this mode"];
           return;
       }else{
           SKScene *myScene = [[stealth alloc] initWithSize:self.size];
           [self.view presentScene:myScene];
       }
    }else if ([node.name isEqualToString:@"shuffle"]){
        if (hardhighscore<10) {
            [self displaymessage:@"Reach level 10 on hard difficulty to unlock"];
            return;
        }
        SKScene *myScene = [[shuffle alloc] initWithSize:self.size];
        [self.view presentScene:myScene];
    }else if ([node.name isEqualToString:@"classic"]){
        if (totalhighscore<50) {
            [self displaymessage:@"Reach a total level of 50 to unlock"];
            return;
        }
        SKScene *myScene = [[classic alloc] initWithSize:self.size];
        [self.view presentScene:myScene];
    }else{
        return;
    }
}

-(void)displaymessage:(NSString*) message{
    //Show an alert with the results
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"LEVEL LOCKED" message:message delegate:self cancelButtonTitle:@"OKAY"otherButtonTitles: nil];
    [alert show];
}

-(void)addToScene:(int) size{
    if (size==0) {
        SKLabelNode *score = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        [score setFontSize:self.frame.size.width*0.10];
        score.text = @"LEVEL SELECT";
        score.position = CGPointMake(self.frame.size.width*.5, self.frame.size.height*0.0125);
        score.fontColor =  [UIColor blackColor];
        score.name = @"scoreLabel";
        [self addChild:score];
        //add back
        SKLabelNode *back = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        back.name = @"backbutton";//how the node is identified later
        [back setFontSize:self.frame.size.width*0.10];
        back.text = @"BACK";
        back.position = CGPointMake(self.frame.size.width*.15, self.frame.size.height*0.9);
        back.fontColor =  [UIColor blackColor];
        [self addChild:back];
        
        //begin level creation
        //easy
        SKLabelNode *easy = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        easy.name = @"easy";//how the node is identified later
        [easy setFontSize:self.frame.size.width*0.10];
        easy.text = @"EASY";
        easy.position = CGPointMake(self.frame.size.width*.25, self.frame.size.height*0.73);
        easy.fontColor =  [UIColor yellowColor];
        easy.zPosition=1;
        [self addChild:easy];
        //med
        SKLabelNode *med = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        med.name = @"med";//how the node is identified later
        [med setFontSize:self.frame.size.width*0.10];
        med.text = @"MEDIUM";
        med.position = CGPointMake(self.frame.size.width*.75, self.frame.size.height*0.73);
        med.fontColor =  [UIColor cyanColor];
        med.zPosition=1;
        [self addChild:med];
        //hard
        SKLabelNode *hard = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        hard.name = @"hard";//how the node is identified later
        [hard setFontSize:self.frame.size.width*0.10];
        hard.text = @"HARD";
        hard.position = CGPointMake(self.frame.size.width*.25, self.frame.size.height*0.45);
        hard.fontColor =  [UIColor redColor];
        hard.zPosition=1;
        [self addChild:hard];
        //stealth
        SKLabelNode *stealth = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        stealth.name = @"stealth";//how the node is identified later
        [stealth setFontSize:self.frame.size.width*0.10];
        stealth.text = @"STEALTH";
        stealth.position = CGPointMake(self.frame.size.width*.75, self.frame.size.height*0.45);
        stealth.fontColor =  [UIColor magentaColor];
        stealth.zPosition=1;
        [self addChild:stealth];
        //shuffle
        SKLabelNode *shuffle = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        shuffle.name = @"shuffle";//how the node is identified later
        [shuffle setFontSize:self.frame.size.width*0.10];
        shuffle.text = @"SHUFFLE";
        shuffle.position = CGPointMake(self.frame.size.width*.25, self.frame.size.height*0.18);
        shuffle.fontColor =  [UIColor blueColor];
        shuffle.zPosition=1;
        [self addChild:shuffle];
        //clasic
        SKLabelNode *classic = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        classic.name = @"classic";//how the node is identified later
        [classic setFontSize:self.frame.size.width*0.10];
        classic.text = @"CLASSIC";
        classic.position = CGPointMake(self.frame.size.width*.75, self.frame.size.height*0.18);
        classic.fontColor =  [UIColor greenColor];
        classic.zPosition=1;
        [self addChild:classic];
    }else if (size==1){
        SKLabelNode *score = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        [score setFontSize:self.frame.size.width*0.08];
        score.text = @"LEVEL SELECT";
        score.position = CGPointMake(self.frame.size.width*.5, self.frame.size.height*0.0125);
        score.fontColor =  [UIColor blackColor];
        score.name = @"scoreLabel";
        [self addChild:score];
        //add back
        SKLabelNode *back = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        back.name = @"backbutton";//how the node is identified later
        [back setFontSize:self.frame.size.width*0.10];
        back.text = @"BACK";
        back.position = CGPointMake(self.frame.size.width*.15, self.frame.size.height*0.925);
        back.fontColor =  [UIColor blackColor];
        [self addChild:back];
        
        //begin level creation
        //easy
        SKLabelNode *easy = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        easy.name = @"easy";//how the node is identified later
        [easy setFontSize:self.frame.size.width*0.10];
        easy.text = @"EASY";
        easy.position = CGPointMake(self.frame.size.width*.25, self.frame.size.height*0.73);
        easy.fontColor =  [UIColor yellowColor];
        easy.zPosition=1;
        [self addChild:easy];
        //med
        SKLabelNode *med = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        med.name = @"med";//how the node is identified later
        [med setFontSize:self.frame.size.width*0.10];
        med.text = @"MEDIUM";
        med.position = CGPointMake(self.frame.size.width*.75, self.frame.size.height*0.73);
        med.fontColor =  [UIColor cyanColor];
        med.zPosition=1;
        [self addChild:med];
        //hard
        SKLabelNode *hard = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        hard.name = @"hard";//how the node is identified later
        [hard setFontSize:self.frame.size.width*0.10];
        hard.text = @"HARD";
        hard.position = CGPointMake(self.frame.size.width*.25, self.frame.size.height*0.45);
        hard.fontColor =  [UIColor redColor];
        hard.zPosition=1;
        [self addChild:hard];
        //stealth
        SKLabelNode *stealth = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        stealth.name = @"stealth";//how the node is identified later
        [stealth setFontSize:self.frame.size.width*0.10];
        stealth.text = @"STEALTH";
        stealth.position = CGPointMake(self.frame.size.width*.75, self.frame.size.height*0.45);
        stealth.fontColor =  [UIColor magentaColor];
        stealth.zPosition=1;
        [self addChild:stealth];
        //shuffle
        SKLabelNode *shuffle = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        shuffle.name = @"shuffle";//how the node is identified later
        [shuffle setFontSize:self.frame.size.width*0.10];
        shuffle.text = @"SHUFFLE";
        shuffle.position = CGPointMake(self.frame.size.width*.25, self.frame.size.height*0.18);
        shuffle.fontColor =  [UIColor blueColor];
        shuffle.zPosition=1;
        [self addChild:shuffle];
        //clasic
        SKLabelNode *classic = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        classic.name = @"classic";//how the node is identified later
        [classic setFontSize:self.frame.size.width*0.10];
        classic.text = @"CLASSIC";
        classic.position = CGPointMake(self.frame.size.width*.75, self.frame.size.height*0.18);
        classic.fontColor =  [UIColor greenColor];
        classic.zPosition=1;
        [self addChild:classic];
    }else{
        SKLabelNode *score = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        [score setFontSize:self.frame.size.width*0.05];
        score.text = @"LEVEL SELECT";
        score.position = CGPointMake(self.frame.size.width*.5, self.frame.size.height*0.0065);
        score.fontColor =  [UIColor blackColor];
        score.userInteractionEnabled= NO;
        score.name = @"scoreLabel";
        [self addChild:score];
        //add back
        SKLabelNode *back = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        back.name = @"backbutton";//how the node is identified later
        [back setFontSize:self.frame.size.width*0.08];
        back.text = @"BACK";
        back.position = CGPointMake(self.frame.size.width*.15, self.frame.size.height*0.95);
        back.fontColor =  [UIColor blackColor];
        [self addChild:back];
        
        //begin level creation
        //easy
        SKLabelNode *easy = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        easy.name = @"easy";//how the node is identified later
        [easy setFontSize:self.frame.size.width*0.10];
        easy.text = @"EASY";
        easy.position = CGPointMake(self.frame.size.width*.25, self.frame.size.height*0.75);
        easy.fontColor =  [UIColor yellowColor];
        easy.zPosition=1;
        [self addChild:easy];
        //med
        SKLabelNode *med = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        med.name = @"med";//how the node is identified later
        [med setFontSize:self.frame.size.width*0.10];
        med.text = @"MEDIUM";
        med.position = CGPointMake(self.frame.size.width*.75, self.frame.size.height*0.75);
        med.fontColor =  [UIColor cyanColor];
        med.zPosition=1;
        [self addChild:med];
        //hard
        SKLabelNode *hard = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        hard.name = @"hard";//how the node is identified later
        [hard setFontSize:self.frame.size.width*0.10];
        hard.text = @"HARD";
        hard.position = CGPointMake(self.frame.size.width*.25, self.frame.size.height*0.45);
        hard.fontColor =  [UIColor redColor];
        hard.zPosition=1;
        [self addChild:hard];
        //stealth
        SKLabelNode *stealth = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        stealth.name = @"stealth";//how the node is identified later
        [stealth setFontSize:self.frame.size.width*0.10];
        stealth.text = @"STEALTH";
        stealth.position = CGPointMake(self.frame.size.width*.75, self.frame.size.height*0.45);
        stealth.fontColor =  [UIColor magentaColor];
        stealth.zPosition=1;
        [self addChild:stealth];
        //shuffle
        SKLabelNode *shuffle = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        shuffle.name = @"shuffle";//how the node is identified later
        [shuffle setFontSize:self.frame.size.width*0.10];
        shuffle.text = @"SHUFFLE";
        shuffle.position = CGPointMake(self.frame.size.width*.25, self.frame.size.height*0.15);
        shuffle.fontColor =  [UIColor blueColor];
        shuffle.zPosition=1;
        [self addChild:shuffle];
        //clasic
        SKLabelNode *classic = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
        classic.name = @"classic";//how the node is identified later
        [classic setFontSize:self.frame.size.width*0.10];
        classic.text = @"CLASSIC";
        classic.position = CGPointMake(self.frame.size.width*.75, self.frame.size.height*0.15);
        classic.fontColor =  [UIColor greenColor];
        classic.zPosition=1;
        [self addChild:classic];
    }
    return;
}

-(void)soundoff:(NSString*) message{
    //Show an alert with the results
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SOUND OFF" message:message delegate:self cancelButtonTitle:@"NOT NOW"otherButtonTitles:@"ENABLE SOUND", nil];
    [alert show];
    
}

-(void)unlockable{
    [self displaymessage:@"Level locked"];
}

// Alert view delegate method
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1 ) {
        sound=YES;
        NSUserDefaults* defaults  = [NSUserDefaults standardUserDefaults];
        [defaults setBool: sound forKey: K_SWITCH_KEY];
        [defaults synchronize];
        SKScene *myScene = [[stealth alloc] initWithSize:self.size];
        [self.view presentScene:myScene];
    }
}
@end
