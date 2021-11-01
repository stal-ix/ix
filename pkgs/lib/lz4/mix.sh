{% extends '//mix/template/make.sh' %}

{% block fetch %}
# url https://github.com/lz4/lz4/archive/refs/tags/v1.9.3.tar.gz
# md5 3a1ab1684e14fc1afc66228ce61b2db3
{% endblock %}

{% block bld_deps %}
dev/build/make/mix.sh
env/tools/mix.sh
env/c/mix.sh
env/bootstrap/package.py
{% endblock %}

{% block make_flags %}
BUILD_SHARED=no
{% endblock %}

{% block make_target %}
allmost
{% endblock %}
