//
//  UserDBHelper.m
//  LovingCar
//
//  Created by Jame on 15/8/10.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "UserDBHelper.h"

@implementation UserDBHelper

+ (BOOL)insertUserToDataBase:(UserModel *)userModel
{
    NSArray *resultArray = [[DBHelper shareDBHelper] selectFromTable:USER_TABLE Columns:@[@"*"] Key:@"userId" Value:userModel.userId];
    if ([resultArray count] > 0) {
        return [[DBHelper shareDBHelper] updateFromTable:USER_TABLE Model:userModel Key:@"userId" Value:userModel.userId];
    } else {
        return [[DBHelper shareDBHelper] insertToTable:USER_TABLE Model:userModel];
    }
}

+ (UserModel *)getCurrentUserFromDatabase
{
    NSString *SQLString = [[DBHelper shareDBHelper] selectFromTabel:USER_TABLE Columns:@[@"*"]];
    NSArray * resultArray = [[DBHelper shareDBHelper] getResultArrayFromFMResultSet:[[DBHelper shareDBHelper] executeQueryWithSQLString:SQLString]];
    return [resultArray firstObject];
}
@end
