{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v2.36.0.tar.gz
sha:59dbc158dce293798570166fe7acfe225514f2868bc2d6e25c1a5a00c4ac0888
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
