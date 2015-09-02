//
//  CarDBHelper.m
//  LovingCar
//
//  Created by Jame on 15/8/10.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "CarDBHelper.h"

@implementation CarDBHelper
+ (BOOL)insertCarToDataBase:(CarModel *)carModel
{
    NSArray *resultArray = [[DBHelper shareDBHelper] selectFromTable:CAR_TABLE Columns:@[@"*"] Key:@"carId" Value:carModel.carId];
    if ([resultArray count] > 0) {
        return [[DBHelper shareDBHelper] updateFromTable:CAR_TABLE Model:carModel Key:@"userId" Value:carModel.carId];
    } else {
        return [[DBHelper shareDBHelper] insertToTable:CAR_TABLE Model:carModel];
    }
}

+ (NSArray *)getCarsByUserId:(NSString *)userId
{
    return [[DBHelper shareDBHelper] selectFromTable:CAR_TABLE Columns:@[@"*"] Key:@"userId" Value:userId];
}
@end
