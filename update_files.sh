#!/bin/bash
cd "$(dirname "$0")"

TODAY="$(date +"%Y-%m-%d")"

echo "Downloading the Country DB"
rm GeoIP.dat
rm GeoIP.dat.gz
wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
gunzip GeoIP.dat.gz

echo "Downloading the City DB"
rm GeoLiteCity.dat
rm GeoLiteCity.dat.gz
wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
gunzip GeoLiteCity.dat.gz
mv GeoLiteCity.dat GeoIPCity.dat

echo "Downloading country IPV6"
rm GeoIPv6.dat.gz
rm GeoIPv6.dat
wget http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz
gunzip GeoIPv6.dat.gz

echo "Downloading the City IPV6 DB"
rm GeoLiteCityv6.dat
rm GeoLiteCityv6.dat.gz
wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz
gunzip GeoLiteCityv6.dat.gz
mv GeoLiteCityv6.dat GeoCityv6.dat 

echo "Downloading ASN DB"
rm GeoIPASNum.dat
rm GeoIPASNum.dat.gz
wget http://download.maxmind.com/download/geoip/database/asnum/GeoIPASNum.dat.gz
gunzip GeoIPASNum.dat.gz

echo "Downloading ASN DB"
rm GeoIPASNumv6.dat
rm GeoIPASNumv6.dat.gz
wget http://download.maxmind.com/download/geoip/database/asnum/GeoIPASNumv6.dat.gz
gunzip GeoIPASNumv6.dat.gz



git commit -am "UPDATED the GeoIP databases for $TODAY"
git push origin master
