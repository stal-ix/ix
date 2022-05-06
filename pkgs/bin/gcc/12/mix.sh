{% extends '//bin/gcc/11/mix.sh' %}

{% block fetch %}
http://mirror.koddos.net/gcc/releases/gcc-12.1.0/gcc-12.1.0.tar.xz
sha:62fd634889f31c02b64af2c468f064b47ad1ca78411c45abe6ac4b5f8dd19c7b
{% endblock %}

{% block env %}
export GCC_INCLUDES="${out}/lib/gcc/x86_64-pc-linux/12.1.0/include"
{% endblock %}
