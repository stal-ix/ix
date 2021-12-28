{% extends '//tool/text/mawk/mix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/4/byacc
boot/3/env
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/bin && ln -s mawk awk
{% endblock %}
