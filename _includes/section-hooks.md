
---

## Extending the System

Hooks are how we extend the system by allowing you to connect into specific processes and actions in standard, consistent ways with minimal effort without modifying Web2project core. This ensures you can accomplish what you need and your modules remain compatible through Web2project upgrades.

{% assign items = site.docs | where:"category","hooks" %}

{% include dual-columns.md %}

### Available Since v3.0 (September 2013)

* Workflow Hooks (pre-create, post-create, pre-delete, post-delete, pre-load, post-load, pre-store, post-store, pre-update, post-update)

### Available Since v1.1 (September 2009)

* Calendar Hook
* Cron Hook
* Search Hook