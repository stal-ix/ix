Personal Arc client overlay, installed as an additional system-realm package:
  ./ix mut system +set/pg/arc

set/pg/arc/client imports a COPY of /home/pg/arc-musl/arc into the package and
checks the expected SHA256. This is a local artifact import, so its build
needs access to that file outside the normal source isolation. The binary
is not stored in this repository and cannot be rebuilt by public CI without
the separately obtained artifact. It was built on merlin with ya make -r
--musl at fb40f49c3c90952ad54c896c9ad83f13239eab82.

bin/fusermount/sud provides the non-setuid helper bridge using existing sud.
No dependency or configuration is added to set/pg/system.

The arc_mount servant runs arc mount -F /home/pg/1 as pg. The root launcher
sets RLIMIT_NOFILE to 65536 before dropping privileges. Logs are in
/var/run/arc_mount/std/current. The ordinary background arc mount is not
suitable here: Stalix pid1 kills unregistered adopted children (killStale).
The foreground mount stays in the supervised process tree and is restarted
after exit. No SSH session is needed to keep it alive.

To stop the supervised mount, remove this overlay with
  ./ix mut system -set/pg/arc
An arc unmount alone will be followed by the servant starting it again.

Arc uses its existing user credentials and store under /home/pg/.arc.
Do not recursively scan the mounted repository; inspect known paths only.

Corporate DNS and explicit VPN routes must reach these service endpoints:
  arc-vcs.yandex-team.ru:5624
  pulld.arc-vcs.yandex-team.ru:7059
  crypto.arc-vcs.yandex-team.ru:5629
  arcanum.yandex.net:443
Home's VPN uses route_yandex_networks=true, covering the Yandex/Yandex.Cloud
address ranges rather than individual service addresses. DNS and ordinary
endpoint changes within those networks require no manual route additions.
