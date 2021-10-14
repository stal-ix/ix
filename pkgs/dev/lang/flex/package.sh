{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://github.com/westes/flex/files/981163/flex-2.6.4.tar.gz
# md5 2882e3179748cc9f9c23ec593d6adc8d
{% endblock %}

{% block deps %}
# bld dev/lang/m4 dev/build/make env/std boot/final/env/bison
{% endblock %}
