{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v2.34.1.tar.gz
sha:81b7ad3cff6adfab4c281b976f2c0ca91a3bd575210f36f5dfa71e69d872c830
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
