{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~kennylevinsen/seatd/archive/0.6.3.tar.gz
0d375928bbcc39b1652e2730e01e6089
{% endblock %}

{% block bld_tool %}
dev/build/cmake/mix.sh
dev/build/pkg-config/mix.sh
{% endblock %}

{% block bld_libs %}
lib/linux/mix.sh
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}
