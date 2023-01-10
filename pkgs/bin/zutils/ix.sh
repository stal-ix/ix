{% extends '//die/c/make.sh' %}

{% block fetch %}
https://download.savannah.gnu.org/releases/zutils/zutils-1.12.tar.lz
sha:78ae5478b01c71c5194427c5c341765da831e42e80410ec980f403aa37ac88ee
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block configure %}
sh ./configure --prefix=${out}
{% endblock %}
