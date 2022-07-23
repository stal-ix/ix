{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/upx
bld/pack/scripts
# implicit llvm-strip dep
{% endblock %}
