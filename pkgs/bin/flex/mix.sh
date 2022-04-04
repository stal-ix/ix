{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://github.com/westes/flex/files/981163/flex-2.6.4.tar.gz
2882e3179748cc9f9c23ec593d6adc8d
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block run_deps %}
bld/m4
{% endblock %}

{% block std_box %}
bld/m4
bld/texinfo
bld/bootbox
{% endblock %}
