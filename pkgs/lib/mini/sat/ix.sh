{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/msoos/minisat/archive/refs/tags/2.2.1.tar.gz
sha:2cd8e9282d0f50f6bdac2cd001c95f66c1de9b2dec61391652c68729c347290f
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block patch %}
sed -e 's|.*include.*fpu_control.*||' -i minisat/utils/System.h
{% endblock %}
