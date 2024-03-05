{% extends '//die/c/wafbase.sh' %}

{% block fetch %}
https://download.samba.org/pub/samba/stable/samba-4.19.5.tar.gz
sha:0e2405b4cec29d0459621f4340a1a74af771ec7cffedff43250cad7f1f87605e
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
