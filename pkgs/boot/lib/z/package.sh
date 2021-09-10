{% extends '//util/autohell.sh' %}

{% block deps %}
# dep boot/stage/5/env
{% endblock %}

{% block fetch %}
# url http://zlib.net/zlib-1.2.11.tar.xz
# md5 85adef240c5f370b308da8c938951a68
{% endblock %}

{% block configure %}
dash ./configure --prefix="$out" --static
{% endblock %}

{% block env %}
export CPPFLAGS="-I$out/include \$CPPFLAGS"
export LDFLAGS="-L$out/lib -lz \$LDFLAGS"
{% endblock %}
