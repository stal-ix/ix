{% extends '//dev/build/cmake/mix.sh' %}

{% block bld_libs %}
{% if target.os == 'darwin' %}
lib/darwin/framework/CoreFoundation/mix.sh
{% endif %}
{% if target.os == 'linux' %}
boot/7/lib/linux/mix.sh
{% endif %}
boot/7/lib/cxx/mix.sh
{% endblock %}

{% block bld_deps %}
boot/6/env/std/mix.sh
{% endblock %}

{% block run_deps %}
boot/7/samurai/mix.sh
{% endblock %}

{% block configure %}
{% endblock %}

{% block build %}
dash bootstrap \
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
