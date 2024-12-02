{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/janmojzis/tinyssh/archive/refs/tags/20241201.tar.gz
sha:cfd8ef3553f07886723823f3e0c2c5a773f29d1eb5be1fb57fe4a9a5ef89db21
{% endblock %}

{% block bld_libs %}
lib/c
lib/shim/utmp
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}
