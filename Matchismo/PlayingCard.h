//
//  PlayingCard.h
//  CardGame
//
//  Created by Nelson Rivera on 5/19/16.
//  Copyright © 2016 Applaudo Studios. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
