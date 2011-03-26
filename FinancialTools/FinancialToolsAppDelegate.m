//
//  FinancialToolsAppDelegate.m
//  FinancialTools
//
//  Created by Evan Lucas on 3/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FinancialToolsAppDelegate.h"

@implementation FinancialToolsAppDelegate

@synthesize window, textN, textFV, textIY, textPV, textPMT, amortizationTable, checkBoxNAsYears, checkBoxIYAsPercentage, mArrayAmortizationTable;
@synthesize decimalN, decimalFV, decimalIY, decimalPV, decimalPMT;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
}

- (IBAction)calculatePayment:(id)sender {
    if ([checkBoxNAsYears state] == NSOnState) {
        decimalN = ([textN integerValue] * 12);
    } else {
        decimalN = [textN integerValue];
    }
    mArrayAmortizationTable = [[NSMutableArray alloc] init];
    if ([checkBoxIYAsPercentage state] == NSOnState) {
        decimalIY = [[NSDecimalNumber decimalNumberWithString:[textIY stringValue]] decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithString:@"100"]];
    } else {
        decimalIY = [NSDecimalNumber decimalNumberWithString:[textIY stringValue]];
    }
    decimalPV = [NSDecimalNumber decimalNumberWithString:[textPV stringValue]];
    NSDecimalNumber *decimalR = [decimalIY decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithString:@"12"]];
    NSDecimalNumber *decimalOnePlusRToTheN = [[[NSDecimalNumber decimalNumberWithString:@"1"] decimalNumberByAdding:decimalR] decimalNumberByRaisingToPower:decimalN];
    NSDecimalNumber *numerator = [decimalR decimalNumberByMultiplyingBy:decimalOnePlusRToTheN];
    NSDecimalNumber *denominator = [decimalOnePlusRToTheN decimalNumberBySubtracting:[NSDecimalNumber decimalNumberWithString:@"1"]];
    NSDecimalNumber *full = [numerator decimalNumberByDividingBy:denominator];
    NSDecimalNumber *decimalPayment = [decimalPV decimalNumberByMultiplyingBy:full];
    NSDecimalNumber *decimalBeginningBalance;
    NSDecimalNumber *decimalPrincipal;
    NSDecimalNumber *decimalInterest; 
    NSDecimalNumber *decimalEndingBalance;
    
    
    decimalBeginningBalance = decimalPV;
    decimalInterest = [decimalBeginningBalance decimalNumberByMultiplyingBy:decimalR];
    decimalPrincipal = [decimalPayment decimalNumberBySubtracting:decimalInterest];
    decimalEndingBalance = [decimalBeginningBalance decimalNumberBySubtracting:decimalPrincipal];
    [mArrayAmortizationTable addObject:[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%d", 1], @"First",
                                        decimalBeginningBalance, @"Second",
                                        decimalPayment, @"Third",
                                        decimalInterest, @"Fourth",
                                        decimalPrincipal, @"Fifth",
                                        decimalEndingBalance, @"Sixth", nil]];
    
    
    int i;
    for (i = 1; i < decimalN; i++) {
        
        decimalBeginningBalance = decimalEndingBalance;
            decimalInterest = [decimalBeginningBalance decimalNumberByMultiplyingBy:decimalR];
            decimalPrincipal = [decimalPayment decimalNumberBySubtracting:decimalInterest];
            decimalEndingBalance = [decimalBeginningBalance decimalNumberBySubtracting:decimalPrincipal];
            [mArrayAmortizationTable addObject:[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%d", i + 1], @"First",
                                                decimalBeginningBalance, @"Second",
                                                decimalPayment, @"Third",
                                                decimalInterest, @"Fourth",
                                                decimalPrincipal, @"Fifth",
                                                decimalEndingBalance, @"Sixth", nil]];
            
        
        
    }
    
    [self.amortizationTable reloadData];
    
}

- (IBAction)exportDataFromTable:(id)sender {
}

- (IBAction)clearAllData:(id)sender {
    [mArrayAmortizationTable removeAllObjects];
    [self.amortizationTable reloadData];
}



//   Table View methods

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    
    return [mArrayAmortizationTable count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    return [[mArrayAmortizationTable objectAtIndex:row] objectForKey:[tableColumn identifier]];
    
}

- (void)dealloc {
    [super dealloc];
    [textN release];
    [textIY release];
    [textPV release];
    [textPMT release];
    [textFV release];
    [amortizationTable release];
    [checkBoxNAsYears release];
    [checkBoxIYAsPercentage release];
    [mArrayAmortizationTable release];
    
}

@end
