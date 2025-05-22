{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
gpgme
{% endblock %}

{% block version %}
1.24.3
{% endblock %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-{{self.version().strip()}}.tar.bz2
sha:bfc17f5bd1b178c8649fdd918956d277080f33df006a2dc40acdecdce68c50dd
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
