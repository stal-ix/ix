{% extends '//lib/web/kit/t/ix.sh' %}

{% block fetch %}
https://webkitgtk.org/releases/webkitgtk-2.40.0.tar.xz
sha:a4607ea1bf89669e89b1cb2c63faaec513f93de09b6ae60cc71d6a8aab7ab393
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/wpe
lib/atk
lib/icu
lib/c++
lib/gtk
lib/png
lib/jxl
lib/avif
lib/webp
lib/glib
lib/jpeg
lib/xslt
lib/tasn1
lib/cairo
lib/pango
lib/epoxy
lib/woff2
lib/xml/2
lib/gcrypt
lib/secret
lib/soup/3
lib/lcms/2
lib/notify
lib/wayland
lib/seccomp
lib/sqlite/3
lib/freetype
lib/harfbuzz
lib/jpeg/open
lib/gstreamer
lib/fontconfig
lib/harfbuzz/icu
{% endblock %}

{% block cmake_flags %}
{{super()}}
PORT=GTK
USE_JPEGXL=ON
ENABLE_WEBDRIVER=OFF
USE_GSTREAMER_TRANSCODER=OFF
{% endblock %}

{% block patch %}
{{super()}}

sed -e 's|static_cast<EGLNativeWindowType>|(EGLNativeWindowType)|' \
    -i Source/WebCore/platform/graphics/egl/GLContextEGL.cpp

sed -e 's|GRefPtr.h>|GRefPtr.h>\n#include <wtf/glib/GUniquePtr.h>|' \
    -i Source/WebKit/UIProcess/gtk/ClipboardGtk4.cpp

sed -e 's|std::strlen|!characters ? 0 : std::strlen|' \
    -i Source/WTF/wtf/text/StringConcatenate.h
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/unifdef
{% endblock %}

