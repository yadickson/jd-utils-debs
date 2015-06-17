# jdownloader-utils-debs
Build Debian Package for JDownloader Appwork Utils

**Instructions**

Inside of the debs folder

**Gets orig source code**

```
debian/rules get-orig-source
```

**Check dependencies**

```
dpkg-checkbuilddeps
```

**Build source package**

```
debuild -S -nc -uc -us
```

**Tested**

```
Debian jessie
```

