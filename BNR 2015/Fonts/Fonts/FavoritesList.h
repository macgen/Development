//
//  FavoritesList.h
//  Fonts
//
//  Created by James Kim on 8/5/15.
//  Copyright © 2015 James. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavoritesList : NSObject

+ (instancetype) sharedFavoriteList;

- (NSArray *) favorites;

- (void) addFavorites: (id) item;
- (void) removeFavorites: (id) item;

- (void) moveItemAtIndex: (NSInteger)from toIndex:(NSInteger)to;

@end
