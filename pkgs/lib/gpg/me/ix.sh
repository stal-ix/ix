{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
gpgme
{% endblock %}

{% block version %}
2.2.0
{% endblock %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-{{self.version().strip()}}.tar.bz2
7160e80e84dafd00d956c84891c533bb7ab16a6a54fbe1574b2f3acf0496977b
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
