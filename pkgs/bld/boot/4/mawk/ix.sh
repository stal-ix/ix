{% extends '//bin/mawk/ix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/4/byacc
bld/boot/3/env
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/bin && ln -s mawk awk
{% endblock %}
