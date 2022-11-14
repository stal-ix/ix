{% extends '//die/c/autorehell.sh'%}

{% block fetch %}
https://github.com/besser82/libxcrypt/archive/refs/tags/v4.4.31.tar.gz
sha:17034be118f9b19589fe400ee4070dbd0ea36223be8c9b21db77e353ff888451
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
