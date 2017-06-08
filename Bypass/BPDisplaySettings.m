//
// Created by Audun Holm Ellertsen on 4/30/13.
// Copyright (c) 2013 Uncodin. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <CoreText/CoreText.h>
#import "BPDisplaySettings.h"


@implementation BPDisplaySettings

- (id)init
{
    self = [super init];
    if (self) {
#if !TARGET_OS_TV
        CGFloat systemFontSize = [UIFont systemFontSize];
#else
        CGFloat systemFontSize = [[UIFont preferredFontForTextStyle:UIFontTextStyleBody] pointSize];
#endif
        
        self.defaultFont = [UIFont systemFontOfSize:systemFontSize];
        self.boldFont = [UIFont boldSystemFontOfSize:systemFontSize];
        self.italicFont = [UIFont italicSystemFontOfSize:systemFontSize];
        self.monospaceFont = [UIFont fontWithName:@"Courier" size:systemFontSize - 2.f];
        self.quoteFont = [UIFont fontWithName:@"Marion-Italic" size:systemFontSize - 2.f];
        self.h1Font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:systemFontSize * 2.f];
        self.h2Font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:systemFontSize * 1.8f];
        self.h3Font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:systemFontSize * 1.6f];
        self.h4Font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:systemFontSize * 1.4f];
        self.h5Font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:systemFontSize * 1.2f];
        self.h6Font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:systemFontSize];
        
        self.defaultColor = [UIColor blackColor];
        self.quoteColor = [UIColor darkGrayColor];
        self.codeColor = [UIColor grayColor];
        self.linkColor = [UIColor blueColor];
        self.headerColor = self.defaultColor;
        
        self.bulletColorDefault = self.defaultColor;
        self.bulletColorLevel1 = [UIColor grayColor];
        self.bulletColorLevel2 = [UIColor lightGrayColor];
        
        self.bulletIndentation = 13.0f;

        self.codeIndentation = 10.0f;
        self.quoteIndentation = 23.0f;
        self.paragraphSpacing = 20.0f;
        self.paragraphSpacingHeading = 10.0f;
        self.paragraphSpacingCode = 0.0f;
        
        self.paragraphLineSpacing = 1.2f;
        self.paragraphLineSpacingHeading = 1.2f;
        
        self.linkUnderlined = YES;
        
    }
    return self;
}

- (UIFont *)boldItalicFont
{
    if (_boldItalicFont == nil) {
        CTFontRef defaultFontRef = [self newCTFontRefFromUIFont:self.defaultFont];
        CTFontSymbolicTraits traits = kCTFontBoldTrait | kCTFontItalicTrait;
        CTFontSymbolicTraits mask = kCTFontBoldTrait | kCTFontItalicTrait;
        CTFontRef boldItalicFontRef = CTFontCreateCopyWithSymbolicTraits(defaultFontRef, 0.f, NULL, traits, mask);
        CFRelease(defaultFontRef);
        assert(boldItalicFontRef != NULL);
        
        _boldItalicFont = [self UIFontFromCTFont:boldItalicFontRef];
        CFRelease(boldItalicFontRef);
    }
    
    return _boldItalicFont;
}

#pragma mark - Private

- (UIFont *)UIFontFromCTFont:(CTFontRef)ctFont
{
    NSString *fontName = (__bridge_transfer NSString *) CTFontCopyName(ctFont, kCTFontPostScriptNameKey);
    CGFloat fontSize = CTFontGetSize(ctFont);
    
    return [UIFont fontWithName:fontName size:fontSize];
}

- (CTFontRef)newCTFontRefFromUIFont:(UIFont *)font
{
    return CTFontCreateWithName((__bridge CFStringRef)font.fontName, font.pointSize, NULL);
}
@end
