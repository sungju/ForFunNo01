//
//  MyScene.m
//  ForFunNo01
//
//  Created by Sungju Kwon on 22/10/13.
//  Copyright (c) 2013 Sungju Kwon. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Fun Ball Rolling";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
        
        self.scaleMode = SKSceneScaleModeAspectFill;
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        [self addBall];
    }
    return self;
}

- (void)addBall
{
    SKSpriteNode *ball = [SKSpriteNode spriteNodeWithImageNamed:@"ball"];
    ball.position = CGPointMake(self.frame.size.width / 4 + arc4random() % ((int)self.frame.size.width/ 2),
                                self.frame.size.height / 2 + arc4random() % ((int)self.frame.size.height / 2));
    ball.xScale = 0.2;
    ball.yScale = 0.2;
    ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.size.width / 2];
    
    SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
    [ball runAction:[SKAction repeatActionForever:action]];
    [self addChild:ball];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    /*
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"ball"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
     */
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
