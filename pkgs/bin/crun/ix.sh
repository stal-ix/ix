{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
crun
{% endblock %}

{% block version %}
1.26
{% endblock %}

{% block git_repo %}
https://github.com/containers/crun
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
c9385e7d50632d4dcde4b396c21956ae7e0952d7435951da591f0cb956779312
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
