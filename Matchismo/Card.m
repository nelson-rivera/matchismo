//
//  Card.m
//  CardGame
//
//  Created by Nelson Rivera on 5/19/16.
//  Copyright © 2016 Applaudo Studios. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    for(Card *card in otherCards)
    {
        if([card.contents isEqualToString:self.contents])
        {
            score = 1;
        }
    }
    
    return score;
}


@end