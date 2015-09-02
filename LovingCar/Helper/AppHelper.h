//
//  AppHelper.h
//  LovingCar
//
//  Created by Jame on 15/7/17.
//  Copyright (c) 2015年 Jame. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 @abstract 一个全局的工具类.
 **/
@interface AppHelper : NSObject

#pragma mark - UIImage Helper
/**
 @abstract 根据size的大小来放大缩小UIImage.
 @param image 需要处理的UIImage.
 @param size 需要处理到的大小.
 @returns 返回一个处理过的UIImage.
 */
+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size;
/**
 @abstract 根据scaleSize的大小来等比例放大缩小UIImage.
 @param image 需要处理的UIImage.
 @param scaleSize 需要处理到的比例.
 @returns 返回一个处理过的UIImage.
 */
+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;
/**
 @abstract 将一个UIView截图成为一个UIImage.
 @param view 需要截图的UIVIEW.
 @returns 返回UIVIEW的截图.
 */
+ (UIImage *)transferViewToImage:(UIView *)view;
/**
 @abstract 将一个UIImage添加高斯模糊效果.
 @param image 需要处理的UIImage.
 @param blur 高斯模糊的等级.
 @returns 返回一个加过高斯模糊的UIImage.
 */
+ (UIImage *)transferBlurImage:(UIImage *)image withBlurLevel:(CGFloat)blur;

#pragma mark - NSDate Helper
/**
 @abstract 根据formate将date转成NSString.
 @param date 需要转换的NSDate.
 @param formate 需要转换成的格式.
 @returns 返回一个符合formate格式的日期字符串.
 **/
+ (NSString *)dateStringWithDate:(NSDate *)date formart:(NSString *)formart;
/**
 @abstract 根据yyyy-MM-dd HH:mm:ss格式将date转成NSString.
 @param date 需要转换的date.
 @returns 返回一个符合yyyy-MM-dd HH:mm:ss格式的日期字符串.
 **/
+ (NSString *)stringFromDate:(NSDate *)date;
/**
 @abstract 根据formate将string转成NSDate.
 @param string 需要转换的NSString.
 @param formate 需要转换成的格式.
 @returns 返回一个符合formate格式的NSDate对象.
 **/
+ (NSDate *)dateWithDateString:(NSString*)string formart:(NSString *)formart;
/**
 @abstract 根据yyyy-MM-dd HH:mm:ss格式将string转成NSDate.yyyy-MM-dd HH:mm:ss.
 @param string 需要转换的NSString.
 @returns 返回一个符合yyyy-MM-dd HH:mm:ss格式的NSDate对象.
 **/
+ (NSDate *)dateFromString:(NSString *)string;
#pragma mark - NSString Helper
/**
 @abstract 根据array中的每个NSString拼接成一个新的NSString,中间以空格分开.
 @param array 一个字符串的NSArray.
 @returns 返回一个处理过的NSString.
 **/
+ (NSString *)groupSQLStrings:(NSArray *)array;
/**
 @abstract 根据array中的每个NSString拼接成一个新的NSString,中间以string分开.
 @param array 一个字符串的NSArray.
 @param string 用于区分两个字符串的标示符.
 @returns 返回一个处理过的NSString.
 **/
+ (NSString *)groupStrings:(NSArray *)array String:(NSString *)string;
#pragma mark - Plish Helper
/**
 @abstract 根据key和object写入一个fileName的Plist文件中.
 @param key 需要写入的键名.
 @param object 需要写入的值.
 @param fileName 需要写入对象的文件名称.
 @returns 返回一个BOOL来显示是否成功执行.
 **/
+ (BOOL)writeToPlistWithKey:(NSString *)key Object:(id)object FileName:(NSString *)fileName;
/**
 @abstract 根据key来从一个fileName的Plist文件读取数据.
 @param key 需要读取数据的键名.
 @param fileName 需要读取对象的文件名称.
 @returns 返回读取到的数据.(数据为类型不定)
 **/
