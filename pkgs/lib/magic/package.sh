{% extends '//tool/gnu/file/package.sh' %}

{% block deps %}
# bld dev/build/make env/std
{% endblock %}

{% block postinstall %}
rm -rf ${out}/bin
{% endblock %}

{% block env %}
export LDFLAGS="-L${out}/lib -lmagic \${LDFLAGS}"
{% endblock %}
