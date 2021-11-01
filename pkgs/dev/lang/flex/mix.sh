{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/westes/flex/files/981163/flex-2.6.4.tar.gz
# md5 2882e3179748cc9f9c23ec593d6adc8d
{% endblock %}

{% block lib_deps %}
dev/lang/m4/mix.sh
{% endblock %}

{% block bld_deps %}
dev/build/make/mix.sh
dev/doc/texinfo/mix.sh
env/std/mix.sh
boot/final/env/bison/mix.sh
{% endblock %}
