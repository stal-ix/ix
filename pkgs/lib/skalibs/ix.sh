{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
skalibs
{% endblock %}

{% block version %}
2.16.0.0
{% endblock %}

{% block fetch %}
https://github.com/skarnet/skalibs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
5a653ff1a7f9ba31b0415e3107f8cb30c91aeb8ace3d05e860850870bc839220
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
