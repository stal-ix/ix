{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://gitlab.com/ananicy-cpp/ananicy-cpp/-/archive/v1.0.0-rc6/ananicy-cpp-v1.0.0-rc6.tar.bz2
sha:d642d9ca4e0a0be753c76fbacfb0f43ee70c3767b8e90f0ebe30dc8b94b7b8a3
https://gitlab.com/ananicy-cpp/stl-polyfills/std-format/-/archive/45296602ad78a804411e7c3b617e13759f38e4e7/std-format-45296602ad78a804411e7c3b617e13759f38e4e7.tar.bz2
sha:315f03aa2596839aa601f846c76bc4175478d7e355199c3b6c48cc416e35a5c0
https://gitlab.com/ananicy-cpp/stl-polyfills/std-jthread/-/archive/d0d2bee1c102dff33ebfc647614bc8ae330d8f84/std-jthread-d0d2bee1c102dff33ebfc647614bc8ae330d8f84.tar.bz2
sha:0ba013ab7ea668f4e02524784651be63bc7fde60c212d1d3e9b9d323bfb9989e
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/fmt/8
lib/linux
lib/spdlog
lib/gnushim
lib/execinfo
lib/json/nlohmann
{% endblock %}

{% block unpack %}
mkdir src; cd src

(
extract 1 ${src}/anan*

(
cd external/std-format
extract 1 ${src}/std-format*
)

(
cd external; mkdir std-jthread; cd std-jthread
extract 1 ${src}/std-jthread*
)
)
{% endblock %}

{% block patch %}
base64 -d << EOF > external/std-jthread/src/stop_source.cpp
{% include 'stop_source.cpp/base64' %}
EOF

sed -e 's|-fsanitize||' -i CMakeLists.txt

find . -type f | while read l; do
    sed -e 's|\[\[nodiscard\]\]||g' -i ${l}
done

cat external/std-jthread/src/*.cpp >> src/main.cpp

sed -e 's|uint|unsigned|g' -i src/main.cpp
sed -e 's|uint|unsigned|g' -i src/platform/linux/process.cpp

find . -type f -name '*.cpp' | while read l; do
    sed -e 's|std::jthread|new std::jthread|' \
        -e 's|worker_thread = ||'     \
        -e 's|this->event_thread =||' \
        -i ${l}
done
{% endblock %}

{% block cmake_flags %}
USE_EXTERNAL_JSON=ON
USE_EXTERNAL_SPDLOG=ON
USE_EXTERNAL_FMTLIB=ON
ENABLE_SYSTEMD=OFF
{% endblock %}

{% block setup %}
export CPPFLAGS="-I${PWD}/external/std-format/polyfills/format ${CPPFLAGS}"
export CPPFLAGS="-I${PWD}/external/std-jthread/polyfills/jthread ${CPPFLAGS}"
export CXXFLAGS="-include strstream -include sstream -include sys/time.h ${CXXFLAGS}"
{% endblock %}

{% block cpp_defines %}
__priority_which_t=int
SCHED_ISO=4
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
