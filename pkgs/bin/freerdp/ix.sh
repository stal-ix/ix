{% extends '//die/c/cmake.sh' %}

{#
FAILED: client/Wayland/CMakeFiles/wlfreerdp.dir/wlfreerdp.c.o
/home/pg/ix_root/build/5USs4PEJGPWIfvoH/bin/tc/clang -DFREERDP_EXPORTS -DHAVE_CONFIG_H -DWINPR_EXPORTS -DWITH_OPENSSL -D_FILE_OFFSET_BITS=64 -I/home/pg/ix_root/build/5USs4PEJGPWIfvoH/obj -I/home/pg/ix_root/build/5USs4PEJGPWIfvoH/obj/include -I/home/pg/ix_root/build/5USs4PEJGPWIfvoH/src/include -I/home/pg/ix_root/build/5USs4PEJGPWIfvoH/src/winpr/include -I/home/pg/ix_root/build/5USs4PEJGPWIfvoH/obj/winpr/include -I/home/pg/ix_root/build/5USs4PEJGPWIfvoH/src/rdtk/include -I/home/pg/ix_root/build/5USs4PEJGPWIfvoH/obj/rdtk/include -I/home/pg/ix_root/build/5USs4PEJGPWIfvoH/src/uwac/include -Wno-unused-parameter -Wno-unused-macros -Wno-padded -Wno-c11-extensions -Wno-gnu -Wno-unused-command-line-argument -Wno-deprecated-declarations -fno-omit-frame-pointer -O3 -DNDEBUG -fPIE -MD -MT client/Wayland/CMakeFiles/wlfreerdp.dir/wlfreerdp.c.o -MF client/Wayland/CMakeFiles/wlfreerdp.dir/wlfreerdp.c.o.d -o client/Wayland/CMakeFiles/wlfreerdp.dir/wlfreerdp.c.o -c /home/pg/ix_root/build/5USs4PEJGPWIfvoH/src/client/Wayland/wlfreerdp.c
/home/pg/ix_root/build/5USs4PEJGPWIfvoH/src/client/Wayland/wlfreerdp.c:637:19: error: incompatible function pointer types assigning to 'OBJECT_NEW_FN' (aka 'void *(*)(void *)') from 'void *(const void *)' [-Wincompatible-function-pointer-types]
  637 |         obj->fnObjectNew = uwac_event_clone;
      |                          ^ ~~~~~~~~~~~~~~~~
1 error generated.
#}

{% block fetch %}
https://github.com/FreeRDP/FreeRDP/archive/refs/tags/2.10.0.tar.gz
sha:88fa59f8e8338d5cb2490d159480564562a5624f3a3572c89fa3070b9626835c
#https://github.com/FreeRDP/FreeRDP/archive/refs/tags/2.11.2.tar.gz
#sha:674b5600bc2ae3e16e5b5a811c7d5b0daaff6198601ba278bd15b4cb9b281044
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/usb
lib/faac
lib/alsa
lib/faad2
lib/cairo
lib/ffmpeg
lib/kernel
lib/wayland
lib/openssl
lib/xkbcommon
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block cmake_flags %}
WITH_X11=OFF
WITH_FAAC=ON
WITH_FAAD2=ON
WITH_CAIRO=ON
WITH_SAMPLE=ON
WITH_WAYLAND=ON
WITH_LIBSYSTEMD=OFF
BUILTIN_CHANNELS=ON
{% endblock %}
