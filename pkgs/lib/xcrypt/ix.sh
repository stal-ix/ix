{% extends '//die/c/autorehell.sh'%}

{% block fetch %}
https://github.com/besser82/libxcrypt/archive/refs/tags/v4.4.30.tar.gz
sha:5556309d2dcd200da0190aa9bcc1a5bf71059f04423fc7c25dee59bb4355d731
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
