{% extends '//lib/heif/t/t/ix.sh' %}

{% block bld_libs %}
lib/shim/mutex
lib/c++
lib/aom
lib/c
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|^#include <future>$|#if ENABLE_PARALLEL_TILE_DECODING\n#include <future>\n#endif|' \
    -i libheif/context.cc libheif/image-items/grid.cc
grep -q "ENABLE_PARALLEL_TILE_DECODING" libheif/context.cc
sed -e '/^Error HeifFile::read_from_file(const char\* input_filename)$/,/^}$/c\
Error HeifFile::read_from_file(const char* input_filename)\
{\
  (void) input_filename;\
  return Error(heif_error_Input_does_not_exist, heif_suberror_Unspecified, "no files on the sandbox");\
}' -i libheif/file.cc
grep -q "no files on the sandbox" libheif/file.cc
sed -e '/^static heif_error heif_file_writer_write(heif_context\* ctx,$/,/^}$/c\
static heif_error heif_file_writer_write(heif_context* ctx, const void* data, size_t size, void* userdata)\
{\
  (void) data;\
  (void) size;\
  (void) userdata;\
  return Error(heif_error_Unsupported_feature, heif_suberror_Unspecified, "no files on the sandbox").error_struct(ctx->context.get());\
}' -i libheif/api/libheif/heif_context.cc
grep -q "no files on the sandbox" libheif/api/libheif/heif_context.cc
sed -e 's|m_tmpfile_fd = mkstemp(m_tmp_filename);|m_tmpfile_fd = -1;|' -i libheif/box.cc
grep -q "m_tmpfile_fd = -1;" libheif/box.cc
{% endblock %}

{% block cmake_flags %}
{{super()}}
WITH_EXAMPLES=OFF
WITH_LIBDE265=OFF
WITH_X265=OFF
WITH_X264=OFF
WITH_OpenH264_DECODER=OFF
WITH_DAV1D=OFF
WITH_SvtEnc=OFF
WITH_AOM_DECODER=ON
WITH_AOM_ENCODER=OFF
WITH_LIBSHARPYUV=OFF
WITH_GDK_PIXBUF=OFF
BUILD_TESTING=OFF
BUILD_DOCUMENTATION=OFF
ENABLE_MULTITHREADING_SUPPORT=OFF
ENABLE_PARALLEL_TILE_DECODING=OFF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*Libs.*stdc.*||' -i ${out}/lib/pkgconfig/libheif.pc
{% endblock %}
