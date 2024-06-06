{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v25.3.tar.gz
sha:d19643d265b978383352b3143f04c0641eea75a75235c111cc01a1350173180e
{#
broke mingw64 protoc, protoc/c
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v26.0.tar.gz
sha:e32100a8013870d24ffc37dad6781a61e5d0c99501bcb04d39c340a1c44a8e63
#}
{#
ld.lld: error: undefined symbol: __start_pb_defaults
>>> referenced by libprotobuf.a(generated_message_util.cc.o):(.refptr.__start_pb_defaults)
ld.lld: error: undefined symbol: __stop_pb_defaults
>>> referenced by libprotobuf.a(generated_message_util.cc.o):(.refptr.__stop_pb_defaults)
clang++: error: linker command failed with exit code 1 (use -v to see invocation)
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v27.1.tar.gz
sha:6fbe2e6f703bcd3a246529c2cab586ca12a98c4e641f5f71d51fde09eb48e9e7
#}
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
lib/abseil/cpp
{% endblock %}

{% block cmake_flags %}
protobuf_BUILD_TESTS=OFF
protobuf_ABSL_PROVIDER=package
{% endblock %}
