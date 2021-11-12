{% extends '//tool/text/mawk/mix.sh' %}

{% block bld_deps %}
boot/4/byacc/mix.sh
boot/3/env/mix.sh
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/bin && ln -s mawk awk
{% endblock %}
