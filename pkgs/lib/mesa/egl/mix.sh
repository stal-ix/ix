{% extends '//mix/template/dlstubs.sh' %}

{% block lib_deps %}
lib/mesa
{% endblock %}

{% block export_symbols_sh %}
llvm-nm ${lib_mesa}/lib/libfullgl.a | grep egl | grep -v '_egl'
{% endblock %}

{% block export_lib %}
EGL
{% endblock %}
