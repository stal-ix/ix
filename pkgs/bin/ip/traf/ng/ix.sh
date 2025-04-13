{% extends '//die/c/make.sh' %}

{% block pkg_name %}
iptraf-ng
{% endblock %}

{% block version %}
1.2.2
{% endblock %}

{% block fetch %}
https://github.com/iptraf-ng/iptraf-ng/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:75fd653745ea0705995c25e6c07b34252ecc2563c6a91b007a3a8c26f29cc252
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/curses
{% endblock %}
