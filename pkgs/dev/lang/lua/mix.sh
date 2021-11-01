{% extends '//mix/template/make.sh' %}

{% block fetch %}
# url https://www.lua.org/ftp/lua-5.4.3.tar.gz
# md5 ef63ed2ecfb713646a7fcc583cf5f352
{% endblock %}

{% block bld_deps %}
dev/build/make/mix.sh
env/std/mix.sh
{% endblock %}

{% block make_flags %}
INSTALL_TOP=${out}
{% endblock %}

{% block test %}
make test
{% endblock %}

{% block postinstall %}
rm -rf ${out}/lib ${out}/include
{% endblock %}
