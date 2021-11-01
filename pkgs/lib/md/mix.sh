{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://libbsd.freedesktop.org/releases/libmd-1.0.4.tar.xz
# md5 e8e955f8d53d2c9306b07c90ff6ae395
{% endblock %}

{% block bld_deps %}
dev/build/make/mix.sh
env/std/mix.sh
{% endblock %}
