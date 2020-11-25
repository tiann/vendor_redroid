# How To Build

## Get Source
  - `repo init -u git@github.com:remote-android/platform_manifests.git -b redroid-8.1.0 && repo sync`

## Build
  - `docker run -it --rm -v <ReDroid Root>:/src <Docker image>`
  - `cd /src && ./prebuilts/misc/linux-x86/ccache/ccache -m 50G && . build/envsetup.sh` (only need setup once)
  - `lunch <TARGET>`
  - `make`
  - [Tip] use `make installclean` in favor of `make clean`

## Run
`docker run -v ~/data:/data -itd -p 5900:5900 -p 5555:5555 --rm --memory-swappiness=0 --privileged -v $REPO/out/target/product/redroid_x86_64/system:/system <IMAGE>`

