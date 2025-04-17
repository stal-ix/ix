{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
gdbm
{% endblock %}

{% block version %}
1.25
{% endblock %}

{#
./gdbmapp.h:74:17: error: function cannot return function type 'int (void *, const char *, size_t)' (aka 'int (void *, const char *, unsigned long)')
   74 |                              ssize_t (*writer) (void *, const char *, size_t),
         |
#}

{% block fetch %}
https://ftp.gnu.org/gnu/gdbm/gdbm-{{self.version().strip()}}.tar.gz
sha:695e9827fdf763513f133910bc7e6cfdb9187943a4fec943e57449723d2b8dbf
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/gettext
{% endblock %}
