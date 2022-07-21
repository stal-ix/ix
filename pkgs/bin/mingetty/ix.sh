{% extends '//die/c/make.sh' %}

{% block fetch %}
#https://sourceforge.net/projects/mingetty/files/mingetty/1.08/mingetty-1.08.tar.gz
http://deb.debian.org/debian/pool/main/m/mingetty/mingetty_1.08.orig.tar.gz
sha:0f55c90ba4faa913d91ef99cbf5cb2eb4dbe2780314c3bb17953f849c8cddd17
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block make_flags %}
DESTDIR=${out}
SBINDIR=/bin/
MANDIR=/share/man/man8/
{% endblock %}

{% block install %}
mkdir -p ${out}/bin ${out}/share/man/man8
{{super()}}
{% endblock %}
