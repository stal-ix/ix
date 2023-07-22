{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v2.41.0.tar.gz
sha:4f0b74bbde2800b00d3a50a7f389bcf1d59f1265b6986c00048d8ba4892ab01a
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
