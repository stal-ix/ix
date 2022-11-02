{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/gavinhoward/bc/archive/refs/tags/6.1.1.tar.gz
sha:a505f451403005136278ea816586a34ac757961a9fcf41294250ba247607330e
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block configure %}
sh ./configure.sh --disable-strip --prefix=${out}
{% endblock %}
