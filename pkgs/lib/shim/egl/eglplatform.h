#pragma once

#include <stdint.h>

typedef void*     EGLNativeDisplayType;
typedef uintptr_t EGLNativePixmapType;
typedef uintptr_t EGLNativeWindowType;

typedef EGLNativeDisplayType NativeDisplayType;
typedef EGLNativePixmapType  NativePixmapType;
typedef EGLNativeWindowType  NativeWindowType;

typedef int32_t EGLint;

#if defined(__cplusplus)
#define EGL_CAST(type, value) (static_cast<type>(value))
#else
#define EGL_CAST(type, value) ((type) (value))
#endif
