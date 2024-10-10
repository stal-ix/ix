{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/skarnet/skalibs/archive/refs/tags/v2.14.3.0.tar.gz
sha:d4d46b4a1a8418de638beecc6f063f6a87027e000ba8a2ab90033580f73e5e8f
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
