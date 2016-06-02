//
//  PlayingCardViewController.m
//  Matchismo
//
//  Created by Nelson Rivera on 5/25/16.
//  Copyright © 2016 Applaudo Studios. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingDeck.h"

@implementation PlayingCardViewController

- (Deck *)createDeck {
    return [[PlayingDeck alloc] init];
}

@end
