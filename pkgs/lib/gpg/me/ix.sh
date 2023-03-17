{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.19.0.tar.bz2
sha:cb58494dc415fba9eeb12b826550ad3190dc92e265c5bb2ae1a21c92841cfd38
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

{% block bld_libs %}
# for tests
lib/shim/fake(lib_name=stdc++)
{% endblock %}

{% block bld_tool %}
bin/gnupg
bld/texinfo
{% endblock %}
