#!/bin/bash
#python_dep_packages
#for i in atlas atlas-devel bzip2 bzip2-devel cracklib cracklib-devel cracklib-python cups cups-devel dbus gdal gdal-devel gdbm gdbm-devel gnome-packagekit gpgme gpgme-devel gtk+ gtk+_devel hdf5 hdf5-devel ip-python lapack lapack-devel libcurl libcurl-devel libffi libffi-devel libiscsi libiscsi-devel libiscsi-utils libjpeg lib-jpeg-devel libproxy libproxy-python libreport libreport-devel libreport-python libselinux libselinux-python libsmbclient libsmbclient-devel libtalloc libtalloc-devel libuser libuser-python libwnck libwnck-devel libxml2 libxml2-devel libxslt libxslt-devel libxslt-python lzo lzo-devel openblas openblas-devel openldap openldap-devel policycoreutils-python pygobject2 pygpgme pygtk2 pygtk2-devel pytalloc pytalloc-devel python-ethtool python-gudev python-hwdata python-krbV python-ldap python-sshconfig pywebkitgtk pyxf86config setools setools-devl setools-libs setolls-libs-python sos sshd subversion uniODBC-devel vte vte-devel wireless-tools

#do
# echo $i
# sudo pip install $i
#sudo pip3 install $i
#done;

#python_packages
#for j in `cat /tmp/pypkgs.txt`
for j in Cython abrt acutil atk audit auparse beaker bonobo cairocffi Canvas cas cracklib pycrypto pycups pycurl dateutils pydbus decorator dmidecode egg email python-ldap flock folium pkgconfig gdal gdbm iniparse ipython xmpppy jinja2 kerberos logging lxml orca ORBit paramiko pydocs pygst_utils py-notify pyodbc pysolr pytz pyzmq readline python-space pyinsane numpy scipy scikit-learn setools slip pysmbc svn test theano timing tornado vincent wsgiref pyaml cookiecutter luigi ansible statsmodels keras

do
# echo $j
  sudo pip install $j
#sudo pip3 install $j
done

Cython
abrt
acutil 
atk 
audit 
auparse 
beaker
bonobo 
cairocffi
Canvas
cas
cracklib
pycrypto #Crypto
pycups # cups # cupsext # cupshelpers
pycurl #curl
dateutils
pydbus
decorator
dmidecode
egg
email
python-ldap
flock
folium
pkgconfig
gdal
gdbm - RPM
iniparse
ipython==5.3
xmpppy #- jabber
jinja2
kerberos
logging
lxml
orca
ORBit
paramiko
pydocs
pygst_utils
py-notify
pyodbc
pysolr
pytz
pyzmq
readline
python-space
pyinsane #- scanext
numpy
scipy
scikit-learn
setools
slip
pysmbc
svn
test
theano
timing
tornado
vincent
wsgiref
pyaml
cookiecutter
luigi
ansible
statsmodels
keras


