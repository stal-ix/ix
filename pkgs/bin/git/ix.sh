{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v2.36.1.tar.gz
sha:cbaac97b2bd4a5beb8b81b7bd009415eed4faec9f799d6bb1be61be907e39cf7
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
