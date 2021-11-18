{% extends '//dev/build/cmake/mix.sh' %}

{% block bld_libs %}
{{'lib/darwin/framework/CoreFoundation/mix.sh' | darwin}}
{{'boot/7/lib/linux/mix.sh' | linux}}
boot/7/lib/cxx/mix.sh
{% endblock %}

{% block bld_deps %}
boot/6/env/std/mix.sh
{% endblock %}

{% block lib_deps %}
{% endblock %}

{% block run_deps %}
boot/7/samurai/mix.sh
{% endblock %}

{% block configure %}
{% endblock %}

{% block build %}
dash ./bootstrap \
    --prefix=${out}         \
    --parallel=${make_thrs} \
    --                      \
    ${CMFLAGS}              \
    -DCMAKE_USE_OPENSSL=OFF \
    -DBUILD_TESTING=OFF

make -j ${make_thrs}
{% endblock %}

{% block install %}
make install
{% endblock %}
