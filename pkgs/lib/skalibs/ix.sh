{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/skarnet/skalibs/archive/refs/tags/v2.14.1.0.tar.gz
sha:148cd184754fef201d23ace2819b903006a220781da17304d8186b23f9725cd8
{% endblock %}

{% block lib_deps %}
lib/c/naked
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
