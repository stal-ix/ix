{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/fenrus75/powertop/archive/refs/tags/v2.15.tar.gz
sha:e58ab3fd7b8ff5f4dd0d17f11848817e7d83c0a6918145ac81de03b5dccf8f49
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/kernel
lib/curses
lib/pci/utils
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/auto/archive
{% endblock %}

{#
*** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.18 but the autoconf macros are from gettext version 0.23
make[2]: *** [Makefile:168: check-macro-version] Error 1
make[1]: *** [Makefile:563: all-recursive] Error 1
make: *** [Makefile:474: all] Error 2
?[31mERROR /var/run/ci/mount/ix_root/store/Ek88tN2aA7FfsMmC-bin-aria-2-unwrap?[0m
#}

{% block configure %}
{{super()}}
cat << EOF > po/Makefile
all:
install:
EOF
{% endblock %}
