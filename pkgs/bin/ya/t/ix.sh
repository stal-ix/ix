{% extends '//die/c/ya.sh' %}

{% block bld_tool %}
bin/ya/java
{{super()}}
{% endblock %}

{% block ya_make_flags %}
{% if linux %}
MUSL=yes
{% endif %}
HAVE_CUDA=no
EMBED_SBOM=no
USE_ICONV=static
YMAKE_USE_PY3=yes
YA_OPENSOURCE=yes
OPENSOURCE_PROJECT=ya
YMAKE_EXCLUDE_IDL_TOOL=yes
USE_SYSTEM_JDK=${YA_JAVA_DIR}
SANDBOXING=no
NEED_PLATFORM_PEERDIRS=yes
{% endblock %}

{% block patch %}
sed -e 's|.*--ld-path.*||' -i build/platform/lld/ya.make
{% endblock %}