{% block c_rename_symbol %}
{{super()}}
glAccum
glActiveShaderProgram
glActiveTexture
glAlphaFunc
glAreTexturesResident
glArrayElement
glAttachShader
glBegin
glBeginConditionalRender
glBeginQuery
glBeginQueryIndexed
glBeginTransformFeedback
glBindAttribLocation
glBindBuffer
glBindBufferBase
glBindBufferRange
glBindBuffersBase
glBindBuffersRange
glBindFragDataLocation
glBindFragDataLocationIndexed
glBindFramebuffer
glBindImageTexture
glBindImageTextures
glBindProgramPipeline
glBindRenderbuffer
glBindSampler
glBindSamplers
glBindTexture
glBindTextureUnit
glBindTextures
glBindTransformFeedback
glBindVertexArray
glBindVertexBuffer
glBindVertexBuffers
glBitmap
glBlendColor
glBlendEquation
glBlendEquationSeparate
glBlendEquationSeparatei
glBlendEquationi
glBlendFunc
glBlendFuncSeparate
glBlendFuncSeparatei
glBlendFunci
glBlitFramebuffer
glBlitNamedFramebuffer
glBufferData
glBufferStorage
glBufferSubData
glCallList
glCallLists
glCheckFramebufferStatus
glCheckNamedFramebufferStatus
glClampColor
glClear
glClearAccum
glClearBufferData
glClearBufferSubData
glClearBufferfi
glClearBufferfv
glClearBufferiv
glClearBufferuiv
glClearColor
glClearDepth
glClearDepthf
glClearIndex
glClearNamedBufferData
glClearNamedBufferSubData
glClearNamedFramebufferfi
glClearNamedFramebufferfv
glClearNamedFramebufferiv
glClearNamedFramebufferuiv
glClearStencil
glClearTexImage
glClearTexSubImage
glClientActiveTexture
glClientWaitSync
glClipControl
glClipPlane
glColor3b
glColor3bv
glColor3d
glColor3dv
glColor3f
glColor3fv
glColor3i
glColor3iv
glColor3s
glColor3sv
glColor3ub
glColor3ubv
glColor3ui
glColor3uiv
glColor3us
glColor3usv
glColor4b
glColor4bv
glColor4d
glColor4dv
glColor4f
glColor4fv
glColor4i
glColor4iv
glColor4s
glColor4sv
glColor4ub
glColor4ubv
glColor4ui
glColor4uiv
glColor4us
glColor4usv
glColorMask
glColorMaski
glColorMaterial
glColorP3ui
glColorP3uiv
glColorP4ui
glColorP4uiv
glColorPointer
glCompileShader
glCompressedTexImage1D
glCompressedTexImage2D
glCompressedTexImage3D
glCompressedTexSubImage1D
glCompressedTexSubImage2D
glCompressedTexSubImage3D
glCompressedTextureSubImage1D
glCompressedTextureSubImage2D
glCompressedTextureSubImage3D
glCopyBufferSubData
glCopyImageSubData
glCopyNamedBufferSubData
glCopyPixels
glCopyTexImage1D
glCopyTexImage2D
glCopyTexSubImage1D
glCopyTexSubImage2D
glCopyTexSubImage3D
glCopyTextureSubImage1D
glCopyTextureSubImage2D
glCopyTextureSubImage3D
glCreateBuffers
glCreateFramebuffers
glCreateProgram
glCreateProgramPipelines
glCreateQueries
glCreateRenderbuffers
glCreateSamplers
glCreateShader
glCreateShaderProgramv
glCreateTextures
glCreateTransformFeedbacks
glCreateVertexArrays
glCullFace
glDebugMessageCallback
glDebugMessageControl
glDebugMessageInsert
glDeleteBuffers
glDeleteFramebuffers
glDeleteLists
glDeleteProgram
glDeleteProgramPipelines
glDeleteQueries
glDeleteRenderbuffers
glDeleteSamplers
glDeleteShader
glDeleteSync
glDeleteTextures
glDeleteTransformFeedbacks
glDeleteVertexArrays
glDepthFunc
glDepthMask
glDepthRange
glDepthRangeArrayv
glDepthRangeIndexed
glDepthRangef
glDetachShader
glDisable
glDisableClientState
glDisableVertexArrayAttrib
glDisableVertexAttribArray
glDisablei
glDispatchCompute
glDispatchComputeIndirect
glDrawArrays
glDrawArraysIndirect
glDrawArraysInstanced
glDrawArraysInstancedBaseInstance
glDrawBuffer
glDrawBuffers
glDrawElements
glDrawElementsBaseVertex
glDrawElementsIndirect
glDrawElementsInstanced
glDrawElementsInstancedBaseInstance
glDrawElementsInstancedBaseVertex
glDrawElementsInstancedBaseVertexBaseInstance
glDrawPixels
glDrawRangeElements
glDrawRangeElementsBaseVertex
glDrawTransformFeedback
glDrawTransformFeedbackInstanced
glDrawTransformFeedbackStream
glDrawTransformFeedbackStreamInstanced
glEdgeFlag
glEdgeFlagPointer
glEdgeFlagv
glEnable
glEnableClientState
glEnableVertexArrayAttrib
glEnableVertexAttribArray
glEnablei
glEnd
glEndConditionalRender
glEndList
glEndQuery
glEndQueryIndexed
glEndTransformFeedback
glEvalCoord1d
glEvalCoord1dv
glEvalCoord1f
glEvalCoord1fv
glEvalCoord2d
glEvalCoord2dv
glEvalCoord2f
glEvalCoord2fv
glEvalMesh1
glEvalMesh2
glEvalPoint1
glEvalPoint2
glFeedbackBuffer
glFenceSync
glFinish
glFlush
glFlushMappedBufferRange
glFlushMappedNamedBufferRange
glFogCoordPointer
glFogCoordd
glFogCoorddv
glFogCoordf
glFogCoordfv
glFogf
glFogfv
glFogi
glFogiv
glFramebufferParameteri
glFramebufferRenderbuffer
glFramebufferTexture
glFramebufferTexture1D
glFramebufferTexture2D
glFramebufferTexture3D
glFramebufferTextureLayer
glFrontFace
glFrustum
glGenBuffers
glGenFramebuffers
glGenLists
glGenProgramPipelines
glGenQueries
glGenRenderbuffers
glGenSamplers
glGenTextures
glGenTransformFeedbacks
glGenVertexArrays
glGenerateMipmap
glGenerateTextureMipmap
glGetActiveAtomicCounterBufferiv
glGetActiveAttrib
glGetActiveSubroutineName
glGetActiveSubroutineUniformName
glGetActiveSubroutineUniformiv
glGetActiveUniform
glGetActiveUniformBlockName
glGetActiveUniformBlockiv
glGetActiveUniformName
glGetActiveUniformsiv
glGetAttachedShaders
glGetAttribLocation
glGetBooleani_v
glGetBooleanv
glGetBufferParameteri64v
glGetBufferParameteriv
glGetBufferPointerv
glGetBufferSubData
glGetClipPlane
glGetCompressedTexImage
glGetCompressedTextureImage
glGetCompressedTextureSubImage
glGetDebugMessageLog
glGetDoublei_v
glGetDoublev
glGetError
glGetFloati_v
glGetFloatv
glGetFragDataIndex
glGetFragDataLocation
glGetFramebufferAttachmentParameteriv
glGetFramebufferParameteriv
glGetGraphicsResetStatus
glGetInteger64i_v
glGetInteger64v
glGetIntegeri_v
glGetIntegerv
glGetInternalformati64v
glGetInternalformativ
glGetLightfv
glGetLightiv
glGetMapdv
glGetMapfv
glGetMapiv
glGetMaterialfv
glGetMaterialiv
glGetMultisamplefv
glGetNamedBufferParameteri64v
glGetNamedBufferParameteriv
glGetNamedBufferPointerv
glGetNamedBufferSubData
glGetNamedFramebufferAttachmentParameteriv
glGetNamedFramebufferParameteriv
glGetNamedRenderbufferParameteriv
glGetObjectLabel
glGetObjectPtrLabel
glGetPixelMapfv
glGetPixelMapuiv
glGetPixelMapusv
glGetPointerv
glGetPolygonStipple
glGetProgramBinary
glGetProgramInfoLog
glGetProgramInterfaceiv
glGetProgramPipelineInfoLog
glGetProgramPipelineiv
glGetProgramResourceIndex
glGetProgramResourceLocation
glGetProgramResourceLocationIndex
glGetProgramResourceName
glGetProgramResourceiv
glGetProgramStageiv
glGetProgramiv
glGetQueryBufferObjecti64v
glGetQueryBufferObjectiv
glGetQueryBufferObjectui64v
glGetQueryBufferObjectuiv
glGetQueryIndexediv
glGetQueryObjecti64v
glGetQueryObjectiv
glGetQueryObjectui64v
glGetQueryObjectuiv
glGetQueryiv
glGetRenderbufferParameteriv
glGetSamplerParameterIiv
glGetSamplerParameterIuiv
glGetSamplerParameterfv
glGetSamplerParameteriv
glGetShaderInfoLog
glGetShaderPrecisionFormat
glGetShaderSource
glGetShaderiv
glGetString
glGetStringi
glGetSubroutineIndex
glGetSubroutineUniformLocation
glGetSynciv
glGetTexEnvfv
glGetTexEnviv
glGetTexGendv
glGetTexGenfv
glGetTexGeniv
glGetTexImage
glGetTexLevelParameterfv
glGetTexLevelParameteriv
glGetTexParameterIiv
glGetTexParameterIuiv
glGetTexParameterfv
glGetTexParameteriv
glGetTextureImage
glGetTextureLevelParameterfv
glGetTextureLevelParameteriv
glGetTextureParameterIiv
glGetTextureParameterIuiv
glGetTextureParameterfv
glGetTextureParameteriv
glGetTextureSubImage
glGetTransformFeedbackVarying
glGetTransformFeedbacki64_v
glGetTransformFeedbacki_v
glGetTransformFeedbackiv
glGetUniformBlockIndex
glGetUniformIndices
glGetUniformLocation
glGetUniformSubroutineuiv
glGetUniformdv
glGetUniformfv
glGetUniformiv
glGetUniformuiv
glGetVertexArrayIndexed64iv
glGetVertexArrayIndexediv
glGetVertexArrayiv
glGetVertexAttribIiv
glGetVertexAttribIuiv
glGetVertexAttribLdv
glGetVertexAttribPointerv
glGetVertexAttribdv
glGetVertexAttribfv
glGetVertexAttribiv
glGetnColorTable
glGetnCompressedTexImage
glGetnConvolutionFilter
glGetnHistogram
glGetnMapdv
glGetnMapfv
glGetnMapiv
glGetnMinmax
glGetnPixelMapfv
glGetnPixelMapuiv
glGetnPixelMapusv
glGetnPolygonStipple
glGetnSeparableFilter
glGetnTexImage
glGetnUniformdv
glGetnUniformfv
glGetnUniformiv
glGetnUniformuiv
glHint
glIndexMask
glIndexPointer
glIndexd
glIndexdv
glIndexf
glIndexfv
glIndexi
glIndexiv
glIndexs
glIndexsv
glIndexub
glIndexubv
glInitNames
glInterleavedArrays
glInvalidateBufferData
glInvalidateBufferSubData
glInvalidateFramebuffer
glInvalidateNamedFramebufferData
glInvalidateNamedFramebufferSubData
glInvalidateSubFramebuffer
glInvalidateTexImage
glInvalidateTexSubImage
glIsBuffer
glIsEnabled
glIsEnabledi
glIsFramebuffer
glIsList
glIsProgram
glIsProgramPipeline
glIsQuery
glIsRenderbuffer
glIsSampler
glIsShader
glIsSync
glIsTexture
glIsTransformFeedback
glIsVertexArray
glLightModelf
glLightModelfv
glLightModeli
glLightModeliv
glLightf
glLightfv
glLighti
glLightiv
glLineStipple
glLineWidth
glLinkProgram
glListBase
glLoadIdentity
glLoadMatrixd
glLoadMatrixf
glLoadName
glLoadTransposeMatrixd
glLoadTransposeMatrixf
glLogicOp
glMap1d
glMap1f
glMap2d
glMap2f
glMapBuffer
glMapBufferRange
glMapGrid1d
glMapGrid1f
glMapGrid2d
glMapGrid2f
glMapNamedBuffer
glMapNamedBufferRange
glMaterialf
glMaterialfv
glMateriali
glMaterialiv
glMatrixMode
glMemoryBarrier
glMemoryBarrierByRegion
glMinSampleShading
glMultMatrixd
glMultMatrixf
glMultTransposeMatrixd
glMultTransposeMatrixf
glMultiDrawArrays
glMultiDrawArraysIndirect
glMultiDrawElements
glMultiDrawElementsBaseVertex
glMultiDrawElementsIndirect
glMultiTexCoord1d
glMultiTexCoord1dv
glMultiTexCoord1f
glMultiTexCoord1fv
glMultiTexCoord1i
glMultiTexCoord1iv
glMultiTexCoord1s
glMultiTexCoord1sv
glMultiTexCoord2d
glMultiTexCoord2dv
glMultiTexCoord2f
glMultiTexCoord2fv
glMultiTexCoord2i
glMultiTexCoord2iv
glMultiTexCoord2s
glMultiTexCoord2sv
glMultiTexCoord3d
glMultiTexCoord3dv
glMultiTexCoord3f
glMultiTexCoord3fv
glMultiTexCoord3i
glMultiTexCoord3iv
glMultiTexCoord3s
glMultiTexCoord3sv
glMultiTexCoord4d
glMultiTexCoord4dv
glMultiTexCoord4f
glMultiTexCoord4fv
glMultiTexCoord4i
glMultiTexCoord4iv
glMultiTexCoord4s
glMultiTexCoord4sv
glMultiTexCoordP1ui
glMultiTexCoordP1uiv
glMultiTexCoordP2ui
glMultiTexCoordP2uiv
glMultiTexCoordP3ui
glMultiTexCoordP3uiv
glMultiTexCoordP4ui
glMultiTexCoordP4uiv
glNamedBufferData
glNamedBufferStorage
glNamedBufferSubData
glNamedFramebufferDrawBuffer
glNamedFramebufferDrawBuffers
glNamedFramebufferParameteri
glNamedFramebufferReadBuffer
glNamedFramebufferRenderbuffer
glNamedFramebufferTexture
glNamedFramebufferTextureLayer
glNamedRenderbufferStorage
glNamedRenderbufferStorageMultisample
glNewList
glNormal3b
glNormal3bv
glNormal3d
glNormal3dv
glNormal3f
glNormal3fv
glNormal3i
glNormal3iv
glNormal3s
glNormal3sv
glNormalP3ui
glNormalP3uiv
glNormalPointer
glObjectLabel
glObjectPtrLabel
glOrtho
glPassThrough
glPatchParameterfv
glPatchParameteri
glPauseTransformFeedback
glPixelMapfv
glPixelMapuiv
glPixelMapusv
glPixelStoref
glPixelStorei
glPixelTransferf
glPixelTransferi
glPixelZoom
glPointParameterf
glPointParameterfv
glPointParameteri
glPointParameteriv
glPointSize
glPolygonMode
glPolygonOffset
glPolygonStipple
glPopAttrib
glPopClientAttrib
glPopDebugGroup
glPopMatrix
glPopName
glPrimitiveRestartIndex
glPrioritizeTextures
glProgramBinary
glProgramParameteri
glProgramUniform1d
glProgramUniform1dv
glProgramUniform1f
glProgramUniform1fv
glProgramUniform1i
glProgramUniform1iv
glProgramUniform1ui
glProgramUniform1uiv
glProgramUniform2d
glProgramUniform2dv
glProgramUniform2f
glProgramUniform2fv
glProgramUniform2i
glProgramUniform2iv
glProgramUniform2ui
glProgramUniform2uiv
glProgramUniform3d
glProgramUniform3dv
glProgramUniform3f
glProgramUniform3fv
glProgramUniform3i
glProgramUniform3iv
glProgramUniform3ui
glProgramUniform3uiv
glProgramUniform4d
glProgramUniform4dv
glProgramUniform4f
glProgramUniform4fv
glProgramUniform4i
glProgramUniform4iv
glProgramUniform4ui
glProgramUniform4uiv
glProgramUniformMatrix2dv
glProgramUniformMatrix2fv
glProgramUniformMatrix2x3dv
glProgramUniformMatrix2x3fv
glProgramUniformMatrix2x4dv
glProgramUniformMatrix2x4fv
glProgramUniformMatrix3dv
glProgramUniformMatrix3fv
glProgramUniformMatrix3x2dv
glProgramUniformMatrix3x2fv
glProgramUniformMatrix3x4dv
glProgramUniformMatrix3x4fv
glProgramUniformMatrix4dv
glProgramUniformMatrix4fv
glProgramUniformMatrix4x2dv
glProgramUniformMatrix4x2fv
glProgramUniformMatrix4x3dv
glProgramUniformMatrix4x3fv
glProvokingVertex
glPushAttrib
glPushClientAttrib
glPushDebugGroup
glPushMatrix
glPushName
glQueryCounter
glRasterPos2d
glRasterPos2dv
glRasterPos2f
glRasterPos2fv
glRasterPos2i
glRasterPos2iv
glRasterPos2s
glRasterPos2sv
glRasterPos3d
glRasterPos3dv
glRasterPos3f
glRasterPos3fv
glRasterPos3i
glRasterPos3iv
glRasterPos3s
glRasterPos3sv
glRasterPos4d
glRasterPos4dv
glRasterPos4f
glRasterPos4fv
glRasterPos4i
glRasterPos4iv
glRasterPos4s
glRasterPos4sv
glReadBuffer
glReadPixels
glReadnPixels
glRectd
glRectdv
glRectf
glRectfv
glRecti
glRectiv
glRects
glRectsv
glReleaseShaderCompiler
glRenderMode
glRenderbufferStorage
glRenderbufferStorageMultisample
glResumeTransformFeedback
glRotated
glRotatef
glSampleCoverage
glSampleMaski
glSamplerParameterIiv
glSamplerParameterIuiv
glSamplerParameterf
glSamplerParameterfv
glSamplerParameteri
glSamplerParameteriv
glScaled
glScalef
glScissor
glScissorArrayv
glScissorIndexed
glScissorIndexedv
glSecondaryColor3b
glSecondaryColor3bv
glSecondaryColor3d
glSecondaryColor3dv
glSecondaryColor3f
glSecondaryColor3fv
glSecondaryColor3i
glSecondaryColor3iv
glSecondaryColor3s
glSecondaryColor3sv
glSecondaryColor3ub
glSecondaryColor3ubv
glSecondaryColor3ui
glSecondaryColor3uiv
glSecondaryColor3us
glSecondaryColor3usv
glSecondaryColorP3ui
glSecondaryColorP3uiv
glSecondaryColorPointer
glSelectBuffer
glShadeModel
glShaderBinary
glShaderSource
glShaderStorageBlockBinding
glStencilFunc
glStencilFuncSeparate
glStencilMask
glStencilMaskSeparate
glStencilOp
glStencilOpSeparate
glTexBuffer
glTexBufferRange
glTexCoord1d
glTexCoord1dv
glTexCoord1f
glTexCoord1fv
glTexCoord1i
glTexCoord1iv
glTexCoord1s
glTexCoord1sv
glTexCoord2d
glTexCoord2dv
glTexCoord2f
glTexCoord2fv
glTexCoord2i
glTexCoord2iv
glTexCoord2s
glTexCoord2sv
glTexCoord3d
glTexCoord3dv
glTexCoord3f
glTexCoord3fv
glTexCoord3i
glTexCoord3iv
glTexCoord3s
glTexCoord3sv
glTexCoord4d
glTexCoord4dv
glTexCoord4f
glTexCoord4fv
glTexCoord4i
glTexCoord4iv
glTexCoord4s
glTexCoord4sv
glTexCoordP1ui
glTexCoordP1uiv
glTexCoordP2ui
glTexCoordP2uiv
glTexCoordP3ui
glTexCoordP3uiv
glTexCoordP4ui
glTexCoordP4uiv
glTexCoordPointer
glTexEnvf
glTexEnvfv
glTexEnvi
glTexEnviv
glTexGend
glTexGendv
glTexGenf
glTexGenfv
glTexGeni
glTexGeniv
glTexImage1D
glTexImage2D
glTexImage2DMultisample
glTexImage3D
glTexImage3DMultisample
glTexParameterIiv
glTexParameterIuiv
glTexParameterf
glTexParameterfv
glTexParameteri
glTexParameteriv
glTexStorage1D
glTexStorage2D
glTexStorage2DMultisample
glTexStorage3D
glTexStorage3DMultisample
glTexSubImage1D
glTexSubImage2D
glTexSubImage3D
glTextureBarrier
glTextureBuffer
glTextureBufferRange
glTextureParameterIiv
glTextureParameterIuiv
glTextureParameterf
glTextureParameterfv
glTextureParameteri
glTextureParameteriv
glTextureStorage1D
glTextureStorage2D
glTextureStorage2DMultisample
glTextureStorage3D
glTextureStorage3DMultisample
glTextureSubImage1D
glTextureSubImage2D
glTextureSubImage3D
glTextureView
glTransformFeedbackBufferBase
glTransformFeedbackBufferRange
glTransformFeedbackVaryings
glTranslated
glTranslatef
glUniform1d
glUniform1dv
glUniform1f
glUniform1fv
glUniform1i
glUniform1iv
glUniform1ui
glUniform1uiv
glUniform2d
glUniform2dv
glUniform2f
glUniform2fv
glUniform2i
glUniform2iv
glUniform2ui
glUniform2uiv
glUniform3d
glUniform3dv
glUniform3f
glUniform3fv
glUniform3i
glUniform3iv
glUniform3ui
glUniform3uiv
glUniform4d
glUniform4dv
glUniform4f
glUniform4fv
glUniform4i
glUniform4iv
glUniform4ui
glUniform4uiv
glUniformBlockBinding
glUniformMatrix2dv
glUniformMatrix2fv
glUniformMatrix2x3dv
glUniformMatrix2x3fv
glUniformMatrix2x4dv
glUniformMatrix2x4fv
glUniformMatrix3dv
glUniformMatrix3fv
glUniformMatrix3x2dv
glUniformMatrix3x2fv
glUniformMatrix3x4dv
glUniformMatrix3x4fv
glUniformMatrix4dv
glUniformMatrix4fv
glUniformMatrix4x2dv
glUniformMatrix4x2fv
glUniformMatrix4x3dv
glUniformMatrix4x3fv
glUniformSubroutinesuiv
glUnmapBuffer
glUnmapNamedBuffer
glUseProgram
glUseProgramStages
glValidateProgram
glValidateProgramPipeline
glVertex2d
glVertex2dv
glVertex2f
glVertex2fv
glVertex2i
glVertex2iv
glVertex2s
glVertex2sv
glVertex3d
glVertex3dv
glVertex3f
glVertex3fv
glVertex3i
glVertex3iv
glVertex3s
glVertex3sv
glVertex4d
glVertex4dv
glVertex4f
glVertex4fv
glVertex4i
glVertex4iv
glVertex4s
glVertex4sv
glVertexArrayAttribBinding
glVertexArrayAttribFormat
glVertexArrayAttribIFormat
glVertexArrayAttribLFormat
glVertexArrayBindingDivisor
glVertexArrayElementBuffer
glVertexArrayVertexBuffer
glVertexArrayVertexBuffers
glVertexAttrib1d
glVertexAttrib1dv
glVertexAttrib1f
glVertexAttrib1fv
glVertexAttrib1s
glVertexAttrib1sv
glVertexAttrib2d
glVertexAttrib2dv
glVertexAttrib2f
glVertexAttrib2fv
glVertexAttrib2s
glVertexAttrib2sv
glVertexAttrib3d
glVertexAttrib3dv
glVertexAttrib3f
glVertexAttrib3fv
glVertexAttrib3s
glVertexAttrib3sv
glVertexAttrib4Nbv
glVertexAttrib4Niv
glVertexAttrib4Nsv
glVertexAttrib4Nub
glVertexAttrib4Nubv
glVertexAttrib4Nuiv
glVertexAttrib4Nusv
glVertexAttrib4bv
glVertexAttrib4d
glVertexAttrib4dv
glVertexAttrib4f
glVertexAttrib4fv
glVertexAttrib4iv
glVertexAttrib4s
glVertexAttrib4sv
glVertexAttrib4ubv
glVertexAttrib4uiv
glVertexAttrib4usv
glVertexAttribBinding
glVertexAttribDivisor
glVertexAttribFormat
glVertexAttribI1i
glVertexAttribI1iv
glVertexAttribI1ui
glVertexAttribI1uiv
glVertexAttribI2i
glVertexAttribI2iv
glVertexAttribI2ui
glVertexAttribI2uiv
glVertexAttribI3i
glVertexAttribI3iv
glVertexAttribI3ui
glVertexAttribI3uiv
glVertexAttribI4bv
glVertexAttribI4i
glVertexAttribI4iv
glVertexAttribI4sv
glVertexAttribI4ubv
glVertexAttribI4ui
glVertexAttribI4uiv
glVertexAttribI4usv
glVertexAttribIFormat
glVertexAttribIPointer
glVertexAttribL1d
glVertexAttribL1dv
glVertexAttribL2d
glVertexAttribL2dv
glVertexAttribL3d
glVertexAttribL3dv
glVertexAttribL4d
glVertexAttribL4dv
glVertexAttribLFormat
glVertexAttribLPointer
glVertexAttribP1ui
glVertexAttribP1uiv
glVertexAttribP2ui
glVertexAttribP2uiv
glVertexAttribP3ui
glVertexAttribP3uiv
glVertexAttribP4ui
glVertexAttribP4uiv
glVertexAttribPointer
glVertexBindingDivisor
glVertexP2ui
glVertexP2uiv
glVertexP3ui
glVertexP3uiv
glVertexP4ui
glVertexP4uiv
glVertexPointer
glViewport
glViewportArrayv
glViewportIndexedf
glViewportIndexedfv
glWaitSync
glWindowPos2d
glWindowPos2dv
glWindowPos2f
glWindowPos2fv
glWindowPos2i
glWindowPos2iv
glWindowPos2s
glWindowPos2sv
glWindowPos3d
glWindowPos3dv
glWindowPos3f
glWindowPos3fv
glWindowPos3i
glWindowPos3iv
glWindowPos3s
glWindowPos3sv
{% endblock %}
