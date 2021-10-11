{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/void-linux/musl-fts/archive/refs/tags/v1.2.7.tar.gz
# md5 bce0b5de0cf2519a74fbfacead60369d
{% endblock %}

{% block deps %}
# bld dev/build/automake/1.16.3 dev/build/make dev/build/pkg-config env/std
{% endblock %}

{% block autoreconf %}
dash ./bootstrap.sh
{% endblock %}

{% block env %}
export LDFLAGS="-L${out}/lib -lfts \${LDFLAGS}"
{% endblock %}
