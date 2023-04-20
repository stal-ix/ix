{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.20.0.tar.bz2
sha:25a5785a5da356689001440926b94e967d02e13c49eb7743e35ef0cf22e42750
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
