
---

## Available Hooks

Hooks are how we provide access to specific features and functionality in a standardized way. While no hooks are required in your custom module, they're generally useful.

{% assign items = site.docs | where:"category","hooks" %}

{% include dual-columns.md %}

### Available Since v3.0 (September 2013)

* Workflow Hooks (pre-create, post-create, pre-delete, post-delete, pre-load, post-load, pre-store, post-store, pre-update, post-update)

### Available Since v1.1 (September 2009)

* Calendar Hook
* Cron Hook
* Search Hook