{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/void-linux/musl-obstack/archive/refs/tags/v1.2.2.tar.gz
# md5 edee8cb45ca351de5759b85f2aca0f3b
{% endblock %}

{% block deps %}
# bld dev/build/automake/1.16.3 dev/build/make dev/build/pkg-config env/std
{% endblock %}

{% block autoreconf %}
dash ./bootstrap.sh
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -lobstack \${LDFLAGS}"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\${PKG_CONFIG_PATH}"
{% endblock %}
