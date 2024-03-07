{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.7.tar.bz2
sha:0103081ffc27838a2e50479153ca105e873d3d65d8a9593282e9c94c7e6afb76
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
