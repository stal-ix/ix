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
lib/googletest
{{super()}}
{% endblock %}

{% block cmake_flags %}
JPEGXL_ENABLE_TOOLS=ON
{{super()}}
{% endblock %}
