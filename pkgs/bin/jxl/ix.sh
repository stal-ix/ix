{% extends '//lib/jxl/t/ix.sh' %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}

{% block bld_libs %}
lib/jpeg
lib/giflib
lib/gflags
lib/openexr
{{super()}}
{% endblock %}

{% block cmake_flags %}
JPEGXL_ENABLE_MANPAGES=OFF
JPEGXL_ENABLE_JNI=OFF
JPEGXL_ENABLE_DOXYGEN=OFF
JPEGXL_ENABLE_TOOLS=ON
JPEGXL_ENABLE_VIEWERS=ON
JPEGXL_FORCE_SYSTEM_GTEST=ON
JPEGXL_FORCE_SYSTEM_HWY=ON
{{super()}}
{% endblock %}
