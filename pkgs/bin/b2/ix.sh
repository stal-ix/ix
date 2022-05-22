{% extends '//bin/b2/t/ix.sh' %}

{% block bld_tool %}
bld/b2
{{super()}}
{% endblock %}

{% block build %}
b2 b2 variant=release
cp $(find . -type f -name b2) src/engine/
{% endblock %}

{% block install %}
b2 install --prefix=${out}
{% endblock %}
