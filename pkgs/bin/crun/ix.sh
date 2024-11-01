{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://github.com/containers/crun
{% endblock %}

{% block git_branch %}
1.18.2
{% endblock %}

{% block git_sha %}
ad93553cec62f69e7571c7d3407768c2a169604e7116be31f629e73888866cbc
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/intl
lib/yajl
lib/seccomp
lib/argp/standalone
{% endblock %}

{% block bld_tool %}
bin/gperf
bld/python
bld/fakegit
{% endblock %}

{% block configure_flags %}
--disable-dl
--disable-systemd
--disable-embedded-yajl
{% endblock %}

{% block build %}
cat << EOF > git-version.h
#pragma once
#define GIT_VERSION "{{self.git_branch().strip()}}"
EOF
{{super()}}
{% endblock %}
