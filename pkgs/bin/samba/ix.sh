{% extends '//die/c/wafbase.sh' %}

{% block pkg_name %}
samba
{% endblock %}

{% block version %}
4.20.4
{% endblock %}

{% block fetch %}
https://download.samba.org/pub/samba/stable/samba-{{self.version().strip()}}.tar.gz
3a92e97eaeb345b6b32232f503e14d34f03a7aa64c451fe8c258a11bbda908e5
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/aio
lib/cap
lib/acl
lib/dbus
lib/tirpc
lib/uring
lib/unwind
lib/gnutls
lib/gpg/me
lib/jansson
lib/archive
lib/readline
lib/ucontext
lib/ini/parser
lib/bsd/overlay
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
{% endblock %}

{% block waf %}${PWD}/buildtools/bin/waf{% endblock %}

{% block patch %}
sed -e 's|/tmp/|/var/tmp/|g' -i lib/replace/wscript
sed -e 's|mandatory=True|mandatory=False|' -i lib/replace/wscript
{% endblock %}

{% block cpp_includes %}
${PWD}/third_party/heimdal/lib/hcrypto
{% endblock %}

{% block setup_target_flags %}
export PYTHONHASHSEED=1
{% endblock %}

{% block bld_tool %}
bld/perl
bld/flex
bld/bison
lib/tasn1
bld/perl/yapp
{% endblock %}

{% block waf_flags %}
--without-pam
--without-ads
--without-ldap
--disable-python
--without-ad-dc
--without-gettext
--without-systemd
--disable-fault-handling
--without-libarchive
--with-static-modules=ALL
{% endblock %}

{% block configure %}
{{super()}}
cat << EOF >> bin/default/include/config.h
#pragma once
#undef HAVE_MEMSET_EXPLICIT
EOF
{% endblock %}
