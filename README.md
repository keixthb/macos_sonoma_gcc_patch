# MacOS Sonoma cmake%gcc@13.2.0 Patch

**Release date:** 27 December 2023

Some modifications to the MacOSX sdk to get cmake to compile with gcc

Tested using M3 Pro CPU


## Instructions:

Clone the repository and modify the files on your system. After all the files are updated with the changes, get the number of physical cores in your system with the following:

```console
sysctl -n hw.physicalcpu
```

This will return an integer similar to ```nproc``` in linux. After getting the number of cores in your system:

```console
cd macos_sonoma_gcc_patch
sh install_spack.sh
```

After this runs successfully,

```console
source ~/.zshrc
spacktivate
```

Now, we will build the latest gcc compiler. At the time of writing, the latest compiler is gcc@13.2.0. We can get the current latest compiler by using:

```console
spack info gcc
```

Install gcc with the following, replacing ```13.2.0``` with the latest version returned from spack info, and ``22`` with two times the integer returned from ```sysctl -n hw.physicalcpu```:

```console
spack add gcc@13.2.0
spack concretize
spack install -v -j22
```

Verify the compiler is working correctly with:

```console
which gcc
gcc --version
```

After verifying, install cmake with the following, using the same values from above:

```console
spack add cmake%gcc@13.2.0
spack concretize
spack install -v -j22
```

...and verify:

```console
which cmake
cmake --version
```

## Results:

#### spack.yaml


<img src="/assets/readme/spackage.png" alt="Alt text" title="Optional title">

#### spack install:


<img src="/assets/readme/spack_install.png" alt="Alt text" title="Optional title">

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

