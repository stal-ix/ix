{% extends '//tool/text/mawk/mix.sh' %}

{% block bld_deps %}
boot/stage/4/byacc/mix.sh
boot/stage/3/env/mix.sh
{% endblock %}

{% block postinstall %}
cd ${out}/bin && ln -s mawk awk
{% endblock %}
