{% extends '//die/c/autorehell.sh'%}

{% block fetch %}
https://github.com/besser82/libxcrypt/archive/refs/tags/v4.4.33.tar.gz
sha:0a0c06bcd028fd0f0467f89f6a451112e8ec97c36e0f58e7464449a4c04607ed
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
