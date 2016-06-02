//
//  Card.h
//  CardGame
//
//  Created by Nelson Rivera on 5/19/16.
//  Copyright © 2016 Applaudo Studios. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
