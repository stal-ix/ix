// The part of Chromium's build/build_config.h that PDFium's core reads,
// written for a build without Chromium's tree: the OS flags, the compiler
// and the CPU. Every target here is a POSIX one; wasm32-none answers as
// Linux too, its libc stubs stand in for the file system the font mapper
// looks at, and it finds no fonts there and takes the built-in ones.
#ifndef BUILD_BUILD_CONFIG_H_
#define BUILD_BUILD_CONFIG_H_

#include "build/buildflag.h"

#define BUILDFLAG_INTERNAL_IS_WIN() (0)
#define BUILDFLAG_INTERNAL_IS_APPLE() (0)
#define BUILDFLAG_INTERNAL_IS_MAC() (0)
#define BUILDFLAG_INTERNAL_IS_IOS() (0)
#define BUILDFLAG_INTERNAL_IS_ANDROID() (0)
#define BUILDFLAG_INTERNAL_IS_CHROMEOS() (0)
#define BUILDFLAG_INTERNAL_IS_FUCHSIA() (0)
#define BUILDFLAG_INTERNAL_IS_BSD() (0)
#define BUILDFLAG_INTERNAL_IS_LINUX() (1)
#define BUILDFLAG_INTERNAL_IS_POSIX() (1)

#define COMPILER_GCC 1

#if defined(__x86_64__)
#define ARCH_CPU_X86_FAMILY 1
#define ARCH_CPU_X86_64 1
#define ARCH_CPU_64_BITS 1
#elif defined(__aarch64__)
#define ARCH_CPU_ARM_FAMILY 1
#define ARCH_CPU_ARM64 1
#define ARCH_CPU_64_BITS 1
#elif defined(__wasm32__)
#define ARCH_CPU_WASM 1
#define ARCH_CPU_32_BITS 1
#else
#error "an architecture build_config.h does not name"
#endif

#define ARCH_CPU_LITTLE_ENDIAN 1

#if __SIZEOF_WCHAR_T__ == 4
#define WCHAR_T_IS_32_BIT 1
#elif __SIZEOF_WCHAR_T__ == 2
#define WCHAR_T_IS_16_BIT 1
#else
#error "a wchar_t size build_config.h does not name"
#endif

#if defined(ARCH_CPU_64_BITS)
#define BUILDFLAG_INTERNAL_HAS_64_BIT_POINTERS() (1)
#else
#define BUILDFLAG_INTERNAL_HAS_64_BIT_POINTERS() (0)
#endif

#endif
