{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v2.37.0.tar.gz
sha:17733eb8bc7de35e2e399ac6577df0aa856faaf0a2ef1e55e90a4978dcf9caa1
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
