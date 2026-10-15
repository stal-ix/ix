{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
crun
{% endblock %}

{% block version %}
1.30.1
{% endblock %}

{% block git_repo %}
https://github.com/containers/crun
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
0d8a91cce6132346d4d18f4249344cd548a3ea24061cf829309ed16a5ba9da30
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/intl
lib/json/c
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
