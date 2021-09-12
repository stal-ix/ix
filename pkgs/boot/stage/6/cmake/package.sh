{% extends '//dev/build/cmake/package.sh' %}

{% block deps %}
# bld env/cmake {{'boot/lib/linux' | linux}} boot/lib/cxx boot/stage/5/env
# run boot/stage/6/samurai
{% endblock %}

{% block configure %}
build_cmake_ps
{% endblock %}

{% block build %}
dash ./bootstrap --prefix=$out --parallel=$make_thrs -- -DCMAKE_USE_OPENSSL=OFF -Dfortran=OFF -DBUILD_TESTING=OFF
make -j $make_thrs
{% endblock %}

{% block install %}
make install
{% endblock %}
