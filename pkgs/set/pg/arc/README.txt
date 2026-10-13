Personal Arc client overlay, installed as an additional system-realm package:
  ./ix mut system +set/pg/arc

set/pg/arc/client fetches the arc binary from the lab's private s3, bucket pg
(https://s3.lab.mesh/pg/arc/<sha256>/arc), and checks its SHA256 like any
other source. s3.lab.mesh answers only inside our networks. The binary was
built on merlin with ya make -r --musl (arc version 21637152); it is not a
public source, so the recipe assembles the URL with Jinja to keep it out of
pkgs/die/scripts/urls.txt (whose entries the lab mirrors into the public
pkgsrc CAS), and set/pg/arc stays out of set/ci (CI results go to the public
package cache). To update: PUT the new binary to pg/arc/<sha256>/arc on
s3.lab.mesh and change arc_sha in client/ix.sh.

bin/fusermount/sud provides the non-setuid helper bridge using existing sud.
No dependency or configuration is added to set/pg/system.

The arc_mount servant runs arc mount -F /home/pg/1 as pg. The root launcher
sets RLIMIT_NOFILE to 65536 before dropping privileges. Logs are in
/var/run/arc_mount/std/current. The ordinary background arc mount is not
suitable here: Stalix pid1 kills unregistered adopted children (killStale).
The foreground mount stays in the supervised process tree and is restarted
after exit. No SSH session is needed to keep it alive. Its srv_deps is
set/pg/arc/runit/deps (scripts, client, fusermount bridge): the hub's uid is in
the run file, so a rebuilt arc client restarts the mount on the new binary.

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
