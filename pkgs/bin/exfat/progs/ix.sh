{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/exfatprogs/exfatprogs/archive/refs/tags/1.2.2.tar.gz
sha:16b28c9130b4dfab0b571dce6d2959d2ee93fce27aa0f4b2c1bb30700f371393
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
