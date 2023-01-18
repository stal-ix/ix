{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.18.0.tar.bz2
sha:361d4eae47ce925dba0ea569af40e7b52c645c4ae2e65e5621bf1b6cdd8b0e9e
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
