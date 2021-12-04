{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v2.34.0.tar.gz
7f6734f00835e84fb65c46d0e4f9d155
{% endblock %}

{% block bld_libs %}
lib/z/mix.sh
lib/curl/mix.sh
lib/iconv/mix.sh
lib/expat/mix.sh
lib/pcre/2/mix.sh
lib/openssl/mix.sh
{% endblock %}

{% block bld_tool %}
dev/lang/perl5/mix.sh
dev/build/python/mix.sh
gnu/gettext/mix.sh
{% endblock %}

{% block run_deps %}
net/openssh/mix.sh
{% endblock %}

{% block toolconf %}
ln -s $(command -v bsdtar) tar
ln -s $(command -v bsdcpio) cpio
{% endblock %}

{% block make_flags %}
gitexecdir=bin/exec
INSTALL_SYMLINKS=yes
NO_REGEX=NeedsStartEnd
{% endblock %}
