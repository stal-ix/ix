{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v2.42.1.tar.gz
sha:59222171748cafe549821b9ce9926face769ce058e5f4b90c32c9b708bb797b5
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/curl
lib/intl
lib/expat
lib/pcre/2
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/tar
bld/perl
bld/python
bld/gettext
{% endblock %}

{% block make_flags %}
gitexecdir=bin/{{uniq_id}}
INSTALL_SYMLINKS=yes
NO_REGEX=NeedsStartEnd
COMPUTE_HEADER_DEPENDENCIES=no
{% endblock %}
