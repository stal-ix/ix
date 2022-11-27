{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/adsr/mle/archive/6ce64b207aa7bdcdff031b78bfb1d785dd555091.tar.gz
sem:71bace32d3ebd4e99572e0bd4e7551849d817595164cb6b4d1cf3e298abfa689
{% endblock %}

{% block bld_libs %}
lib/c
lib/uthash
lib/pcre/2
lib/lua/puc/5/4
lib/shim/fake(lib_name=lua5.4)
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|lua5.4/||' -i ${l}
done
{% endblock %}
