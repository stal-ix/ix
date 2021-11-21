{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/landley/toybox/archive/refs/tags/0.8.5.tar.gz
04f2c748df18e46e100f697193925d1b
{% endblock %}

{% block bld_libs %}
lib/linux/mix.sh
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block setup %}
export NOSTRIP=yes
{% endblock %}

{% block configure %}
make defconfig
{% endblock %}

{% block install %}
{{super()}}

cd ${out}

mv sbin/* bin/
mv usr/bin/* bin/
mv usr/sbin/* bin/
rm -rf usr sbin
{% endblock %}
