{% extends '//die/autohell.sh' %}

{% block fetch %}
https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.45.tar.bz2
sha:570f8ee4fb4bff7b7495cff920c275002aea2147e9a1d220c068213267f80a26
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block postinstall %}
echo 'TODO(pg): check it'
{% endblock %}
