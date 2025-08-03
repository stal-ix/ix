{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
gdbm
{% endblock %}

{% block version %}
1.26
{% endblock %}

{#
./gdbmapp.h:74:17: error: function cannot return function type 'int (void *, const char *, size_t)' (aka 'int (void *, const char *, unsigned long)')
   74 |                              ssize_t (*writer) (void *, const char *, size_t),
         |
#}

{% block fetch %}
https://ftp.gnu.org/gnu/gdbm/gdbm-{{self.version().strip()}}.tar.gz
6a24504a14de4a744103dcb936be976df6fbe88ccff26065e54c1c47946f4a5e
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
