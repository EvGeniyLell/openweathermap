//
//  NSUserDefaults+KeyedArchiver.h
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (KeyedArchiver)

+ (BOOL)saveObject:(id)object forKey:(NSString *)key;
- (BOOL)saveObject:(id)object forKey:(NSString *)key;
+ (id)loadObjectForKey:(NSString *)key;
- (id)loadObjectForKey:(NSString *)key;

@end
