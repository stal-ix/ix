{% extends '//die/c/make.sh' %}

{% block pkg_name %}
pigz
{% endblock %}

{% block version %}
2.8
{% endblock %}

{% block fetch %}
https://github.com/madler/pigz/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2f7f6a6986996d21cb8658535fff95f1c7107ddce22b5324f4b41890e2904706
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp pigz ${out}/bin/
ln -s pigz ${out}/bin/unpigz
{% endblock %}
