---
layout: page
title: Search Hook

category: hooks

redirect_from:  "/docs/search-hook.html"
---

**Available Since**: v1.1 (September 2009)

## Explanation

The **hook_search** method opens a module class to make it searchable to our [SmartSearch](/modules/smartsearch.html) module. By defining a public method called "hook_search" in your module's primary class, you effectively tell the system how it should search your module. While this can be a complicated search involving numerous joins of supporting data - see the Projects module for an example - it can be quite simple also.

Each of the fields is relatively self-explanatory:

* *table* - The table being searched;
* *table_alias* - The abbreviation for the table in the query;
* *table_module* - The module being searched;
* *table_key* - The primary key of the table being searched;
* *table_link* - The full url used to link to a specific data item within the search results;
* *table_title* - The display name of the module, used normally to generate a header for the search results;
* *table_orderby* - The sort field for the search results of the table referenced above;
* *search_fields* - An array of the fields searched from the table(s) referenced;
* *display_fields* - An array of the fields displayed from the table(s) referenced;
* *table_joins* - An array of arrays noting each of the joins applied against the table above;

## Example

A simple example from the [Links Module](https://github.com/web2project/web2project/blob/master/modules/links/links.class.php#L92)

    public function hook_search()
    {
        $search['table'] = 'links';
        $search['table_alias'] = 'l';
        $search['table_module'] = 'links';
        $search['table_key'] = 'link_id'; // primary key in searched table
        $search['table_link'] = 'index.php?m=links&a=addedit&link_id='; // first part of link
        $search['table_title'] = 'Links';
        $search['table_orderby'] = 'link_name';
        $search['search_fields'] = array('l.link_name', 'l.link_url', 'l.link_description');
        $search['display_fields'] = $search['search_fields'];

        return $search;
    }


A more complex example from the [Project Module](https://github.com/web2project/web2project/blob/master/modules/projects/projects.class.php#L915):

    public function hook_search() {
        $search['table'] = 'projects';
        $search['table_alias'] = 'p';
        $search['table_module'] = 'projects';
        $search['table_key'] = 'p.project_id'; // primary key in searched table
        $search['table_link'] = 'index.php?m=projects&a=view&project_id='; // first part of link
        $search['table_title'] = 'Projects';
        $search['table_orderby'] = 'project_name';
        $search['search_fields'] = array(
            'p.project_id', 'p.project_name',
            'p.project_short_name', 'p.project_location', 'p.project_description',
            'p.project_url', 'p.project_demo_url'
        );
        $search['display_fields'] = $search['search_fields'];
        $search['table_joins'] = array(
            array(
                'table' => 'project_contacts',
                'alias' => 'pc',
                'join' => 'p.project_id = pc.project_id'
            )
        );

        return $search;
    }

As you should be able to tell, this code does not perform the search.  Instead, it simply tells the calling code how to search this module.

Assuming this method exists and includes the proper values, the [SmartSearch](/modules/smartsearch.html) module will automatically call this function. No further configuration is necessary.

{% include section-hooks.md %}