+ (id)readFromPlistWithKey:(NSString *)key FileName:(NSString *)fileName;
/**
 @abstract 根据key去删除一个fileName的Plist文件中对应的数据.
 @param key 需要删除数据的键名.
 @param fileName 需要删除对象的文件名称.
 @returns 返回一个BOOL来显示是否成功执行.
 **/
+ (BOOL)removeObjectFromPlistWithKey:(NSString *)key FileName:(NSString *)fileName;
/**
 @abstract 把数据和对应的Key写入AppDetails.plist
 @param key 需要写入的键名.
 @param object 需要写入的值.
 @returns 返回一个BOOL来显示是否成功执行.
 **/
+ (BOOL)writeToPlistWithKey:(NSString *)key Object:(id)object;
/**
 @abstract 根据key和object写入AppDetails.plist文件中.
 @param key 需要读取数据的键名.
 @returns 返回读取到的数据.(数据为类型不定)
 **/
+ (id)readFromPlistWithKey:(NSString *)key;
/**
 @abstract 根据key去删除AppDetails.plist中的数据
 @param key 需要删除数据的键名.
 @returns 返回一个BOOL来显示是否成功执行.
 **/
+ (BOOL)removeObjectFromPlistWithKey:(NSString *)key;
/**
 @abstract 根据dic去更新fileName的Plist文件.(Plist格式只能为NSDictionary)
 @param dic 需要用于更新的NSDictionary.
 @param fileName 需要更新的文件名称.
 @returns 返回一个BOOL来显示是否成功执行.
 **/
+ (BOOL)updateDictionaryToPlist:(NSDictionary *)dic FileName:(NSString *)fileName;
/**
 @abstract 根据fileName去读取对应文件的中的数据.(Plist格式只能为NSDictionary)
 @param fileName 需要读取对象的文件名称.
 @returns 返回一个NSDictionary类的数据集合.
 **/
+ (NSDictionary *)readDictionaryFromPlistWithFileName:(NSString *)fileName;
/**
 @abstract 根据dic去更新fileName的Plist文件.(Plist格式只能为NSArray)
 @param array 需要更新的NSArray.
 @param fileName 需要更新对象的文件名称.
 @returns 返回一个BOOL来显示是否成功执行.
 **/
+ (BOOL)updateArrayToPlist:(NSArray *)array FileName:(NSString *)fileName;
/**
 @abstract 根据fileName去读取对应文件的中的数据.(Plist格式只能为NSArray)
 @param fileName 需要读取对象的文件名称.
 @returns 返回一个NSArray类的数据集合.
 **/
+ (NSArray *)readArrayFromPlistWithFileName:(NSString *)fileName;
/**
 @abstract 根据fileName去删除对应的Plist文件.
 @param fileName 需要删除对象的文件名称.
 @returns 返回一个BOOL来显示是否成功执行.
 **/
+ (BOOL)deletePlistFileWithFileName:(NSString *)fileName;
#pragma mark - NSUserDefaults Helper
/**
 @abstract 根据Key和Object来更新UserDefaults.
 @param key 需要更新数据的键名.
 @param object 需要更新的值.
 **/
+ (void)updateUserDefaultsWithKey:(NSString *)key Object:(id)object;
/**
 @abstract 根据key从UserDefaults中来获取object.
 @param key 需要读取数据的键名.
 @returns 返回读取到的数据.(数据为类型不定).
 **/
+ (id)readObjectFromUserDefaultsWithKey:(NSString *)key;
/**
 @abstract 根据key从UserDefaults中来删除object.
 @param key 需要删除的数据的键名.
 **/
+ (void)removeObjectFromUserDefaultsWithKey:(NSString *)key;
/**
 @abstract 读取整个UserDefaults的数据.
 @returns 返回一个UserDefaults.
 **/
+ (NSUserDefaults *)getUserDefaults;

#pragma mark - NSString Helper


@end

