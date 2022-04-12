{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v2.35.2.tar.gz
sha:6f2287bbde2d215394966732836f3aba62b029161e8eaadaf236578d92c06fe9
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

{% block run_deps %}
bin/openssh
{% endblock %}

{% block make_flags %}
gitexecdir=bin/{{uniq_id}}
INSTALL_SYMLINKS=yes
NO_REGEX=NeedsStartEnd
{% endblock %}
