{% extends '//die/c/cmake.sh' %}

{% block bld_data %}
aux/git(parent_id=dragonfly,sha=2343916f23ce12630fedcb96476f8ca3efa3e2e8a44c579602d1797643606c8a,branch=v1.0.0,repo=https://github.com/dragonflydb/dragonfly.git)
{% endblock %}

{% block bld_tool %}
bin/lz4
{% endblock %}

{% block step_unpack %}
mkdir src; cd src
lz4 -d ${src}/*lz4 - | bsdtar -x -f - --no-same-permissions --no-same-owner --strip-components 1
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/glog
lib/curl
lib/boost
lib/xml/2
lib/uring
lib/googletest
lib/abseil/cpp
{% endblock %}

{% block patch %}
cat << EOF > helio/cmake/third_party.cmake
function(add_third_party name)
endfunction()
EOF

cat << EOF > helio/cmake/internal.cmake
function(cxx_link name)
endfunction()
function(cxx_test name)
endfunction()
EOF

base64 -d << EOF > src/server/CMakeLists.txt
{% include 'CMakeLists.txt/base64' %}
EOF

find . -type f -name CMakeLists.txt | while read l; do
    sed -e 's|Boost::context||g' \
        -e 's|Boost::fiber||g' \
        -e 's|Boost::system||g' \
        -e 's|TRDP::gperf||g' \
        -e 's|TRDP::lua||g' \
        -e 's|TRDP::mimalloc||g' \
        -e 's|TRDP::rapidjson||g' \
        -e 's|TRDP::uring||g' \
        -e 's|absl::flat_hash_map||g' \
        -e 's|absl::random_random||g' \
        -e 's|absl::str_format||g' \
        -e 's|absl::strings||g' \
        -e 's|glog::glog||g' \
        -i ${l}
done
{% endblock %}
