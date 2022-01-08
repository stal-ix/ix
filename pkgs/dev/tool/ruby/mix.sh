{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://cache.ruby-lang.org/pub/ruby/3.1/ruby-3.1.0.tar.gz
sha:50a0504c6edcb4d61ce6b8cfdbddaa95707195fab0ecd7b5e92654b2a9412854
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/ffi
lib/gmp
lib/openssl
lib/readline
{% endblock %}

{% block bld_tool %}
dev/tool/python
{% endblock %}

{% block touch_yl %}
{% endblock %}

{% block setup_tools %}
C=$(which clang)

cat << EOF > clang
#!$(which python3)

import sys
import subprocess

if '.so' in str(sys.argv):
    sys.exit(0)

subprocess.check_call(["${C}"] + sys.argv[1:])
EOF

chmod +x clang
cp clang clang++
{% endblock %}

{% block configure_flags %}
--disable-dln
--without-git
--without-gcc
--with-static-linked-ext=yes
--with-rubylibprefix="${out}/share"
{% endblock %}
