---
layout: module
title: Holiday Module

category: addon-module

module_name: Holiday
module_path: holidays
module_creator: Jacques Archimède (Eureka)
module_devs: Jacques Archimède (Eureka)<br />& D. Keith Casey, Jr (caseysoftware)
module_version: 1.1.0
module_source: https://github.com/web2project/modules-holiday
module_download: https://github.com/web2project/modules-holiday/archive/holiday-v1.1.zip
---

## Module Overview

This module allows you to set the working time of your company and your users based on standard calendar for your country and your region.

This module integrates the [PEAR Date_Holidays package library](http://pear.php.net/package/Date_Holidays/) for calculating public holidays.

## INSTALLATION

1. To install this module, please follow the standard module installation procedure. Download the latest version from Sourceforge and unzip this directory into your web2project/modules directory.
1. Select to System Admin -> View Modules and you should see "holiday" near the bottom of the list.
1. On the "Holiday" row, select "install". The screen should refresh. Now select "hidden" and then "disabled" to make it display in your module navigation.

## Release Notes

### Updated in 1.1

*  Removed numerous methods that are now implemented in core
*  Minor improvements to layout and CSS

### Updated in 1.0

*  Initial release for web2project

### Open Issues:

1.  No known issues.

### Development Status

*  v1.0 Conversion to web2project: May 2011
*  <s>v0.2 Original Development for dotproject: December 2008</s>

## Additional Notes

The public holidays for a country is implemented as a "Driver". The following drivers are available:

* Australia (Sam Wilson <sam@archives.org.au>)
* Western Australia (Sam Wilson <sam@archives.org.au>)
* Austria (Klemens Ullmann <klemens@ull.at>)
* Brazil (Igor Feghali <ifeghali@php.net>)
* Croatia (Valentin Vidic <Valentin.Vidic@CARNet.hr>)
* Denmark (Henrik Hansen <hh@fsck.dk>)
* England Wales (Tim Dodge <timmy@invisibles.org>)
* France (Jacques Archimède <eureka@dbmail.com>)
* Germany (Carsten Lucke <luckec@tool-garage.de>)
* Iceland (Ken Guest <kguest@php.net>)
* Ireland (Ken Guest <kguest@php.net>)
* Italy (Valerio Pulese <valerio@dei.unipd.it>)
* Japan (Hideyuki Shimooka <shimooka@doyouphp.jp>)
* Netherlands (Jos van der Woude <jos@veerkade.com>)
* New Zealand (sasquatch58)
* Norway (Vegard Fiksdal <fiksdal@sensorlink.no>)
* Portugal (Klemens Ullmann <klemens@ull.at>)
* Romania (Ken Guest <kguest@php.net>)
* SanMarino (Andrea Venturi <a.venturi@gmail.com>)
* Slovenia (Jakob Munih <jakob.munih@obala.si>)
* Spain (Jesús Espino <jespinog@gmail.com>)
* Sweden (Anders Karlsson <anders.x.karlsson@tdcsong.se>)
* UNO (Carsten Lucke <luckec@tool-garage.de>)
* USA (Kevin English <kevin@x5dev.com>)
* Ukraine (Ken Guest <kguest@php.net>)
* Venezuela (Alan Mizrahi)

Some of these drivers are based on special drivers:

* Christian (Carsten Lucke <luckec@tool-garage.de>)
* Composite (Carsten Lucke <luckec@tool-garage.de>)
* Discordian (Stephan 'Da:Sourcerer' Hohmann <webmaster@dasourcerer.net>)
* Eastern Christian (Ken Guest <ken@linux.ie>)
* Islamic (Eureka <eureka@dbmail.com>)
* Jewish (Carsten Lucke <luckec@tool-garage.de>)