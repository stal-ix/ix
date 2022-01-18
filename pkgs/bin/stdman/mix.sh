{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/jeaye/stdman/archive/478d353c73bec79bbbad833a31c50eecd4578b46.zip
7670f4b232aee6b499b937456f8c6132
{% endblock %}

{% block bld_tool %}
dev/tool/bash
{% endblock %}

{% block configure %}
bash configure --prefix="${out}"
{% endblock %}

{% block build %}
{% endblock %}
