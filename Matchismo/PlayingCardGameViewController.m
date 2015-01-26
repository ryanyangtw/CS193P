//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Ryan on 2015/1/26.
//  Copyright (c) 2015年 Ryan. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end




@implementation PlayingCardGameViewController

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}


@end
