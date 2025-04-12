{% extends '//die/c/autorehell.sh'%}

{% block version %}
4.4.37
{% endblock %}

{% block fetch %}
https://github.com/besser82/libxcrypt/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:e02e1150f43de89c65f331f50b3c008fe47967bbbf62e7171c7a335583a4bd74
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
