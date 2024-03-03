{% extends '//die/c/kconfig2.sh' %}

{% block fetch %}
https://busybox.net/downloads/busybox-1.36.1.tar.bz2
sha:b8cc24c9574d809e7279c3be349795c5d5ceb6fdf19ca709f80cde50e47de314
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/perl
bin/bzip2
{% endblock %}

{% block no_mold %}
{% endblock %}

{% block build_flags %}
shut_up
{% endblock%}

{% block setup_target_flags %}
export SKIP_STRIP=y
{% endblock %}

{% block make_target %}
busybox
busybox.links
{% endblock %}

{% block install %}
mkdir ${out}/bin
mv busybox ${out}/bin/

cat busybox.links | (cd ${out}/bin; while read l; do
    ln -s busybox $(basename ${l})
done)
{% endblock %}
