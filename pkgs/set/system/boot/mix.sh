{% extends '//mix/template/hub.sh' %}

{% block run_deps %}
set/fs
bin/ted
bin/git
bin/wget
bld/python
bld/compiler
set/compress
bin/mc/slang
{% endblock %}
