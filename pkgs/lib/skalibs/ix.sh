{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
skalibs
{% endblock %}

{% block version %}
2.14.4.0
{% endblock %}

{% block fetch %}
https://github.com/skarnet/skalibs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:369d21e9f1c3a851eeb2b03bee427c6d6d8b13eeff6cb6801f0013a840bda58d
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
