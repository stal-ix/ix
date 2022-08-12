{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v2.37.2.tar.gz
sha:433f5378d688a0368b3cc65db2d11418f877cbd373ee8538ce38a5795f366ba9
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
