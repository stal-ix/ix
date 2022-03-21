{% extends '//mix/dlstubs.sh' %}

{% block lib_deps %}
lib/mesa
{% endblock %}

{% block export_symbols_sh %}
llvm-nm ${lib_mesa}/lib/libfullgl.a | grep ' gl' | grep -v '_gl'
{% endblock %}

{% block export_lib %}
GL
{% endblock %}
