//
//  DBHelper.m
//  LovingCar
//
//  Created by Jame on 15/7/28.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import "DBHelper.h"

@interface DBHelper ()
@property (nonatomic, strong) FMDatabase *fmdb;
@end

@implementation DBHelper
@synthesize fmdb;
static DBHelper *shareDBHelper;
+ (DBHelper *)shareDBHelper
{
    @synchronized(self){
        if (!shareDBHelper) {
            shareDBHelper = [[self alloc] init];
        }
    }
    return shareDBHelper;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self){
        if (!shareDBHelper) {
            shareDBHelper = [super allocWithZone:zone];
        }
    }
    return shareDBHelper;
}

- (instancetype)init
{
    @synchronized(self){
        self = [super init];
        if (self) {
            [self initDatabaseWithDBName:@"database"];
            [self createUserTable];
        }
        return self;
    }
}
#pragma mark - Basic Database Method
/**
 * 根据dbName来创建或发现database
 **/
- (void)initDatabaseWithDBName:(NSString *)dbName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [paths objectAtIndex:0];
    filePath = [filePath stringByAppendingString:[NSString stringWithFormat:@"/%@.db",dbName]];
    fmdb = [FMDatabase databaseWithPath:filePath];
}
/**
 * 打开dbName的database
 **/
- (void)openCurrentDatabase
{
    if ([fmdb open]) {
        [fmdb setDateFormat:[FMDatabase storeableDateFormat:NSDATE_DEFAULT_FORMART]];
    } else {
        ULog(@"the database couldn't open!");
    }
}
/**
 * 关闭dbName的database
 **/
- (void)closeCurrentDatabase
{
    if (![fmdb close]) {
        ULog(@"the database couldn't close!");
    }
}
/**
  * 根据FMResultSet来获取NSArray
  **/
- (NSArray *)getResultArrayFromFMResultSet:(FMResultSet *)resultSet
{
    NSMutableArray *resultArray = [NSMutableArray array];
    while ([resultSet next]) {
        [resultArray addObject:[resultSet resultDictionary]];
    };
    return resultArray;
}
/**
 * SELECT SQL语句(完整的条件语句)
 **/
- (NSString *)selectFromTabel:(NSString *)tableName Columns:(NSArray *)columns
{
    NSString *columnString = [columns componentsJoinedByString:@","];
    return [NSString stringWithFormat:@"SELECT %@ FROM %@",columnString,tableName];
}
/**
 * WHERE SQL语句(完整的条件语句)
 **/
- (NSString *)whereWithOperation:(NSString *)operation Conditions:(NSArray *)conditions
{
    if (!operation&&conditions.count>1) {
        ULog(@"The formate is incorrect!");
        return @"The formate is incorrect!!!";
    } else {
        NSString *conditionString = [conditions componentsJoinedByString:[NSString stringWithFormat:@" %@ ",operation]];
        return [NSString stringWithFormat:@"WHERE %@",conditionString];
    }
}
/**
 * INSERT SQL语句(完整的条件语句)
 **/
- (NSString *)insertToTableName:(NSString *)tableName Keys:(NSArray *)keys Values:(NSArray *)values
{
    NSString *keyString = [keys componentsJoinedByString:@", "];
    NSString *valueString = [values componentsJoinedByString:@", "];
    return [NSString stringWithFormat:@"INSERT INTO %@ (%@) VALUES (%@)",tableName,keyString,valueString];
}
/**
 * UPDATE SQL语句(完整的条件语句)
 **/
- (NSString *)updateToTableName:(NSString *)tableName NewValues:(NSArray *)newValues
{
    NSString *valueString = [newValues componentsJoinedByString:@", "];
    return [NSString stringWithFormat:@"UPDATE %@ SET %@",tableName,valueString];
}
/**
 * DELETE SQL语句(完整的条件语句)
 **/
- (NSString *)deleteFromTableName:(NSString *)tableName
{
    return [NSString stringWithFormat:@"DELETE FROM %@",tableName];
}
/**
 * ORDER BY SQL语句(完整的条件语句)
 **/
- (NSString *)orderByWithConditions:(NSArray *)conditions
{
    NSString *conditionString = [conditions componentsJoinedByString:@", "];
    return [NSString stringWithFormat:@"ORDER BY %@",conditionString];
}
/**
 * 执行INSERT,UPDATE,DELETE SQL语句
 **/
- (BOOL)executeUpdateWithSQLString:(NSString *)sqlString
{
    [self openCurrentDatabase];
    return [fmdb executeUpdate:sqlString];
}
/**
 * 执行SELECT SQL语句
 **/
- (FMResultSet *)executeQueryWithSQLString:(NSString *)sqlString
{
    [self openCurrentDatabase];
    FMResultSet *resultSet = [fmdb executeQuery:sqlString];
    return resultSet;
}
/**
 * 执行UPDATE SQL语句，数据是NSDictionary
 **/
- (BOOL)executeUpdateWithSQLString:(NSString *)sqlString Dictionary:(NSDictionary *)dictionary
{
    [self openCurrentDatabase];
    return [fmdb executeUpdate:sqlString withParameterDictionary:dictionary];
}
/**
 * 执行QUERY SQL语句，数据是NSDictionary
 **/
