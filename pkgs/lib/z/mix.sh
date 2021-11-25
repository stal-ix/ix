{% extends '//mix/template/make.sh' %}

{% block fetch %}
http://zlib.net/zlib-1.2.11.tar.xz
85adef240c5f370b308da8c938951a68
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block configure %}
dash configure --static --64 --prefix="${out}"
{% endblock %}

{% block make_flags %}
TEST_LDFLAGS="-L. libz.a"
{% endblock %}

{% block install %}
{{super()}}
mkdir ${out}/bin && cp minigzip ${out}/bin/
{% endblock %}

{% block env %}
export COFLAGS="--with-z=${out} \${COFLAGS}"
{% endblock %}
