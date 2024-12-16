https://pkg.go.dev/go/build
https://pkg.go.dev/cmd/go#hdr-Environment_variables
https://pkg.go.dev/cmd/go#hdr-Build_constraints

Separate files per os or arch.

#### Rules
```plain
filename_GOOS.go
filename_GOARCH.go
filename_GOOS_GOARCH.go

filename_linux_test.go
filename_amd64_test.go
filename_linux_amd64_test.go
```

#### GOOS
```
linux
darwin
windows
netbsd
```

#### GOARCH
```
386    (For GOARCH=386, GO386=387 and GO386=sse2 set the 386.387 and 386.sse2 build tags, respectively.)
amd64  (For GOARCH=amd64, GOAMD64=v1, v2, and v3 correspond to the amd64.v1, amd64.v2, and amd64.v3 feature build tags.)
arm    (For GOARCH=arm, GOARM=5, 6, and 7 correspond to the arm.5, arm.6, and arm.7 feature build tags.)
arm64  (For GOARCH=arm64, GOARM64=v8.{0-9} and v9.{0-5} correspond to the arm64.v8.{0-9} and arm64.v9.{0-5} feature build tags.)
```

