{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/adsr/mle/archive/refs/tags/v1.7.2.tar.gz
sha:5275fcfc58d3d4890d074077d94497db488b2648287b3e48e67b00ea517b02ba
{% endblock %}

{% block bld_libs %}
lib/c
lib/lua
lib/uthash
lib/pcre/2
lib/shim/fake(lib_name=lua5.4)
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|<lua5.4/|<|' -i ${l}
done
{% endblock %}
