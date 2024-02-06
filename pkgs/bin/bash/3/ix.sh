{% extends '//bin/bash/t/ix.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bash/bash-3.2.57.tar.gz
md5:237a8767c990b43ae2c89895c2dbc062
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/curses
lib/readline
{{super()}}
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/byacc
bld/texinfo
bld/devendor
{% endblock %}

{% block setup_host_flags %}
{{super()}}
export CFLAGS="-Wno-implicit-function-declaration ${CFLAGS}"
{% endblock %}

{% block setup_target_flags %}
{{super()}}
export CFLAGS="-Wno-implicit-function-declaration ${CFLAGS}"
{% endblock %}

{% block make_no_thrs %}{% endblock %}

{% block patch %}
cat << EOF > support/config.sub
#!$(which sh)
echo {{target.gnu.three}}
EOF
chmod +x support/config.sub
rm y.tab* lib/intl/plural.c
devendor lib/readline
for i in history.h rlstdc.h keymaps.h chardefs.h readline.h rlconf.h rldefs.h tcap.h; do
cat << EOF > lib/readline/${i}
#include_next <readline/${i}>
EOF
done
>lib/readline/histlib.h
>lib/readline/posixstat.h
>lib/readline/tilde.h
>lib/readline/xmalloc.h
>lib/readline/rlshell.h
>lib/readline/rlprivate.h
>lib/readline/rltypedefs.h
>lib/readline/ansi_stdlib.h
>lib/readline/posixjmp.h
>lib/readline/posixwait.h
>lib/readline/posixtime.h
>lib/readline/systimes.h
>lib/readline/unionwait.h
>lib/readline/maxpath.h
>lib/readline/shtty.h
>lib/readline/typemax.h
>lib/readline/ocache.h
>lib/readline/rlmbutil.h
>lib/readline/rltty.h
>lib/readline/posixdir.h
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-installed-readline
--enable-readline
--with-curses
{% endblock %}

{% block install %}
{{super()}}
cd ${out}; mv info share/
{% endblock %}

{% block configure %}
{{super()}}
find . -type f -name Makefile | while read l; do
    sed -e 's|libreadline.a|libxxx.a|' \
        -e 's|libhistory.a|libyyy.a|' \
        -i ${l}
done
{% endblock %}
