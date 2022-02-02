{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v2.35.0.tar.gz
sha:3b315a7e051bf9c439965072e8d424ce1e4ccca23eb6e8588b58a29f257bb75a
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
gitexecdir=bin/{{uniq_id}}
INSTALL_SYMLINKS=yes
NO_REGEX=NeedsStartEnd
{% endblock %}
