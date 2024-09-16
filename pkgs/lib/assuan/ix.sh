{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://gnupg.org/ftp/gcrypt/libassuan/libassuan-3.0.1.tar.bz2
sha:c8f0f42e6103dea4b1a6a483cb556654e97302c7465308f58363778f95f194b1
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
