{% extends '//mix/make.sh' %}

{% block fetch %}
http://zlib.net/zlib-1.2.12.tar.xz
sha:7db46b8d7726232a621befaab4a1c870f00a90805511c0e0090441dac57def18
{% endblock %}

{% block std_box %}
bld/bootbox
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
