{% extends '//mix/meson.sh' %}

{% block fetch %}
#https://gitlab.freedesktop.org/mesa/mesa/-/archive/a825e59d40fa1a7871e76c18d12ca86a2c31fe00/mesa-a825e59d40fa1a7871e76c18d12ca86a2c31fe00.tar.bz2
#sha:8d760cb72f4db081cae48aacbc0d275851fe5c6306279ac952b0dda38b4b530b
#good

#https://gitlab.freedesktop.org/mesa/mesa/-/archive/439a59ae15549ab5c10aff1846629ac0c9980d4f/mesa-439a59ae15549ab5c10aff1846629ac0c9980d4f.tar.bz2
#sha:2a700052b831ab0d84e8ba1dd6d0cf9a489357e155edf3eaa2291534ff3f3079
#bad

#https://gitlab.freedesktop.org/mesa/mesa/-/archive/1dcb9e3037e183b7a49d4a38bf4dbad84dc4e3e7/mesa-1dcb9e3037e183b7a49d4a38bf4dbad84dc4e3e7.tar.bz2
#sha:3f453b55bf203c4ae607c3e6a5c2c7ff7bd4f6393b75ac9626888b6b3a6c1b90
#bad

#https://gitlab.freedesktop.org/mesa/mesa/-/archive/5a3785ddd67a778459bdf5c40e7ec548fe5360b2/mesa-5a3785ddd67a778459bdf5c40e7ec548fe5360b2.tar.bz2
#sha:23e78d306c00cec83f0647ea1cb08f761776a15eab6a54f4d0e3f2547fd8048a
#bad

#https://gitlab.freedesktop.org/mesa/mesa/-/archive/b668ccaf0a55ef95fd77c2eda15caf1b9bac18c7/mesa-b668ccaf0a55ef95fd77c2eda15caf1b9bac18c7.tar.bz2
#sha:a85e19d9379a3a80407d18890507f97cbecc1811c13c252aa2619e82420b136b
#good?

#https://gitlab.freedesktop.org/mesa/mesa/-/archive/252553435161fa78781006ecce4b92c5ef1a99ac/mesa-252553435161fa78781006ecce4b92c5ef1a99ac.tar.bz2
#sha:217a97e8e962e11a776bfd1b7ac62084601aefa7bc1d38352c854db253b865c2
#bad

#https://gitlab.freedesktop.org/mesa/mesa/-/archive/40594009442b69ec84014bf8f86dc6448b175b70/mesa-40594009442b69ec84014bf8f86dc6448b175b70.tar.bz2
#sha:16d27ee5af8d6d143ca907d879854bf6125d4ebffcb91c063e5c35c808fdc95c
#good

#https://gitlab.freedesktop.org/mesa/mesa/-/archive/e23a7c05daf2d611ded481d10c2f2c9301445bb1/mesa-e23a7c05daf2d611ded481d10c2f2c9301445bb1.tar.bz2
#sha:ee323750403009ea4c6c24744f0f75665b8ca3f35f10b6f4dbc49c8708fb0a72
#good

https://gitlab.freedesktop.org/mesa/mesa/-/archive/bbd7f4ff9761b5a2bb5bfb4e56effe204457c3d1/mesa-bbd7f4ff9761b5a2bb5bfb4e56effe204457c3d1.tar.bz2
sha:709a822c08e73f2bb2b138ed53bfbed7f546e6ab1cf0d393616f54c114805576
#?

#https://gitlab.freedesktop.org/mesa/mesa/-/archive/mesa-22.0.1/mesa-mesa-22.0.1.tar.bz2
#sha:fb38c479ddba37276064116e34ab72d95435148acc9fc81662786bb0c2c1c8b7

#https://gitlab.freedesktop.org/mesa/mesa/-/archive/mesa-22.0.2/mesa-mesa-22.0.2.tar.bz2
#sha:600f4ae87b9c9d5ce6aed5ebaf776549fdb304bceea97a82122b5e4e6b94e4cf

#https://gitlab.freedesktop.org/mesa/mesa/-/archive/mesa-22.0.3/mesa-mesa-22.0.3.tar.bz2
#sha:5d074e1d548f77bcb6d0cc400a40ab6bb21639877e70da1f4d91fa3c3c96e0af

#https://archive.mesa3d.org/mesa-22.0.4.tar.xz
#sha:c7971f58fa826e474617cda53250c6600fce60994b9fac5b641522e21f471ed4

#https://gitlab.freedesktop.org/mesa/mesa/-/archive/mesa-22.1.0-rc5/mesa-mesa-22.1.0-rc5.tar.bz2
#sha:87e0bc0050ec8ac58c63c73ccc8296cbbb24d5ba42b170c9bccd9f765bacb75d
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/drm
lib/expat
lib/wayland
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}

{% block bld_libs %}
pip/Mako
lib/mesa/fakes
{% endblock %}

{% block bld_tool %}
bld/make
bld/flex
bld/bison
bin/wayland/protocols
{% endblock %}

{% block meson_flags %}
valgrind=disabled
libunwind=disabled
platforms=wayland
egl-native-platform=wayland
egl=enabled
glx=disabled
gles2=enabled
opengl=true
gallium-nine=false
cpp_rtti=false
shader-cache=disabled
llvm=disabled
shared-llvm=disabled
{% endblock %}

{% block patch %}
cat << EOF > merge.py
{% include 'merge.py' %}
EOF

python3 ./merge.py src/util/00-mesa-defaults.conf src/amd/vulkan/00-radv-defaults.conf > _
mv _ src/util/00-mesa-defaults.conf

cat << EOF >> src/util/xmlconfig.h
#undef WITH_XMLCONFIG
#define WITH_XMLCONFIG 0
EOF

cat << EOF > bin/install_megadrivers.py
#!$(which sh)
EOF

chmod +x bin/install_megadrivers.py
{% endblock %}

{% block meson_cross %}
{% endblock %}
