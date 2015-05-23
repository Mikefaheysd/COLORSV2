//
//  highscore.m
//  COLORSV2
//
//  Created by Michael Fahey on 8/20/14.
//  Copyright (c) 2014 Michael Fahey. All rights reserved.
//

#import "highscore.h"

@implementation highscore
-(void) didMoveToView:(SKView *)view{
    if (!self.loaded){
        [self didload];
        self.loaded=YES;
    }
    return;
}

-(void) didload{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hideAd" object:nil]; 
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568||screenBounds.size.height==480) {
        _background = [SKSpriteNode spriteNodeWithImageNamed:@"color@2x.png"];
        [_background setName:@"background"];
        _background.size=self.frame.size;
        _background.position = (CGPoint) {self.frame.size.width*.5, self.frame.size.height*.5};
        [self addChild:_background];
    }else{
        _background = [SKSpriteNode spriteNodeWithImageNamed:@"coloripad@2x.png"];
        [_background setName:@"background"];
        _background.size=self.frame.size;
        _background.position = (CGPoint) {self.frame.size.width*.5, self.frame.size.height*.5};
        [self addChild:_background];
    }
    //easy
    easyhighscore = [[NSUserDefaults standardUserDefaults] integerForKey:@"easy highscore"];
    SKLabelNode *easy = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
    easy.name = @"easy";//how the node is identified later
    [easy setFontSize:self.frame.size.width*0.1];
    easy.text = [NSString stringWithFormat :@"EASY: %li",(long)easyhighscore];
    easy.position = CGPointMake(self.frame.size.width*.25, self.frame.size.height*0.75);
    easy.fontColor =  [UIColor blackColor];
    [self addChild:easy];
    //med
    medhighscore = [[NSUserDefaults standardUserDefaults] integerForKey:@"med highscore"];
    SKLabelNode *med = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
    med.name = @"med";//how the node is identified later
    [med setFontSize:self.frame.size.width*0.1];
    med.text = [NSString stringWithFormat :@"MEDIUM: %li",(long)medhighscore];
    med.position = CGPointMake(self.frame.size.width*.75, self.frame.size.height*0.75);
    med.fontColor =  [UIColor blackColor];
    [self addChild:med];
    //hard
    hardhighscore = [[NSUserDefaults standardUserDefaults] integerForKey:@"hard highscore"];
    SKLabelNode *hard = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
    hard.name = @"hard";//how the node is identified later
    [hard setFontSize:self.frame.size.width*0.1];
    hard.text = [NSString stringWithFormat :@"HARD: %li",(long)hardhighscore];
    hard.position = CGPointMake(self.frame.size.width*.25, self.frame.size.height*0.5);
    hard.fontColor =  [UIColor blackColor];
    [self addChild:hard];
    //stealth
    stealthhighscore = [[NSUserDefaults standardUserDefaults] integerForKey:@"stealth highscore"];
    SKLabelNode *stealth = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
    stealth.name = @"stealth";//how the node is identified later
    [stealth setFontSize:self.frame.size.width*0.1];
    stealth.text = [NSString stringWithFormat :@"STEALTH: %li",(long)stealthhighscore];
    stealth.position = CGPointMake(self.frame.size.width*.75, self.frame.size.height*0.5);
    stealth.fontColor =  [UIColor blackColor];
    [self addChild:stealth];
    //shuffle
    shufflehighscore = [[NSUserDefaults standardUserDefaults] integerForKey:@"shuffle highscore"];
    SKLabelNode *shuffle = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
    shuffle.name = @"shuffle";//how the node is identified later
    [shuffle setFontSize:self.frame.size.width*0.1];
    shuffle.text = [NSString stringWithFormat :@"SHUFFLE: %li",(long)shufflehighscore];
    shuffle.position = CGPointMake(self.frame.size.width*.25, self.frame.size.height*0.25);
    shuffle.fontColor =  [UIColor blackColor];
    [self addChild:shuffle];
    //classic
    classichighscore = [[NSUserDefaults standardUserDefaults] integerForKey:@"classic highscore"];
    SKLabelNode *classic = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
    classic.name = @"classic";//how the node is identified later
    [classic setFontSize:self.frame.size.width*0.1];
    classic.text = [NSString stringWithFormat :@"CLASSIC: %li",(long)classichighscore];
    classic.position = CGPointMake(self.frame.size.width*.75, self.frame.size.height*0.25);
    classic.fontColor =  [UIColor blackColor];
    [self addChild:classic];
    //total
    totalhighscore = easyhighscore + medhighscore + hardhighscore + stealthhighscore + shufflehighscore + classichighscore;
    SKLabelNode *total = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
    total.name = @"total";//how the node is identified later
    [total setFontSize:self.frame.size.width*0.1];
    total.text = [NSString stringWithFormat :@"TOTAL: %li",(long)totalhighscore];
    total.position = CGPointMake(self.frame.size.width*.5, self.frame.size.height*0.05);
    total.fontColor =  [UIColor blackColor];
    [self addChild:total];
    //add back button
    SKLabelNode *back = [SKLabelNode labelNodeWithFontNamed:@"Marker Felt"];
    back.name = @"backbutton";//how the node is identified later
    [back setFontSize:self.frame.size.width*0.10];
    back.text = @"BACK";
    back.position = CGPointMake(self.frame.size.width*.15, self.frame.size.height*0.9);
    back.fontColor =  [UIColor blackColor];
    [self addChild:back];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    if ([node.name isEqualToString:@"backbutton"]) {
        SKScene *myScene = [[TitleScene alloc] initWithSize:self.size];
        [self.view presentScene:myScene transition:NULL];
    }else{
        return;
    }
}
@end

