{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v2.39.1.tar.gz
sha:288e8688b345147da65caefd5b65424d20e3ad9c048b0f78b3e83af4a6fe52f6
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
{% endblock %}
