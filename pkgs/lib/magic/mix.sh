{% extends '//gnu/file/mix.sh' %}

{% block bld_deps %}
env/autohell/mix.sh
{% endblock %}

{% block postinstall %}
rm -rf ${out}/bin
{% endblock %}
