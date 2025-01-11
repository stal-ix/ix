{% extends '//die/c/ya.sh' %}

{% block bld_tool %}
bin/ya/java
bld/prepend
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
{% endblock %}

{% block patch %}
{{super()}}
prepend build/ymake_conf.py << EOF
import os
os.environ["FREESTANDING_CLANG"] = "${FREESTANDING_CLANG}"
os.environ["CLANG_HEADERS"] = "${CLANG_HEADERS}"
EOF
sed -e 's|.*from.*__future__.*||' \
    -i build/ymake_conf.py
{% endblock %}
