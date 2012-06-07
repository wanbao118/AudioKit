//  mySoundGenerator.m

#import "SoundGenerator.h"

typedef enum
{
    kPValuePitchTag=4,
}kPValueTag;

@implementation SoundGenerator

-(id) initWithOrchestra:(CSDOrchestra *)newOrchestra {
    self = [super initWithOrchestra:newOrchestra];
    if (self) {
        // CSDFunctionTable * iSine = [[CSDFunctionTable alloc] initWithType:kGenSine UsingSize:iFTableSize];
        
        float partialStrengths[] = {1.0f, 0.5f, 1.0f};
        CSDParamArray * partialStrengthParamArray = [CSDParamArray paramFromFloats:partialStrengths count:3];

        CSDSineTable * iSine = [[CSDSineTable alloc] initWithOutput:@"iSine" TableSize:4096 PartialStrengths:partialStrengthParamArray];
        [self addFunctionStatement:iSine];
        
        //H4Y - ARB: This assumes that CSDFunctionTable is ftgentmp
        //  and will look for [CSDFunctionTable output] during csd conversion
        myOscillator = [[CSDOscillator alloc] initWithOutput:FINAL_OUTPUT
                                                   Amplitude:[CSDParam paramWithFloat:0.4]
                                                      kPitch:[CSDParam paramWithPValue:kPValuePitchTag]
                                               FunctionTable:iSine];
        [self addOpcode:myOscillator];
    }
    return self;
}

-(void) playNoteForDuration:(float)dur Pitch:(float)pitch {
    int instrumentNumber = [[orchestra instruments] indexOfObject:self] + 1;
    NSString * note = [NSString stringWithFormat:@"%0.2f %0.2f", dur, pitch];
    [[CSDManager sharedCSDManager] playNote:note OnInstrument:instrumentNumber];
}

@end