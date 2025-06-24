{% extends '//die/c/ya.sh' %}

{% block git_repo %}
https://github.com/yandex/yatool
{% endblock %}

{% block bld_tool %}
bin/ya/tools/java
{{super()}}
{% endblock %}

{% block ya_c_flags %}
-Wno-error
{% endblock %}

{% block ya_make_targets %}
devtools/ymake/bin/ymake
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
{% endblock %}

{% block patch %}
sed -e 's|.*--ld-path.*||' -i build/platform/lld/ya.make
{% endblock %}
