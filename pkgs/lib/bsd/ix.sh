{% extends 't/ix.sh' %}

{% block lib_deps %}
lib/c
lib/md
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block patch %}
{{super()}}
cat << EOF >> include/bsd/sys/cdefs.h
#pragma once
#ifndef __scanflike
# if LIBBSD_GCC_VERSION >= 0x0300 || __has_attribute(__format__)
#  define __scanflike(x, y) __attribute((__format__(__scanf__, (x), (y))))
# else
#  define __scanflike(x, y)
# endif
#endif
EOF
{% endblock %}

{% block env %}
{{super()}}
export BSD_HEADERS=${out}/include/bsd
{% endblock %}
