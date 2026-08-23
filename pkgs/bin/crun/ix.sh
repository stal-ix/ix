{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
crun
{% endblock %}

{% block version %}
1.29.1
{% endblock %}

{% block git_repo %}
https://github.com/containers/crun
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
4866ff12768f5ecc9b1af92259c4045cbe80deb84e1cd24e9a4642d0ee96b7f2
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
