{% extends '//gnu/file/mix.sh' %}

{% block bld_deps %}
dev/build/make/mix.sh
env/std/mix.sh
{% endblock %}

{% block postinstall %}
rm -rf ${out}/bin
{% endblock %}
