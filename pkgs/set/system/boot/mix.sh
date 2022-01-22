{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
set/fs
bin/ted
bin/git
bin/wget
bin/strace
bld/compiler
set/compress
bin/mc/slang
lib/python/3/10
{% endblock %}
