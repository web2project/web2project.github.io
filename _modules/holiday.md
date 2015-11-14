---
layout: page
title: Holiday Module

category: addon-module
---

Module Info
 |mod_name = Holiday
 |mod_foldername = holidays
 |mod_original_dev = D. Keith Casey, Jr
 |mod_current_dev = D. Keith Casey, Jr & Jacques Archimède (Eureka)
 |mod_latest_version = 1.0
 |mod_depends_on = n/a
 |mod_download = https://github.com/eureka2/web2project-holiday

== Module Overview ==

This module allows you to set the working time of your company and your users based on standard calendard for your country and your region.
This module integrates the [http://pear.php.net/package/Date_Holidays/ PEAR Date_Holidays package library] for calculating public holidays.

The public holidays for a country is implemented as a "Driver".
The following drivers are availables :
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

This module is available for download here: https://github.com/eureka2/web2project-holiday

== INSTALLATION ==

1. To install this module, please follow the standard module installation
procedure. Download the latest version from Sourceforge and unzip
this directory into your web2project/modules directory.

2. Select to System Admin -> View Modules and you should see "holiday" near
the bottom of the list.

3. On the "Holiday" row, select "install". The screen should refresh. Now
select "hidden" and then "disabled" to make it display in your module
navigation.

4. Open the Date class with your favourite editor:
vi /path/to/web2project/classes/w2p/Utilities/Date.class.php

5. Paste the following in the beginning of the isWorkingDay function (Line 148)

    if ($AppUI->isActiveModule('holiday')) {
        // Holiday module, check the holiday database
        require_once W2P_BASE_DIR."/modules/holiday/holiday_functions.class.php";
        if(HolidayFunctions::isHoliday($this)) {
            return false;
        }
    }

== Release Notes ==

=== 1.0 ===

* First stable release

== Known/Open Issues ==

== Development Status ==

*  v1.0 First stable release: 2011 May

[[Category:Add On Modules]]