{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://gnupg.org/ftp/gcrypt/libassuan/libassuan-3.0.2.tar.bz2
sha:d2931cdad266e633510f9970e1a2f346055e351bb19f9b78912475b8074c36f6
{% endblock %}

{% block lib_deps %}
lib/c
lib/gpg/error
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block postinstall %}
echo 'left config script'
{% endblock %}

{% block env %}
export COFLAGS="--with-libassuan-prefix=${out} \${COFLAGS}"
{% endblock %}
