---
layout: page
title: Calendar Hook

category: hooks

redirect_from:  "/docs/calendar-hook.html"
---

**Available Since:** v1.1 (September 2009)

The **hook_calendar** method opens a module class to make date-relevant data available to external code.  While this is only used by the Tasks and Events module in Core, other modules - including Add Ons - could implement it also.

This method - and more importantly the hook_calendar method - returns a list of items specifying the following fields:

*  *id* - This is a unique id for this type of calendar item and is usually just the primary key from the module's core table. It does not have to be globally unique.
*  *name* - This is the name of the calendar item. This is mapped to the iCalendar SUMMARY field.
*  *description* - This is a way of describing the calendar item. If there is no equivalent field within the module, it is the easiest to duplicate the *name* entry here. This is mapped to the iCalendar DESCRIPTION field.
*  *project_id* - If this item maps to a specific Project within web2project, this value can be included. Inclusion of this field will append a link to the Project in the iCalendar DESCRIPTION field and add an ATTACH field with the same link.
*  *task_id* - If this item maps to a specific Task within web2project, this value can be included. Inclusion of this field will append a link to the Task in the iCalendar DESCRIPTION field and add an ATTACH field with the same link.
*  *startDate* - This becomes the DTSTART within the iCalendar entry.
*  *endDate* - This becomes the DTEND within the iCalendar entry.
*  *updatedDate* - This becomes the DTSTAMP within the iCalendar entry.

## Example

This hook is called by the *calendar.php* script to create the [iCalendar](http://en.wikipedia.org/wiki/ICalendar) feed for the system. In the [Calendar Module](https://github.com/caseysoftware/web2project/blob/master/modules/calendar/calendar.class.php#L598), here are the methods of interest:

    public function hook_calendar($userId)
    {
        return $this->getCalendarEvents($userId);
    }

    public function getCalendarEvents($userId, $days = 30)
    {
        $eventList = array();

        $now   = time();
        $nowFormatted = date('Y-m-d H:i:s', $now);
        $Ndays = $now + $days * 24 * 60 * 60;
        $NdaysFormatted = date('Y-m-d H:i:s', $Ndays);

        $events = $this->getEventsInWindow($nowFormatted, $NdaysFormatted, '0000', '2359', array($userId));

        $start = new w2p_Utilities_Date($nowFormatted);
        $end   = new w2p_Utilities_Date($NdaysFormatted);

        foreach($events as $event) {
            for ($j = 0 ; $j <= $event['event_recurs']; $j++) {
                $myDates = $this->getRecurrentEventforPeriod($start, $end, $event['event_start_date'], $event['event_end_date'],
                                $event['event_recurs'], $event['event_times_recuring'], $j);
                /*
                 * This list of fields - id, name, description, startDate, endDate,
                 * updatedDate - are named specifically for the iCal creation.
                 * If you change them, it's probably going to break.  So don't do that.
                 */
                $url = W2P_BASE_URL . '/index.php?m=calendar&a=view&event_id=' . $event['event_id'];
                $eventList[] = array('id' => $event['event_id'], 'name' => $event['event_name'],
                            'sequence' => $event['event_sequence'], 'description' => $event['event_description'],
                            'startDate' => $myDates[0]->format(FMT_DATETIME_MYSQL), 'endDate' => $myDates[1]->format(FMT_DATETIME_MYSQL),
                            'updatedDate' => $event['event_updated'], 'url' => $url);
            }
        }

        return $eventList;
    }

The calendar.php script will automatically call each active module's hook_calendar method without any additional actions from the user.


{% include section-hooks.md %}