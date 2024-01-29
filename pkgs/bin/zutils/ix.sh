{% extends '//die/c/make.sh' %}

{% block fetch %}
https://download.savannah.gnu.org/releases/zutils/zutils-1.13.tar.lz
sha:957d03c6c1b6b68c94e313ff9633bf6c7e32ab50e150ab67cc244b0ccd2a4c17
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block build_flags %}
fix_shebangs
{% endblock %}

{% block configure %}
sh ./configure --prefix=${out}
{% endblock %}
