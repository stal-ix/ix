{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
skalibs
{% endblock %}

{% block version %}
2.15.1.0
{% endblock %}

{% block fetch %}
https://github.com/skarnet/skalibs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
efa8b213fe341d57c8b7ad087d928b8d3296643a3a1583bf7e7675766bb68b06
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block patch %}
sed -e 's|ifdef SKALIBS_HASDIRFD|if 1|' -i src/libstddjb/dir_fd.c
{% endblock %}

{% block env %}
export COFLAGS="--with-sysdeps=${out}/lib/skalibs/sysdeps \${COFLAGS}"
{% endblock %}
