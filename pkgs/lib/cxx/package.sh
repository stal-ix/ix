{% extends '//util/template.sh' %}

{% block deps %}
# dep env/c boot/final/env
{% endblock %}

{% block fetch%}
{% include '//util/fetch_llvm.sh' %}
{% endblock %}

{% block build %}
{% include '//util/build_libcxx.sh' %}
{% endblock %}

{% block env %}
export CPPFLAGS="-I$out/include/c++/v1 \$CPPFLAGS"
export LDFLAGS="-L$out/lib -lunwind -lc++abi -lc++ \$LDFLAGS"
{% endblock %}
