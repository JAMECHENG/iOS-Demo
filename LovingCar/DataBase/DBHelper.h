//
//  DBHelper.h
//  LovingCar
//
//  Created by Jame on 15/7/28.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
#import "FMDB.h"
@interface DBHelper : NSObject
/**
 @abstract 一个操作数据库的单例.
 **/
+ (DBHelper *)shareDBHelper;

#pragma mark - Basic Database Method
/**
 @abstract 根据dbName来创建或发现database.
 @param dbName 为初始化数据库的数据库名称.
 **/
- (void)initDatabaseWithDBName:(NSString *)dbName;
/**
 @abstract 打开当前的数据库.
 **/
- (void)openCurrentDatabase;
/**
 @abstract 关闭当前的数据库.
 **/
- (void)closeCurrentDatabase;
/**
 @abstract 根据resultSet来转换成NSArray类.
 @param resultSet 为FMDB查询后的FMResultSet类数据集合.
 @returns 返回一个FMDB查询后的NSArray类.
 **/
- (NSArray *)getResultArrayFromFMResultSet:(FMResultSet *)resultSet;
/**
 @abstract 根据tableName和columns形成一个SELECT的SQL语句.
 @param tableName 为执行操作的表名.
 @param columns 是一个返回列的集合.
 @returns 返回一个SELECT的SQL语句.
 **/
- (NSString *)selectFromTabel:(NSString *)tableName Columns:(NSArray *)columns;
/**
 @abstract 根据operation和conditions来形成一个WHERE的SQL语句.
 @param operation 是一个AND或者OR的String.
 @param conditions 是一个条件的字符串集合
 @returns 返回一个WHERE的SQL语句.
 **/
- (NSString *)whereWithOperation:(NSString *)operation Conditions:(NSArray *)conditions;
/**
 @abstract 根据tableName,keys和values来形成一个INSERT的SQL语句.
 @param tableName 为执行操作的表名.
 @param keys 是一个插入数据的键的集合.
 @param values 是一个插入数据的值的集合.
 @returns 返回一个INSERT的SQL语句.
 **/
- (NSString *)insertToTableName:(NSString *)tableName Keys:(NSArray *)keys Values:(NSArray *)values;
/**
 @abstract 根据tableName和newValues来形成一个UPDATE的SQL语句.
 @param tableName 为执行操作的表名.
 @param newValues 是一个新数据的集合.
 @returns 返回一个UPDATE的SQL语句.
 **/
- (NSString *)updateToTableName:(NSString *)tableName NewValues:(NSArray *)newValues;
/**
 @abstract 根据tableName来形成一个DELETE的SQL语句.
 @param tableName 为执行操作的表名.
 @returns 返回一个DELETE的SQL语句.
 **/
- (NSString *)deleteFromTableName:(NSString *)tableName;
/**
 @abstract 根据conditions来形成ORDER BY的SQL语句.
 @param conditions 是一个条件的集合.
 @returns 返回一个ORDER BY的SQL语句.
 **/
- (NSString *)orderByWithConditions:(NSArray *)conditions;
/**
 @abstract 执行sqlString的SQL语句.接受INSERT,UPDATE,DELETE SQL语句.
 @param sqlString 是将要执行的SQL语句.
 @returns 返回一个BOOL来显示是否成功执行.
 **/
- (BOOL)executeUpdateWithSQLString:(NSString *)sqlString;
/**
 @abstract 执行sqlString的SQL语句.接受SELECT SQL语句.
 @param sqlString 是将要执行的SQL语句.
 @returns 返回一个FMResultSet类的数据集合.
 **/
- (FMResultSet *)executeQueryWithSQLString:(NSString *)sqlString;
/**
 @abstract 根据sqlString和dictionary来执行UPDATE的SQL语句.
 @param sqlString 是将来执行的SQL的格式,需要dictionary中的数据.
 @param dictionary 是一个用于更新的NSDictionary类的数据源.
 @returns 返回一个BOOL来显示是否成功执行.
 **/
- (BOOL)executeUpdateWithSQLString:(NSString *)sqlString Dictionary:(NSDictionary *)dictionary;
/**
 @abstract 根据sqlString和dictionary来执行SELECT的SQL语句.
 @param sqlString 是将来执行的SQL的格式,需要dictionary中的数据.
 @param dictionary 是一个用于查询的数据源.
 @returns 返回一个FMResultSet类的数据集合.
 **/
- (FMResultSet *)executeQueryWithSQLString:(NSString *)sqlString Dictionary:(NSDictionary *)dictionary;
/**
 @abstract 根据sqlString和array来执行UPDATE的SQL语句.
 @param sqlString 是将来执行的SQL的格式,需要array中的数据.
 @param array 是一个用于更新的NSArray类的数据源.
 @returns 返回一个BOOL来显示是否成功执行.
 **/
- (BOOL)executeUpdateWithSQLString:(NSString *)sqlString Array:(NSArray *)array;

#pragma mark - Common DBHelper Method
/**
 @abstract 获取tableName表中的所有的对象.
 @param tableName 为执行操作的表名.
 @returns 返回一个NSArray类的数据集合.
 **/
- (NSArray *)getAllObjectFromTable:(NSString *)tableName;
/**
 @abstract 将一个Model插入tableName表中.
 @param tableName 为执行操作的表名.
 @param model 插入操作的BaseModel类的数据源.
 @returns 返回一个BOOL来显示是否成功执行.
 **/
- (BOOL)insertToTable:(NSString *)tableName Model:(BaseModel *)model;
/**
 @abstract 基于WHERE语句，用一个model去更新一张表中对应的数据
 @param tableName 为执行操作的表名.
 @param model 更新操作的BaseModel类的数据源.
 @param operation 是一个AND或者OR的String.
 @param conditions 是一个条件的集合.
 @returns 返回一个BOOL来显示是否成功执行.
 **/
- (BOOL)updateFromTable:(NSString *)tableName Model:(BaseModel *)model Operation:(NSString *)operation Conditions:(NSArray *)condition;
/**
 @abstract 根据model,keys和values快速更新tableName表中的一条数据 SQL语句格式为UPDATE %@ SET %@ WHERE %@ = %@.
 @param tableName 为执行操作的表名.
 @param model 更新操作的BaseModel类的数据源.
 @param keys model中用于更新的键名称集合.
 @param values model中用于更新的值名称集合.
 @returns 返回一个BOOL来显示是否成功执行.
 **/
- (BOOL)updateFromTable:(NSString *)tableName Model:(BaseModel *)model Key:(NSString *)key Value:(NSString *)value;
/**
 @abstract 根据Columns,key和value快速从tableName表中查询的数据，SQL语句格式为SELECT %@ FROM %@ WHERE %@ = %@.
 @param tableName 为执行操作的表名.
 @param Columns 为所要查询的列集合.
 @param key 为查询条件的键.
 @param value 为查询条件的值.
 @returns 返回一个NSArray类的数据集合.
 **/
- (NSArray *)selectFromTable:(NSString *)tableName Columns:(NSArray *)columns Key:(NSString *)key Value:(NSString *)value;
@end

