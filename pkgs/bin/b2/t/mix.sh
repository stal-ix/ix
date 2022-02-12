{% extends '//mix/c_std.sh' %}

{% block fetch %}
https://github.com/boostorg/build/archive/refs/tags/4.4.1.tar.gz
sha:31a243b1eb26638500977a8386e56d44f86c18db70cf0a5dcdd2d7391afc1a61
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bin/bison/3/8
{% endblock %}

{% block build %}
sh bootstrap.sh
{% endblock %}

{% block install %}
./b2 install --prefix=${out}
{% endblock %}
