[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

# ttyd - Share your terminal over the web ![backend](https://github.com/tsl0922/ttyd/workflows/backend/badge.svg) ![frontend](https://github.com/tsl0922/ttyd/workflows/frontend/badge.svg)

ttyd is a simple command-line tool for sharing terminal over the web.

# Optional

I've included the minio client binary file(mc) in this repo. Head over to [heroku-minio](https://github.com/capriciousduck/heroku-minio) to host your own MinIO server on Heroku. Remember to make a HTTP request to your app, for example, from UptimeRobot to prevent the dyno from sleeping.

![screenshot](https://github.com/tsl0922/ttyd/raw/master/screenshot.gif)

# Features

- Built on top of [Libwebsockets](https://libwebsockets.org) with [libuv](https://libuv.org) for speed
- Fully-featured terminal based on [Xterm.js](https://xtermjs.org) with [CJK](https://en.wikipedia.org/wiki/CJK_characters) and IME support
- Graphical [ZMODEM](https://en.wikipedia.org/wiki/ZMODEM) integration with [lrzsz](https://ohse.de/uwe/software/lrzsz.html) support
- SSL support based on [OpenSSL](https://www.openssl.org)
- Run any custom command with options
- Basic authentication support and many other custom options
- Cross platform: macOS, Linux, FreeBSD/OpenBSD, [OpenWrt](https://openwrt.org), Windows


## Command-line Options For Use In Dockerfile

```
ttyd is a tool for sharing terminal over the web

USAGE:
    ttyd [options] <command> [<arguments...>]

VERSION:
    1.6.1

OPTIONS:
    -p, --port              Port to listen (default: 7681, use `0` for random port)
    -i, --interface         Network interface to bind (eg: eth0), or UNIX domain socket path (eg: /var/run/ttyd.sock)
    -c, --credential        Credential for Basic Authentication (format: username:password)
    -u, --uid               User id to run with
    -g, --gid               Group id to run with
    -s, --signal            Signal to send to the command when exit it (default: 1, SIGHUP)
    -a, --url-arg           Allow client to send command line arguments in URL (eg: http://localhost:7681?arg=foo&arg=bar)
    -R, --readonly          Do not allow clients to write to the TTY
    -t, --client-option     Send option to client (format: key=value), repeat to add more options
    -T, --terminal-type     Terminal type to report, default: xterm-256color
    -O, --check-origin      Do not allow websocket connection from different origin
    -m, --max-clients       Maximum clients to support (default: 0, no limit)
    -o, --once              Accept only one client and exit on disconnection
    -B, --browser           Open terminal with the default system browser
    -I, --index             Custom index.html path
    -b, --base-path         Expected base path for requests coming from a reverse proxy (eg: /mounted/here)
    -6, --ipv6              Enable IPv6 support
    -S, --ssl               Enable SSL
    -C, --ssl-cert          SSL certificate file path
    -K, --ssl-key           SSL key file path
    -A, --ssl-ca            SSL CA file path for client certificate verification
    -d, --debug             Set log level (default: 7)
    -v, --version           Print the version and exit
    -h, --help              Print this text and exit

Visit https://github.com/tsl0922/ttyd to get more information and report bugs.
```

Read the example usage on the [wiki](https://github.com/tsl0922/ttyd/wiki/Example-Usage).

# Reference
https://github.com/tsl0922/ttyd

Thanks to *tsl0922*.
