{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.43.tar.bz2
f1e09cfa536a6e6a264dbf2ccdc2e534
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block postinstall %}
echo 'TODO(pg): check it'
{% endblock %}
