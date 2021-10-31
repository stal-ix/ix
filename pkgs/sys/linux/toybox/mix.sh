{% extends '//mix/template/make.sh' %}

{% block fetch %}
# url https://github.com/landley/toybox/archive/refs/tags/0.8.5.tar.gz
# md5 04f2c748df18e46e100f697193925d1b
{% endblock %}

{% block deps %}
# bld lib/linux/mix.sh
# bld env/c/mix.sh
# bld boot/final/env/tools/mix.sh
{% endblock %}

{% block cflags %}
export NOSTRIP=yes
{% endblock %}

{% block configure %}
make defconfig
{% endblock %}

{% block install %}
make PREFIX="${out}" install
cd ${out}
mv sbin/* bin/
mv usr/bin/* bin/
mv usr/sbin/* bin/
rm -rf usr sbin
{% endblock %}
