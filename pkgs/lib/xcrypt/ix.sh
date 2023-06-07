{% extends '//die/c/autorehell.sh'%}

{% block fetch %}
https://github.com/besser82/libxcrypt/archive/refs/tags/v4.4.35.tar.gz
sha:15981f2ffb82d70f07285f9683c485c4774083057564a2e7e74236c19e8e9f7b
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
