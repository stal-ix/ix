{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://skarnet.org/software/skalibs/skalibs-2.11.1.0.tar.gz
sha:400180b4d5b651e4fafaf0297b933f5f863b467d357f5b36a6545cf6eb14eab9
{% endblock %}

{% block lib_deps %}
lib/c/bare
{% endblock %}

{% block patch %}
sed -e 's|ifdef SKALIBS_HASDIRFD|if 1|' -i src/libstddjb/dir_fd.c
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
mv skalibs/*.a ./
{% endblock %}

{% block env %}
export COFLAGS="--with-sysdeps=${out}/lib/skalibs/sysdeps \${COFLAGS}"
{% endblock %}
