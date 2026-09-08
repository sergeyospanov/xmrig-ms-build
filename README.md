# XMRig — optimized builds

Optimized community builds of [XMRig](https://github.com/xmrig/xmrig) v6.26.0 with performance-oriented toolchain settings.

## Builds
- **Windows x64 (MSVC)** — `xmrig-6.26.0-windows-msvc-x64-optimized.zip`
- **Linux x86_64 / HiveOS** — `xmrig-6.26.0-hiveos-x64-optimized.zip` (fully static binary + HiveOS custom-miner package: `h-manifest.conf`, `h-run.sh`, `h-config.sh`, `h-stats.sh`)

Download the latest archive from [releases](https://github.com/sergeyospanov/xmrig-ms-build/releases).

## HiveOS install
HiveOS → Miners → Custom → Add, and enter the direct download URL of the Linux archive from the release.

## Building from source
Standard XMRig CMake flow (see upstream docs), e.g. for Linux:

```
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DBUILD_STATIC=ON
cmake --build build -j
```

## Upstream
Based on [XMRig](https://github.com/xmrig/xmrig) by [xmrig](https://github.com/xmrig) and [sech1](https://github.com/SChernykh), distributed under the GNU General Public License v3.
