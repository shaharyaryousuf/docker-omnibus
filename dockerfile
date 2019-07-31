FROM amd64/centos:7.5.1804
RUN yum -y update
RUN yum -y install at atk audit avahi bc bind bind-utils cairo compat-glibc compat-libstdc++-33 compat-libstdc++-33.i686 dbus ed expat fontconfig freetype gcc gdk glib2 glibc glibc-devel glibc-headers gtk2 krb5 ksh libaio libcanberra-gtk2 libcap libcom_err libdb libdrm libffi libgcc libpng12 libselinux libsepol libSM libstdc++ libstdc++.i686 libthai libtiff libuuid libverto libX11 libXau libxcb libXcomposite libXcursor libXdamage libXext libXfixes libXft libXi libXinerama libXmu libXp libXpm libXrandr libXrender libxshmfence libXt libXtst libXxf86vm lsof mesa-libEGL mesa-libgbm mesa-libGL mesa-liblapi mlocate motif motif.i686 nc net net-tools nspr nss nss-softokn ntp openssh-clients openssl pam pam.i686 pango patch pcre perl perl-Sys-Syslog pixman psmisc python rsync spax sysstat telnet time yum-utils zip zlib unzip
COPY omni.zip /
RUN chmod -R 777 /omni.zip
RUN cd / && unzip omni.zip
RUN cd / && chmod -R 777 /sf_psxbuild
RUN cd / && chmod -R 777 /sf_software
RUN cd /sf_psxbuild/psx-omnibus/ && bash -c /sf_psxbuild/psx-omnibus/os.sh
RUN echo $(grep $(hostname) /etc/hosts | cut -f1) omnibus >> /etc/hosts && cd /sf_psxbuild/psx-omnibus/ && bash -c /sf_psxbuild/psx-omnibus/install.sh
CMD /etc/init.d/nco start | sleep inf
EXPOSE 4100/tcp