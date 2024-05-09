{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/upx/upx/releases/download/v4.2.4/upx-4.2.4-src.tar.xz
sha:5ed6561607d27fb4ef346fc19f08a93696fa8fa127081e7a7114068306b8e1c4
{% endblock %}

{% block bld_libs  %}
lib/c
lib/c++
{% endblock %}
