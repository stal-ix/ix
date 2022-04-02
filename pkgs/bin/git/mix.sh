{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v2.35.1.tar.gz
sha:ca2e1824fd084b51b52c71b18c11dc0cadb1eaaed1fdb412f09a2e49e8537eed
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
bld/perl
bin/cpio
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
