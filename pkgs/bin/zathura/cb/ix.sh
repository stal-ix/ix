{% extends '//bin/zathura/t/ix.sh' %}

{% block fetch %}
https://github.com/pwmt/zathura-cb/archive/refs/tags/0.1.11.tar.gz
sha:4159a84bbff021087e60fb82c62505e6db5c19aa9962edda39a4b11d00302f5d
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/archive
{% endblock %}
