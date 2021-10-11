{% extends '//mix/template/template.sh' %}

{% block fetch %}
# url https://www.lua.org/ftp/lua-5.4.3.tar.gz
# md5 ef63ed2ecfb713646a7fcc583cf5f352
{% endblock %}

{% block deps %}
# bld dev/build/make env/std
{% endblock %}

{% block build %}
make INSTALL_TOP=${out} -j ${make_thrs} all
{% endblock %}

{% block install %}
make INSTALL_TOP=${out} install
{% endblock %}

{% block test %}
make test
{% endblock %}
