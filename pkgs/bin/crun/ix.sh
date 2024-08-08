{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://github.com/containers/crun
{% endblock %}

{% block git_branch %}
1.16
{% endblock %}

{% block git_sha %}
751fa4b4e61776aff42ac63bf438953c6567c7e7b98de4431570de3cbf8c37c4
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
