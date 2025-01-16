{% extends '//bin/ya/final/unwrap/ix.sh' %}

{% block ya_platform %}
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/prepend
{% endblock %}

{% block patch %}
{{super()}}
prepend build/ymake_conf.py << EOF
import os
os.environ["FREESTANDING_CLANG"] = "${FREESTANDING_CLANG}"
os.environ["CLANG_HEADERS"] = "${CLANG_HEADERS}"
EOF
sed -e 's|.*__future__.*||' -i build/ymake_conf.py
{% endblock %}

{% block ya_make_targets %}
devtools/local_cache/toolscache/server/ya-tc
devtools/ya/bin/ya-bin
devtools/ya/test/programs/test_tool/bin/test_tool
devtools/yexport/bin/yexport
devtools/ymake/bin/ymake
{% endblock %}
