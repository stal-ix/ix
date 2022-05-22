{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/sctplab/usrsctp/archive/refs/tags/0.9.5.0.tar.gz
sha:260107caf318650a57a8caa593550e39bca6943e93f970c80d6c17e59d62cd92
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
