{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libtomcrypt
{% endblock %}

{% block version %}
1.18.2
{% endblock %}

{% block fetch %}
https://github.com/libtom/libtomcrypt/releases/download/v{{self.version().strip()}}/crypt-{{self.version().strip()}}.tar.xz
96ad4c3b8336050993c5bc2cf6c057484f2b0f9f763448151567fbab5e767b84
{% endblock %}

{% block lib_deps %}
lib/c
lib/tom/math
{% endblock %}

{% block cpp_defines %}
USE_LTM
LTM_DESC
{% endblock %}

{% block build_flags %}
{% if darwin %}
shut_up
{% endif %}
{% endblock %}
