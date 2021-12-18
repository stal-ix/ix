{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://downloads.uclibc-ng.org/releases/1.0.39/uClibc-ng-1.0.39.tar.xz
ceeb95430ec00cc6f8006f746605be1d
{% endblock %}

{% block bld_libs %}
lib/linux/mix.sh
{% endblock %}

{% block host_libs %}
lib/c/mix.sh
{% endblock %}

{% block c_compiler %}
dev/lang/gcc/11/mix.sh
dev/lang/binutils/mix.sh
{% endblock %}

{% block configure %}
cat << EOF >> extra/Configs/Config.x86_64
{% include 'cfg' %}
EOF

make HOSTCC=${HOST_CC} defconfig
{% endblock %}
