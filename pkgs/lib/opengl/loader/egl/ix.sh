{% extends '//die/dl/implib.sh' %}

{% block implib_name %}
EGL
{% endblock %}

{% block implib_symbols %}
eglBindAPI
eglBindTexImage
eglChooseConfig
eglClientWaitSync
eglCopyBuffers
eglCreateContext
eglCreateImage
eglCreatePbufferFromClientBuffer
eglCreatePbufferSurface
eglCreatePixmapSurface
eglCreatePlatformPixmapSurface
eglCreatePlatformWindowSurface
eglCreateSync
eglCreateWindowSurface
eglDestroyContext
eglDestroyImage
eglDestroySurface
eglDestroySync
eglGetConfigAttrib
eglGetConfigs
eglGetCurrentContext
eglGetCurrentDisplay
eglGetCurrentSurface
eglGetDisplay
eglGetError
eglGetPlatformDisplay
eglGetProcAddress
eglGetSyncAttrib
eglInitialize
eglMakeCurrent
eglQueryAPI
eglQueryContext
eglQueryString
eglQuerySurface
eglReleaseTexImage
eglReleaseThread
eglSurfaceAttrib
eglSwapBuffers
eglSwapInterval
eglTerminate
eglWaitClient
eglWaitGL
eglWaitNative
eglWaitSync
{% endblock %}
