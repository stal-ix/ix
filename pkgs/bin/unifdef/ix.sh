{% extends '//die/c/make.sh' %}

{% block fetch %}
https://dotat.at/prog/unifdef/unifdef-2.12.tar.xz
sha:43ce0f02ecdcdc723b2475575563ddb192e988c886d368260bc0a63aee3ac400
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
