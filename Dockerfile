FROM scratch

COPY root /

COPY system /system

COPY vendor /vendor

ENTRYPOINT ["/init", "qemu=1", "androidboot.hardware=goldfish"]
