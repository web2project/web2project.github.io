
### System Metrics

Here are some core metrics that may be of interest to the geekier among us.

By running these commands, we get the metrics below:

    # Assuming web2project is the your base directory

    php phploc.php --count-tests --exclude=../web2project/lib ../web2project/

    php phpcpd.php --exclude=../web2project/lib/ --exclude=../web2project/unit_tests/ ../web2project/