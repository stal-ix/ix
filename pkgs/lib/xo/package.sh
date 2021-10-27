{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/Juniper/libxo/archive/refs/tags/1.6.0.tar.gz
# md5 6d29d5ca45cb469b9ccd3bb962dbee5a
{% endblock %}

{% block deps %}
# bld lib/c dev/build/automake/1.16.3 dev/build/make dev/build/pkg-config env/std
{% endblock %}

{% block autoreconf %}
dash ./bin/setup.sh
{% endblock %}
