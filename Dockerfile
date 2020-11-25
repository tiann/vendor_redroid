FROM scratch

COPY root /

COPY system /system

ENTRYPOINT ["/init", "qemu=1"]
