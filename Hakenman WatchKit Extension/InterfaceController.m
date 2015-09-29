//
//  InterfaceController.m
//  Hakenman WatchKit Extension
//
//  Created by lee jaeeun on 2015/09/15.
//  Copyright (c) 2015年 kjcode. All rights reserved.
//

#import "InterfaceController.h"
#import "MonthlyWorkTableRowController.h"

@interface InterfaceController()

@property (nonatomic, weak) IBOutlet WKInterfaceTable *monthlyWorkTable;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    [self loadTableData];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}


#pragma mark - table methods
- (void)loadTableData {
    
    NSArray *fruitNames = @[@"Apple", @"Orange", @"Banana"];
    
    [_monthlyWorkTable setNumberOfRows:fruitNames.count withRowType:@"MonthlyTableRow"];
    
    [fruitNames enumerateObjectsUsingBlock:^(NSString *name, NSUInteger idx, BOOL *stop) {
        
        MonthlyWorkTableRowController *row = [_monthlyWorkTable rowControllerAtIndex:idx];
        
        [row.workDayTitleLabel setText:name];
        [row.workTimeTitleLabel setText:[NSString stringWithFormat:@"%d", (int)idx]];
        
    }];
}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    NSLog(@"%s", __FUNCTION__);
    
    [self pushControllerWithName:@"DetailInterfaceController" context:nil];
}

@end



