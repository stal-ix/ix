{% extends '//bin/b2/t/mix.sh' %}

{% block bld_tool %}
bin/b2/boot
{{super()}}
{% endblock %}

{% block build %}
b2 b2 variant=release
cp $(find . -type f -name b2) src/engine/
{% endblock %}

{% block install %}
b2 install --prefix=${out}
{% endblock %}
