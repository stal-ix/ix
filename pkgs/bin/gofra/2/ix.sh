{% extends '//die/c/make.sh' %}

{% block pkg_name %}
gofra
{% endblock %}

{% block fetch %}
https://github.com/pg83/gofra/archive/0470065f10995bd8e9d6a002a105f061eaff1e3f.tar.gz
769264a9b7d02cce105875afe67c4c4c8bd81a45c1842ab0a88420c94dc4b8d0
{% endblock %}

{% block bld_libs %}
lib/c
lib/std
lib/mnl
lib/linux/headers
{% endblock %}

{% block make_target %}
gofra
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gofra ${out}/bin/
{% endblock %}
