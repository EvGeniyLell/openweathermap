//
//  NSUserDefaults+KeyedArchiver.m
//  OpenWeatherMap
//
//  Created by EvGeniy Lell on 31.03.16.
//  Copyright © 2016 EvGeniy Ilyin. All rights reserved.
//

#import "NSUserDefaults+KeyedArchiver.h"


@implementation NSUserDefaults (KeyedArchiver)

+ (BOOL)saveObject:(id)object forKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] saveObject:object forKey:key];
}

- (BOOL)saveObject:(id)object forKey:(NSString *)key {
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:object];
    [self setObject:encodedObject forKey:key];
    return [self synchronize];
}

+ (id)loadObjectForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] loadObjectForKey:key];
}

- (id)loadObjectForKey:(NSString *)key {
    NSData *encodedObject = [self objectForKey:key];
    id object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return object;
}

@end
