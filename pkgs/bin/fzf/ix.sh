{% extends '//die/go/build.sh' %}

{% block pkg_name %}
fzf
{% endblock %}

{% block version %}
0.61.2
{% endblock %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
2e025e63e9b9b880278f0f8a3903dae253ff7561cd2842c09cd291e832e48916
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
