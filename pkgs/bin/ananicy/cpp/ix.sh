{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.com/ananicy-cpp/ananicy-cpp/-/archive/v1.0.2/ananicy-cpp-v1.0.2.tar.bz2
sha:6504a95bc6846dd93cfefc1e60526a43a4b9a3424f4fc834842ea60fc797cccf
https://gitlab.com/ananicy-cpp/stl-polyfills/std-jthread/-/archive/d0d2bee1c102dff33ebfc647614bc8ae330d8f84/std-jthread-d0d2bee1c102dff33ebfc647614bc8ae330d8f84.tar.bz2
sha:0ba013ab7ea668f4e02524784651be63bc7fde60c212d1d3e9b9d323bfb9989e
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/fmt
lib/kernel
lib/spdlog
lib/execinfo
lib/shim/gnu
lib/fmt/polyfill
lib/json/nlohmann/11
{% endblock %}

{% block step_unpack %}
mkdir src; cd src; extract 1 ${src}/anan*
(cd external; mkdir std-jthread; cd std-jthread; extract 1 ${src}/std-jthread*)
{% endblock %}

{% block patch %}
cat << EOF > external/std-format/CMakeLists.txt
add_library(stl_polyfill_format INTERFACE)
add_library(stl_polyfill::format ALIAS stl_polyfill_format)
EOF

base64 -d << EOF > external/std-jthread/src/stop_source.cpp
{% include 'stop_source.cpp/base64' %}
EOF

find . -type f | while read l; do
    sed -e 's|\[\[nodiscard\]\]||g' -i ${l}
done

cat external/std-jthread/src/*.cpp >> src/main.cpp

find . -type f -name '*.cpp' | while read l; do
    sed -e 's|std::jthread|new std::jthread|' \
        -e 's|worker_thread = ||'     \
        -e 's|this->event_thread =||' \
        -i ${l}
done

sed -e 's|std::formatter|fmt::formatter|' -i include/utility/argument_parser.hpp
{% endblock %}

{% block cmake_flags %}
ENABLE_SYSTEMD=OFF
USE_EXTERNAL_JSON=ON
USE_EXTERNAL_SPDLOG=ON
USE_EXTERNAL_FMTLIB=ON
{% endblock %}

{% block cpp_includes %}
${PWD}/external/std-jthread/polyfills/jthread
{% endblock %}

{% block cpp_missing %}
unistd.h
sys/time.h
{% endblock %}

{% block setup %}
export CXXFLAGS="-include sstream ${CXXFLAGS}"
{% endblock %}

{% block cpp_defines %}
SCHED_ISO=4
__priority_which_t=int
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
