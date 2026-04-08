{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/tsl0922/ImPlay
{% endblock %}

{% block pkg_name %}
implay
{% endblock %}

{% block version %}
1.5.1
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
ceb22d0cae0cd9aa24219a9c0e411aac0b80940935714108e45f221fb7cd4d5d
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/fmt
lib/mpv
lib/glfw
lib/dbus
lib/opengl
lib/freetype
lib/glfw/deps
lib/shim/fake(lib_name=GLX)
lib/shim/fake(lib_name=glfw)
lib/shim/fake(lib_name=OpenGL)
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}

{% block patch %}
# use Wayland instead of X11
sed -i 's|GLFW_EXPOSE_NATIVE_X11|GLFW_EXPOSE_NATIVE_WAYLAND|' include/window.h

# use system fmt instead of vendored (broken with clang 21)
sed -i 's|add_subdirectory(third_party/fmt)|find_package(fmt REQUIRED)|' CMakeLists.txt

# drop forced EGL context API — let GLFW auto-detect on Wayland
sed -i '/GLFW_CONTEXT_CREATION_API/d' source/window.cpp
{% endblock %}

{% block cmake_flags %}
USE_PATCHED_GLFW=OFF
USE_XDG_PORTAL=ON
#USE_OPENGL_ES3=ON
{% endblock %}
