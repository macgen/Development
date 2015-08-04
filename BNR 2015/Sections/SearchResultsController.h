//
//  SearchResultsController.h
//  Sections
//
//  Created by James Kim on 7/31/15.
//  Copyright © 2015 James. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultsController : UITableViewController <UISearchResultsUpdating>

- (instancetype) initWithNames: (NSDictionary *) names keys:(NSArray *) keys;

@end
