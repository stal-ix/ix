{% extends '//dev/build/cmake/package.sh' %}

{% block deps %}
# bld {{'sys/framework/CoreFoundation/package.py' | darwin}}
# bld {{'boot/lib/linux/package.sh' | linux}}
# bld boot/lib/cxx/package.sh
# bld boot/stage/5/env/package.sh
# run boot/stage/6/samurai/package.sh
{% endblock %}

{% block configure %}
{% endblock %}

{% block build %}
dash ./bootstrap --prefix=${out} --parallel=${make_thrs} -- -DCMAKE_USE_OPENSSL=OFF -Dfortran=OFF -DBUILD_TESTING=OFF
make -j ${make_thrs}
{% endblock %}

{% block install %}
make install
{% endblock %}
