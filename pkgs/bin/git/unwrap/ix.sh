{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v2.38.2.tar.gz
sha:d774f1472b89108e728db58d13b691608172421327c96bddd9d220b76a22d02c
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
