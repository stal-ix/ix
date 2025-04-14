{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
gpgme
{% endblock %}

{% block version %}
1.24.2
{% endblock %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-{{self.version().strip()}}.tar.bz2
sha:e11b1a0e361777e9e55f48a03d89096e2abf08c63d84b7017cfe1dce06639581
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/assuan
lib/gpg/error
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block configure_flags %}
--disable-glibtest
--disable-gpgconf-test
--disable-gpg-test
--disable-gpgsm-test
--disable-g13-test
{% endblock %}

{% block bld_tool %}
bin/gnupg
bld/texinfo
{% endblock %}
