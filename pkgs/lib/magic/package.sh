{% extends '//gnu/file/package.sh' %}

{% block deps %}
# bld dev/build/make/package.sh
# bld env/std/package.sh
{% endblock %}

{% block postinstall %}
rm -rf ${out}/bin
{% endblock %}
