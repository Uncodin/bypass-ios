//
//  BPAttributedStringConverter.h
//  Bypass
//
//  Created by Matthias Tretter on 01.08.13.
//  Copyright (c) 2013 Uncodin, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@class BPDisplaySettings;
@class BPDocument;


/*!
 \brief Renders a Bypass Document to an `NSAttributedString`.
 */
@interface BPAttributedStringConverter : NSObject

@property(nonatomic, strong) BPDisplaySettings *displaySettings;

- (NSAttributedString *)convertDocument:(BPDocument *)document;

@end
