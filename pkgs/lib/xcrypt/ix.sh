{% extends '//die/c/autorehell.sh'%}

{% block fetch %}
https://github.com/besser82/libxcrypt/archive/refs/tags/v4.4.29.tar.gz
sha:efb4e225c4e37658444ecdb4825883b70b744541b73022d91c4d12e0dd8e39a0
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
