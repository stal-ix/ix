{% extends '//die/c/autorehell.sh'%}

{% block fetch %}
https://github.com/besser82/libxcrypt/archive/refs/tags/v4.4.36.tar.gz
sha:b979838d5f1f238869d467484793b72b8bca64c4eae696fdbba0a9e0b6c28453
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block configure_flags %}
--disable-symvers
{% endblock %}
