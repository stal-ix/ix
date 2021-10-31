{% extends '//gnu/file/mix.sh' %}

{% block deps %}
# bld dev/build/make/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block postinstall %}
rm -rf ${out}/bin
{% endblock %}
