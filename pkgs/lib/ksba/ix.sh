{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://www.gnupg.org/ftp/gcrypt/libksba/libksba-1.6.0.tar.bz2
sha:dad683e6f2d915d880aa4bed5cea9a115690b8935b78a1bbe01669189307a48b
{% endblock %}

{% block lib_deps %}
lib/c
lib/gpg/error
{% endblock %}

{% block bld_tool %}
bld/bash
bld/bison
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}
