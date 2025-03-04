{% extends '//die/c/cmake.sh' %}

{% block bld_tool %}
bin/dxsc
bld/perl
pip/jinja2
bin/glslang
bld/wayland
bld/pzd/des
pip/ruamel.yaml
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/openssl
lib/wayland
{% endblock %}

{% block bld_libs %}
lib/kernel
lib/shim/fake/pkg(pkg_name=xcb-dri2,pkg_ver=100500)
lib/shim/fake/pkg(pkg_name=xcb-dri3,pkg_ver=100500)
lib/shim/fake/pkg(pkg_name=xcb-present,pkg_ver=100500)
lib/shim/fake/pkg(pkg_name=xrandr,pkg_ver=100500)
lib/shim/fake/pkg(pkg_name=xshmfence,pkg_ver=100500)
{% endblock %}

{% block cmake_flags %}
PAL_BUILD_DRI3=OFF
PAL_XCB_REQUIRED=OFF
BUILD_WAYLAND_SUPPORT=On
{% endblock %}

{% block cpp_defines %}
ACCESSPERMS=0777
{% endblock %}

{% block patch %}
sed -e 's|.*PAL_XCB_REQUIRED ON.*||' \
    -i ../pal/src/core/os/amdgpu/include/CMakeLists.txt
{% endblock %}

{% block bld_data %}
aux/git/v3(src_path=GIT1,parent_id=amdvlk1_,repo=https://github.com/GPUOpen-Drivers/xgl,commit=393503c25d5cf32828bc6d954a3a218dbcbfd085,sha=5b6ad1fbff5b83f10daee2e7ec174890914d5f2c17a1b7f4ba50b4c3081549ce)
aux/git/v3(src_path=GIT2,parent_id=amdvlk2_,repo=https://github.com/GPUOpen-Drivers/pal,commit=cc31c8a8915e416185551dae494d49bdbf16fcbd,sha=d2c264d49ba639a720a91ff806c2565fcd14c28918bdb3598e88318fafb20fb9)
aux/git/v3(src_path=GIT3,parent_id=amdvlk3_,repo=https://github.com/GPUOpen-Drivers/llpc,commit=eaf7c1d444cbf7f4ca31dfd24d213632afdae3ab,sha=48424361b75d9be4213311e8055c06e7210cb150ecef8bd87799af83880f10a4)
aux/git/v3(src_path=GIT4,parent_id=amdvlk4_,repo=https://github.com/GPUOpen-Drivers/gpurt,commit=d142df384ebb5ef818e7b001a2d2523633a17cda,sha=c2700a61be064222b87e3175351f61f22de71b7a85673e3aef675790b5d8250e)
aux/git/v3(src_path=GIT5,parent_id=amdvlk5_,repo=https://github.com/GPUOpen-Drivers/llvm-project,commit=a1231d2f58522ed0170f492c804a7f01f2708c50,sha=a578b40ca0f1a8db0105c8a99a60e6f6ac9f3b54f43b83e37be7d57419530c52)
aux/git/v3(src_path=GIT6,parent_id=amdvlk6_,repo=https://github.com/GPUOpen-Drivers/MetroHash,commit=18893fb28601bb9af1154cd1a671a121fff6d8d3,sha=337a3d92f2e44a4d01fafe0ece0a3544dbaa801e7759b83eecee4ad5fb9f5d2c)
aux/git/v3(src_path=GIT7,parent_id=amdvlk7_,repo=https://github.com/GPUOpen-Drivers/CWPack,commit=4f8cf0584442a91d829d269158567d7ed926f026,sha=273c13c63e38edf03aa905beee1814fbeb181f9461fd4405973d5c15575a85ba)
{% endblock %}

{% block step_unpack %}
mkdir src
cd src
mkdir xgl
pushd xgl
des ${GIT1} .
popd
mkdir pal
pushd pal
des ${GIT2} .
popd
mkdir llpc
pushd llpc
des ${GIT3} .
popd
mkdir gpurt
pushd gpurt
des ${GIT4} .
popd
mkdir llvm-project
pushd llvm-project
des ${GIT5} .
popd
mkdir -p third_party/metrohash
pushd third_party/metrohash
des ${GIT6} .
popd
mkdir -p third_party/cwpack
pushd third_party/cwpack
des ${GIT7} .
popd
cd xgl
{% endblock %}