- (FMResultSet *)executeQueryWithSQLString:(NSString *)sqlString Dictionary:(NSDictionary *)dictionary
{
    [self openCurrentDatabase];
    return [fmdb executeQuery:sqlString withParameterDictionary:dictionary];
}
/**
 * 执行UPDATE SQL语句，数据是NSARRAY
 **/
- (BOOL)executeUpdateWithSQLString:(NSString *)sqlString Array:(NSArray *)array
{
    [self openCurrentDatabase];
    return [fmdb executeUpdate:sqlString withArgumentsInArray:array];
}
#pragma mark - Build Database Table
/**
 * 创建一张UserList的表
 **/
- (void)createUserTable
{
    [self openCurrentDatabase];
    [fmdb executeUpdate:@"CREATE TABLE IF NOT EXISTS UserList (userLocalId INTEGER PRIMARY KEY AUTOINCREMENT, userName text, userId text);"];
    [self closeCurrentDatabase];
}
/**
 * 创建一张CarList的表
 **/
- (void)createCarTable
{
    [self openCurrentDatabase];
    [fmdb executeUpdate:@"CREATE TABLE IF NOT EXISTS CarList (carLocalId INTEGER PRIMARY KEY AUTOINCREMENT, carName text, carId text,userId text,FOREIGN KEY (userId) REFERENCES UserList(UserId));"];
    [self closeCurrentDatabase];
}

#pragma mark - Common DBHelper Method
/**
 * 获取Table表中的所有的对象
 **/
- (NSArray *)getAllObjectFromTable:(NSString *)tableName
{
    NSString *selectString = [self selectFromTabel:tableName Columns:@[@"*"]];
    FMResultSet *fmrs = [self executeQueryWithSQLString:selectString];
    NSArray *resultArray = [self getResultArrayFromFMResultSet:fmrs];
    [self closeCurrentDatabase];
    return resultArray;
}
/**
 * 将一个Model插入Table中
 **/
- (BOOL)insertToTable:(NSString *)tableName Model:(BaseModel *)model
{
    NSArray *keys = [model getPropertyKeys];
    NSString *keyStr = [keys componentsJoinedByString:@", "];
    NSString *valueStr = [keys componentsJoinedByString:@", :"];
    valueStr = [NSString stringWithFormat:@":%@",valueStr];
    NSString *SQLString = [NSString stringWithFormat:@"INSERT INTO %@ (%@) VALUES (%@)",tableName,keyStr,valueStr];
    BOOL result = [self executeUpdateWithSQLString:SQLString Dictionary:[model convertToDictionary]];
    [self closeCurrentDatabase];
    return result;
}
/**
 * 基于WHERE语句，用一个model去更新一张表中对应的数据
 **/
- (BOOL)updateFromTable:(NSString *)tableName Model:(BaseModel *)model Operation:(NSString *)operation Conditions:(NSArray *)condition
{
    NSString *whereString = [self whereWithOperation:operation Conditions:condition];
    NSArray *keys = [model getPropertyKeys];
    NSString *keyString = [keys componentsJoinedByString:@" = ?,"];
    NSString *updateString = [NSString stringWithFormat:@"UPDATE %@ SET %@",tableName,keyString];
    updateString = [NSString stringWithFormat:@"%@ = ?",updateString];
    NSString *SQLString = [AppHelper groupSQLStrings:@[updateString,whereString]];
    BOOL result = [self executeUpdateWithSQLString:SQLString Array:[model getPropertyValues]];
    [self closeCurrentDatabase];
    return result;
}
/**
 * 快速更新table中的一条数据 UPDATE %@ SET %@ WHERE %@ = %@
 **/
- (BOOL)updateFromTable:(NSString *)tableName Model:(BaseModel *)model Key:(NSString *)key Value:(NSString *)value
{
    NSArray *keys = [model getPropertyKeys];
    NSString *keyString = [keys componentsJoinedByString:@" = ?,"];
    NSString *updateString = [NSString stringWithFormat:@"%@ = ?",keyString];
    NSString *SQLString = [NSString stringWithFormat:@"UPDATE %@ SET %@ WHERE %@ = %@",tableName,updateString,key,value];
    BOOL result = [self executeUpdateWithSQLString:SQLString Array:[model getPropertyValues]];
    [self closeCurrentDatabase];
    return result;
}
/**
 * 快速查询的方法，SELECT %@ FROM %@ WHERE %@ = %@
 **/
- (NSArray *)selectFromTable:(NSString *)tableName Columns:(NSArray *)columns Key:(NSString *)key Value:(NSString *)value
{
    NSString *selectString = [self selectFromTabel:tableName Columns:columns];
    NSString *SQLString = [NSString stringWithFormat:@"%@ WHERE %@ = %@",selectString,key,value];
    FMResultSet *fmrs = [self executeQueryWithSQLString:SQLString];
    NSArray *resultArray = [self getResultArrayFromFMResultSet:fmrs];
    [self closeCurrentDatabase];
    return resultArray;
}
@end
