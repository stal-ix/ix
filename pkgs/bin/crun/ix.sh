{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://github.com/containers/crun
{% endblock %}

{% block git_branch %}
1.11
{% endblock %}

{% block git_sha %}
fa13200946064d13fa5d92b3b5bad5b483c16fbcc68d3536041a34e3f03323de
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
