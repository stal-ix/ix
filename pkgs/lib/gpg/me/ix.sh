{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
gpgme
{% endblock %}

{% block version %}
2.3.1
{% endblock %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-{{self.version().strip()}}.tar.bz2
2bf94e0e677e5a8fc31f79dd323f91c5416b36fb851058bc1e8bce39f2642434
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
