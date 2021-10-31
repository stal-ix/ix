{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/westes/flex/files/981163/flex-2.6.4.tar.gz
# md5 2882e3179748cc9f9c23ec593d6adc8d
{% endblock %}

{% block deps %}
# lib dev/lang/m4/package.sh
# bld dev/build/make/package.sh
# bld dev/doc/texinfo/package.sh
# bld env/std/package.sh
# bld boot/final/env/bison/package.sh
{% endblock %}
