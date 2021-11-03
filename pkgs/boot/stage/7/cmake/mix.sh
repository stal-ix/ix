{% extends '//dev/build/cmake/mix.sh' %}

{% block bld_deps %}
{{'sys/framework/CoreFoundation/mix.sh' | darwin}}
{{'boot/lib/linux/mix.sh' | linux}}
boot/lib/cxx/mix.sh
boot/stage/6/env/std/mix.sh
{% endblock %}

{% block lib_deps %}
{% endblock %}

{% block run_deps %}
boot/stage/7/samurai/mix.sh
{% endblock %}

{% block configure %}
{% endblock %}

{% block build %}
dash ./bootstrap \
    --prefix=${out}         \
    --parallel=${make_thrs} \
    --                      \
    -DCMAKE_USE_OPENSSL=OFF \
    -Dfortran=OFF           \
    -DBUILD_TESTING=OFF

make -j ${make_thrs}
{% endblock %}

{% block install %}
make install
{% endblock %}
