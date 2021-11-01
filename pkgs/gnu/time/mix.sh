{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/time/time-1.9.tar.gz
# md5 d2356e0fe1c0b85285d83c6b2ad51b5f
{% endblock %}

{% block bld_deps %}
dev/build/make/mix.sh
env/std/mix.sh
{% endblock %}
