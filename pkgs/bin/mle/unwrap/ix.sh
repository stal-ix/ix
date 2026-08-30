{% extends '//die/c/make.sh' %}

{% block pkg_name %}
mle
{% endblock %}

{% block version %}
1.8.1
{% endblock %}

{% block fetch %}
https://github.com/adsr/mle/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7ee33a695f801024254fc717b64aff6a7a4c274874fc4b83e1a23ccf1a74b9ca
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
