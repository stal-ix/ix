{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/freebsd/freebsd-src/archive/refs/tags/release/14.0.0.tar.gz
sha:ebdb7af04060d0a52e713bab4eba274ab2c9c6b94e657e67b32c80086ccbeabc
{% endblock %}

{% block install %}
mkdir -p ${out}/share ${out}/sys/conf
cp -R share/mk ${out}/share/
>${out}/sys/conf/newvers.sh
{% endblock %}

{% block env %}
export FREEBSD_MK=${out}/share/mk
{% endblock %}
