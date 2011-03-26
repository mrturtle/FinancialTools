//
//  FinancialToolsAppDelegate.h
//  FinancialTools
//
//  Created by Evan Lucas on 3/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FinancialToolsAppDelegate : NSObject <NSApplicationDelegate> {

    NSWindow *window;
    NSTextField *textN;
    NSTextField *textIY;
    NSTextField *textPV;
    NSTextField *textPMT;
    NSTextField *textFV;
    NSTableView *amortizationTable;
    NSButton *checkBoxIYAsPercentage;
    NSButton *checkBoxNAsYears;
    NSMutableArray *mArrayAmortizationTable;
    NSUInteger decimalN;
    NSDecimalNumber *decimalIY;
    NSDecimalNumber *decimalPV;
    NSDecimalNumber *decimalPMT;
    NSDecimalNumber *decimalFV;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) IBOutlet NSTextField *textN;
@property (nonatomic, retain) IBOutlet NSTextField *textIY;
@property (nonatomic, retain) IBOutlet NSTextField *textPV;
@property (nonatomic, retain) IBOutlet NSTextField *textPMT;
@property (nonatomic, retain) IBOutlet NSTextField *textFV;
@property (nonatomic, retain) IBOutlet NSTableView *amortizationTable;
@property (nonatomic, retain) IBOutlet NSButton *checkBoxIYAsPercentage;
@property (nonatomic, retain) IBOutlet NSButton *checkBoxNAsYears;
@property (nonatomic, retain) NSMutableArray *mArrayAmortizationTable;
@property (nonatomic) NSUInteger decimalN;
@property (nonatomic, retain) NSDecimalNumber *decimalIY;
@property (nonatomic, retain) NSDecimalNumber *decimalPV;
@property (nonatomic, retain) NSDecimalNumber *decimalPMT;
@property (nonatomic, retain) NSDecimalNumber *decimalFV;
- (IBAction)calculatePayment:(id)sender;
- (IBAction)exportDataFromTable:(id)sender;
- (IBAction)clearAllData:(id)sender;

@end
