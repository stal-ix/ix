{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/git/git/archive/refs/tags/v2.43.1.tar.gz
sha:a6886b25734faf84313748afb4b9b0c3082eac17585325d6eba3c1bf95605865
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

{% block make_flags %}
gitexecdir=bin/{{uniq_id}}
INSTALL_SYMLINKS=yes
NO_REGEX=NeedsStartEnd
COMPUTE_HEADER_DEPENDENCIES=no
NO_FINK=1
NO_DARWIN_PORTS=1
NO_PERL=1
NO_TCLTK=1
uname_S={{target.uname_s}}
uname_M={{target.uname_m}}
{% endblock %}
