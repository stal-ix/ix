{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/exfatprogs/exfatprogs/archive/refs/tags/1.2.5.tar.gz
sha:ce638f06b15b3553307d244f13c64bdbd52a73460e383a5aa5d60d84a58d51b0
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
