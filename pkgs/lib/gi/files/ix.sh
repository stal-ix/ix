{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/gtk-rs/gir-files/archive/refs/tags/0.20.0.tar.gz
sha:8d722e958244747989973c743d1b1e5d9b7adba0cf6f7193daef4045e79b896d
{% endblock %}

{% block lib_deps %}
lib/build/gir
lib/build/vala
{% endblock %}

{% block postinstall %}
mkdir -p ${out}/share/gir-1.0
cp *.gir ${out}/share/gir-1.0/
{% endblock %}

{% block env %}
export GIRPATH="${out}/share/gir-1.0:\${GIRPATH}"
export VALAFLAGS="--girdir=${out}/share/gir-1.0 \${VALAFLAGS}"
export GIRSFLAGS="--add-include-path=${out}/share/gir-1.0 \${GIRSFLAGS}"
export GIRCFLAGS="--includedir=${out}/share/gir-1.0 \${GIRCFLAGS}"
{% endblock %}
