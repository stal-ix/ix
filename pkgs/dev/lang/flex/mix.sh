{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/westes/flex/files/981163/flex-2.6.4.tar.gz
2882e3179748cc9f9c23ec593d6adc8d
{% endblock %}

{% block bld_libs %}
lib/c/mix.sh
{% endblock %}

{% block run_deps %}
dev/lang/m4/mix.sh
{% endblock %}

{% block bld_tool %}
dev/lang/m4/mix.sh
dev/doc/texinfo/mix.sh
dev/lang/bison/3/boot/mix.sh
{% endblock %}
