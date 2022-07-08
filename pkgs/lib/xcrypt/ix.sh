{% extends '//die/autorehell.sh'%}

{% block fetch %}
https://github.com/besser82/libxcrypt/archive/refs/tags/v4.4.28.tar.gz
sha:db7e37901969cb1d1e8020cb73a991ef81e48e31ea5b76a101862c806426b457
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
