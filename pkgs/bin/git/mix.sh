{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v2.35.3.tar.gz
sha:acc6b83f1f019d712011432df88fc60f8cc84167ff80f86acadf49143f4ed078
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
