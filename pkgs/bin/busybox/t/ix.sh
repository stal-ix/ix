{% extends '//die/c/kconfig.sh' %}

{% block fetch %}
https://busybox.net/downloads/busybox-1.36.0.tar.bz2
sha:542750c8af7cb2630e201780b4f99f3dcceeb06f505b479ec68241c1e6af61a5
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

{% block setup %}
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
