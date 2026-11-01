{% extends '//die/c/autohell.sh' %}

# noauto: pngquant 3.x is written in Rust; this is the last C line

{% block version %}
2.18.0
{% endblock %}

{% block pkg_name %}
pngquant
{% endblock %}

{% block fetch %}
https://pngquant.org/pngquant-{{self.version().strip()}}-src.tar.gz
e72194b52b36f040deaec49a1ddd5dcd8d4feecc3a5fe6c5e9589a9707b233d4
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block bld_libs %}
lib/c
lib/png
{% endblock %}

{% block patch %}
sed -e 's|/tmp|${TMPDIR}/|' -i configure
sed -e 's|/tmp|${TMPDIR}/|' -i lib/configure
sed -e 's|; ./configure |; sh ./configure |' -i Makefile
{% endblock %}
