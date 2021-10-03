{% extends '//tool/gnu/file/package.sh' %}

{% block deps %}
# bld dev/build/make env/std
{% endblock %}

{% block postinstall %}
rm -rf ${out}/bin
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -lmagic \${LDFLAGS}"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\${PKG_CONFIG_PATH}"
{% endblock %}
