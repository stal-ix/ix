{% extends '//util/template.sh' %}

{% block bld_deps %}
shell/bash/minimal
dev/build/make
env/std
{% endblock %}

{% block fetch %}
# url https://github.com/jeaye/stdman/archive/478d353c73bec79bbbad833a31c50eecd4578b46.zip
# md5 7670f4b232aee6b499b937456f8c6132
{% endblock %}

{% block configure %}
bash ./configure --prefix="$out"
{% endblock %}

{% block install %}
make install
{% endblock %}
