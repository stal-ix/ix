{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
gpgme
{% endblock %}

{% block version %}
2.1.2
{% endblock %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-{{self.version().strip()}}.tar.bz2
0687a95b299871c4141f507c0f740de6b429c9ac067d0fa4e062e3264df5fb77
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
