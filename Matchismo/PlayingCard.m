//
//  PlayingCard.m
//  CardGame
//
//  Created by Nelson Rivera on 5/19/16.
//  Copyright © 2016 Applaudo Studios. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

+ (NSArray *)validSuits
{
    return @[@"♣",@"♦",@"♥",@"♠"];
}

+ (NSArray *)rankStrings
{
    return @[@"?", @"A", @"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank
{
    return [[self rankStrings] count] - 1;
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

- (int) match:(NSArray *)otherCards {
    int score = 0;
    
    for (PlayingCard *otherCard in otherCards) {
        if (self.rank == otherCard.rank) {
            score += 4;
        }
        else if ([self.suit isEqualToString:otherCard.suit]){
            score += 1;
        }
    }
    
    return score;
}


@end
