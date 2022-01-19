{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v2.34.0.tar.gz
7f6734f00835e84fb65c46d0e4f9d155
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/curl
lib/iconv
lib/expat
lib/pcre/2
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/perl
bld/python
bin/gettext
{% endblock %}

{% block run_deps %}
bin/openssh
{% endblock %}

{% block make_flags %}
gitexecdir=bin/exec
INSTALL_SYMLINKS=yes
NO_REGEX=NeedsStartEnd
{% endblock %}
