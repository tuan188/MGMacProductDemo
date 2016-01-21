//
//  ProductEntity+CoreDataProperties.h
//  MGMacProductDemo
//
//  Created by Tuan Truong on 1/21/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ProductEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *id;
@property (nullable, nonatomic, retain) NSDate *creationDate;
@property (nullable, nonatomic, retain) NSDate *modificationDate;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *price;

@end

NS_ASSUME_NONNULL_END
