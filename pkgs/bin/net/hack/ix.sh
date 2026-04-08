{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/NetHack/NetHack
{% endblock %}

{% block git_branch %}
NetHack-{{self.version().strip()}}_Released
{% endblock %}

{% block git_commit %}
ed600d9f0f3c37677418f0150f59363ca641f3dc
{% endblock %}

{% block git_sha %}
6622d11dee5c154ccc58cbf82f8305d21ffcb947d0f1625338f8d6e32a7e5be4
{% endblock %}

{% block pkg_name %}
nethack
{% endblock %}

{% block version %}
3.6.7
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/ncurses
{% endblock %}

{% block bld_tool %}
bld/bison
bin/flex
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}

{% block patch %}
sed -i \
    -e 's|^HACKDIR=.*|HACKDIR=${out}/share/nethack|' \
    -e 's|^SHELLDIR =.*|SHELLDIR = ${out}/bin|' \
    -e 's|^CHOWN=.*|CHOWN=true|' \
    -e 's|^CHGRP=.*|CHGRP=true|' \
    -e 's|^WINTTYLIB=.*|WINTTYLIB=-lncursesw|' \
    -e 's|-rdynamic||' \
    sys/unix/hints/linux
cd sys/unix
sh setup.sh hints/linux
{% endblock %}

{% block make_flags %}
{{super()}}
LEX=flex
LINK=cc
CHOWN=true
CHGRP=true
GAMEPERM=0755
FILEPERM=0644
EXEPERM=0755
DIRPERM=0755
VARFILEPERM=0644
VARDIRPERM=0755
{% endblock %}

{% block make_no_thrs %}
{% endblock %}
