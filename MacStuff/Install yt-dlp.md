
# How to install [yt-dlp](https://github.com/yt-dlp/yt-dlp) on Mac & Linux

## I have found this to be the be the best way to install yt-dlp on Mac, and offers greatest global functionality.

<br>

**Curl the python executable from yt-dlp github**
```bash
curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o ~/.local/bin/yt-dlp

chmod a+rx ~/.local/bin/yt-dlp  # Make executable
```

**It is not globally executable from `~/.local/bin`**

<br>

**So you must either move it, or copy it to an established executable part in `$PATH`**

**`/usr/local/bin` is perfect, and in this example we are copying it**

```bash
sudo cp -p /Users/chris/.local/bin/yt-dlp /usr/local/bin/
```

**Now `yt-dlp` has been copied to `/usr/local/bin` and is globally executable without having to do `python3 ~/.local/bin/yt-dlp`**

## On Linux, it's sligtly different
```bash
# do not need the ~ tilda prefixed to /usr/...

sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp

sudo chmod a+rx  /usr/local/bin/yt-dlp

```
