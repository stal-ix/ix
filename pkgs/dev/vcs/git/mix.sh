{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v2.33.1.tar.gz
9d410d4c01e0f1cc53b2ad07faa8147d
{% endblock %}

{% block bld_deps %}
lib/z/mix.sh
lib/curl/mix.sh
lib/iconv/mix.sh
lib/expat/mix.sh
lib/pcre/2/mix.sh
lib/openssl/mix.sh
dev/lang/perl5/mix.sh
dev/build/python/mix.sh
gnu/gettext/mix.sh
{{super()}}
{% endblock %}

{% block run_deps %}
net/openssh/mix.sh
{% endblock %}

{% block toolconf %}
ln -s $(command -v bsdtar) tar
ln -s $(command -v bsdcpio) cpio
{% endblock %}

{% block make_flags %}
INSTALL_SYMLINKS=yes
NO_REGEX=NeedsStartEnd
{% endblock %}
