{% extends '//die/c/make.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure %}
sh configure --static --64 --prefix="${out}"
{% endblock %}

{% block make_flags %}
TEST_LDFLAGS="-L. libz.a"
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-z=${out} \${COFLAGS}"
{% endblock %}
