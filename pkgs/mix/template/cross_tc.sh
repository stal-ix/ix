{% block setup_host_tc %}
mkdir tc; cd tc

(
    set -eu

    setup_tc "${MIX_H_DIR}" host
)

export HOST_CC=${PWD}/host/cc
export HOST_CXX=${PWD}/host/c++
export HOST_AR=${PWD}/host/ar
export HOST_NM=${PWD}/host/nm
export HOST_RANLIB=${PWD}/host/ranlib
{% endblock %}

{% block setup_target_tc %}
setup_tc "${MIX_T_DIR}" target
{% endblock %}

for x in cc gcc c99 clang; do
    ln -s target/cc ${x}
done

for x in c++ g++ clang++; do
    ln -s target/c++ ${x}
done

for x in cpp clang-cpp; do
    ln -s target/preproc ${x}
done

for x in ar nm ranlib; do
    ln -s target/${x} ${x}
done

export LDFLAGS=
export CFLAGS=
export CPPFLAGS=
export CXXFLAGS=
export CONLYFLAGS=

export PATH="${PWD}:${PATH}"

cd ..
