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
boot/7/samurai/mix.sh
boot/6/env/std/mix.sh
{% endblock %}

{% block run_deps %}
boot/7/samurai/mix.sh
{% endblock %}

{% block cmake_binary %}
Bootstrap.cmk/cmake
{% endblock %}

{% block patch %}
sed -e 's|# Run bootstrap CMake|exit 0;|' -i bootstrap
{{super()}}
{% endblock %}

{% block cmake_flags %}
-DCMAKE_USE_OPENSSL=OFF
-DBUILD_TESTING=OFF
-DCMAKE_BOOTSTRAP=1
{% endblock %}

{% block configure %}
dash bootstrap \
    --prefix=${out}         \
    --parallel=${make_thrs} \
    --generator=Ninja

{{super()}}
{% endblock %}
