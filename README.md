#MacOS Sonoma cmake%gcc@13.2.0 Patch

**Release date:** 27 December 2023

Some modifications to the MacOSX sdk to get cmake to compile with gcc

Tested using M3 Pro CPU

## Files included in patch:

ATSFont.h

```bash
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/ApplicationServices.framework/Frameworks/ATS.framework/Headers/ATSFont.h
```

CGPath.h

```bash
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/CoreGraphics.framework/Headers/CGPath.h
```

CGPDFArray.h

```bash
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/CoreGraphics.framework/Headers/CGPDFArray.h
```

CGPDFDictionary.h

```bash
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/CoreGraphics.framework/Headers/CGPDFDictionary.h
```

CGImageAnimation.h

```bash
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/ImageIO.framework/Headers/CGImageAnimation.h
```

## spack.yaml


<img src="/assets/readme/spackage.png" alt="Alt text" title="Optional title">

## spack install:


<img src="/assets/readme/spack_install.png" alt="Alt text" title="Optional title">

## Modifications:

My solution basically just:

```c++
#define ATS_UNAVAILABLE (FALSE)
```

...and for each error during the build:

```c++
#if ATS_UNAVAILABLE
...
#endif
```

I understand this probably isn't the best solution--it would be better to define ATS_UNAVAILABLE in one file and reference it; however, I am not familiar with the SDK and this works for me.
