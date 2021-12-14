{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://downloads.uclibc-ng.org/releases/1.0.39/uClibc-ng-1.0.39.tar.xz
ceeb95430ec00cc6f8006f746605be1d
{% endblock %}

{% block bld_libs %}
lib/build/mix.sh
lib/c/mix.sh
lib/linux/mix.sh
{% endblock %}

{% block std_box %}
alt/box/mix.sh
dev/lang/gcc/11/mix.sh
dev/lang/binutils/mix.sh
{% endblock %}

{% block prologue %}
set -x
{{super()}}
{% endblock %}

{% block configure %}
cat << EOF >> extra/Configs/Config.x86_64
{% include 'cfg' %}
EOF

make defconfig
{% endblock %}
