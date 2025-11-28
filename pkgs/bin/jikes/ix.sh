{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/daveshields/jikes/archive/refs/tags/1.22.tar.gz
66b74ba50ac53232a65da393eaf11cd689eac597c4cdc4f216f7f162842e8831
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block cxx_flags %}
-std=c++11
{% endblock %}

{% block env %}
export JAVAC=${out}/bin/jikes
{% endblock %}
